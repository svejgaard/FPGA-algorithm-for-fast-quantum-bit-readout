library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --- signed and unsigned


library work;
use work.data_formats.all;


entity injector_xilinx is 
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
end entity injector_xilinx;


architecture behavioral of injector_xilinx is

	component ram2048x34_0 is
		port (
			dina    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			douta   : out std_logic_vector(33 downto 0);			                    -- dataout
			addra   : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wea     : in  std_logic_vector(0 downto 0)    		    := (others => 'X'); -- wren
			clka    : in  std_logic                     			:= 'X';             -- clk
			ena     : in  std_logic                     			:= 'X'              -- rden
		);
	end component ram2048x34_0;
	component ram2048x34_1 is
		port (
			dina    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			douta   : out std_logic_vector(33 downto 0);			                    -- dataout
			addra   : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wea     : in  std_logic_vector(0 downto 0)    		    := (others => 'X'); -- wren
			clka    : in  std_logic                     			:= 'X';             -- clk
			ena     : in  std_logic                     			:= 'X'              -- rden
		);
	end component ram2048x34_1;
	component ram2048x34_2 is
		port (
			dina    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			douta   : out std_logic_vector(33 downto 0);			                    -- dataout
			addra   : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wea     : in  std_logic_vector(0 downto 0)    		    := (others => 'X'); -- wren
			clka    : in  std_logic                     			:= 'X';             -- clk
			ena     : in  std_logic                     			:= 'X'              -- rden
		);
	end component ram2048x34_2;
	component ram2048x34_3 is
		port (
			dina    : in  std_logic_vector(33 downto 0) 			:= (others => 'X'); -- datain
			douta   : out std_logic_vector(33 downto 0);			                    -- dataout
			addra   : in  std_logic_vector(10 downto 0) 			:= (others => 'X'); -- address
			wea     : in  std_logic_vector(0 downto 0)    		    := (others => 'X'); -- wren
			clka    : in  std_logic                     			:= 'X';             -- clk
			ena     : in  std_logic                     			:= 'X'              -- rden
		);
	end component ram2048x34_3;
	signal trig_registered		: std_logic 						:= '0';
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
			trig_registered <= '0';
			enable <= '0';
			start <= '0';
			counter <= (others => '0');
			rden <= '0';
			address <= (others => '0');
		else 
			trig_registered <= trig;
			if trig_registered = '0' and trig = '1' then
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


	IRX0 : component ram2048x34_0 port map (
		dina    => (others => '0'),
		douta   => ram_out_0,
		addra   => address,
		wea     => "" & '0',
		clka    => clk,
		ena     => rden
	);
	IRX1 : component ram2048x34_1 port map (
		dina    => (others => '0'),
		douta   => ram_out_1,
		addra   => address,
		wea     => "" & '0',
		clka    => clk,
		ena     => rden
	);
	IRX2 : component ram2048x34_2 port map (
		dina    => (others => '0'),
		douta   => ram_out_2,
		addra   => address,
		wea     => "" & '0',
		clka    => clk,
		ena     => rden
	);
	IRX3 : component ram2048x34_3 port map (
		dina    => (others => '0'),
		douta   => ram_out_3,
		addra   => address,
		wea     => "" & '0',
		clka    => clk,
		ena     => rden
	);

end behavioral;