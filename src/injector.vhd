library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --- signed and unsigned


library work;
use work.data_formats.all;


entity injector is 
port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	trig 			: in std_logic;
	start 			: out std_logic 								:= '0';
	sample_A 		: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	sample_B 		: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	sample_C 		: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	sample_D 		: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	sample_valid_A  : out std_logic 								:= '0';
	sample_valid_B  : out std_logic 								:= '0';
	sample_valid_C  : out std_logic 								:= '0';
	sample_valid_D  : out std_logic 								:= '0'
);
end entity injector;


architecture behavioral of injector is

	component intel_ram2048x34_0 is
		port (
			data    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			q       : out std_logic_vector(33 downto 0);			                    -- dataout
			address : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wren    : in  std_logic                     			:= 'X';             -- wren
			clock   : in  std_logic                     			:= 'X';             -- clk
			rden    : in  std_logic                     			:= 'X'              -- rden
		);
	end component intel_ram2048x34_0;
	component intel_ram2048x34_1 is
		port (
			data    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			q       : out std_logic_vector(33 downto 0);			                    -- dataout
			address : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wren    : in  std_logic                     			:= 'X';             -- wren
			clock   : in  std_logic                     			:= 'X';             -- clk
			rden    : in  std_logic                     			:= 'X'              -- rden
		);
	end component intel_ram2048x34_1;
	component intel_ram2048x34_2 is
		port (
			data    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			q       : out std_logic_vector(33 downto 0);			                    -- dataout
			address : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wren    : in  std_logic                     			:= 'X';             -- wren
			clock   : in  std_logic                     			:= 'X';             -- clk
			rden    : in  std_logic                     			:= 'X'              -- rden
		);
	end component intel_ram2048x34_2;
	component intel_ram2048x34_3 is
		port (
			data    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			q       : out std_logic_vector(33 downto 0);			                    -- dataout
			address : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wren    : in  std_logic                     			:= 'X';             -- wren
			clock   : in  std_logic                     			:= 'X';             -- clk
			rden    : in  std_logic                     			:= 'X'              -- rden
		);
	end component intel_ram2048x34_3;

	signal counter 				: unsigned(31 downto 0)				:= (others => '0');
	signal enable   			: std_logic 						:= '0';
	signal address 				: std_logic_vector(10 downto 0) 	:= (others => '0');
	signal rden 				: std_logic 						:= '0';
	signal ram_out_0 			: std_logic_vector(33 downto 0)		:= (others => '0');
	signal ram_out_1 			: std_logic_vector(33 downto 0)		:= (others => '0');
	signal ram_out_2 			: std_logic_vector(33 downto 0)		:= (others => '0');
	signal ram_out_3 			: std_logic_vector(33 downto 0)		:= (others => '0');
begin


TIM0 : process(clk)
begin
	if rising_edge(clk) then
		if reset_n = '0' then
			enable <= '0';
			start <= '0';
			counter <= (others => '0');
			rden <= '0';
			address <= (others => '0');
		else 
			if trig = '1' then
				enable <= '1';
			end if;
			if enable = '1' and (counter < MAX_COUNT_VALUE) then
				counter <= counter + 1;
			end if;
			if counter = MAX_COUNT_VALUE then
				start <= '1';
				rden <= '1';
				enable <= '0';
				counter <= (others => '0');
			end if;

			if rden = '1' then
				address <= std_logic_vector(unsigned(address) + 1);
			end if;
			if unsigned(address) = FINAL_ADDRESS then
				rden <= '0';
				start <= '0';
				address <= (others => '0');
			end if;
		end if;
	end if;
end process;


	sample_A <= ram_out_0(input_MSB downto 0);
	sample_B <= ram_out_1(input_MSB downto 0);
	sample_C <= ram_out_2(input_MSB downto 0);
	sample_D <= ram_out_3(input_MSB downto 0);
	sample_valid_A <= ram_out_0(32);
	sample_valid_B <= ram_out_1(32);
	sample_valid_C <= ram_out_2(32);
	sample_valid_D <= ram_out_3(32);


	IRI0 : component intel_ram2048x34_0 port map (
		data 	=> (others => '0'),
		q 		=> ram_out_0,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	IRI1 : component intel_ram2048x34_1 port map (
		data 	=> (others => '0'),
		q 		=> ram_out_1,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	IRI2 : component intel_ram2048x34_2 port map (
		data 	=> (others => '0'),
		q 		=> ram_out_2,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	IRI3 : component intel_ram2048x34_3 port map (
		data 	=> (others => '0'),
		q 		=> ram_out_3,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);

end behavioral;