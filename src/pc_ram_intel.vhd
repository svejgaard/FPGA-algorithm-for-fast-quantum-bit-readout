library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

entity pc_ram_intel is port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	rden			: in std_logic;
	address 		: in std_logic_vector(10 downto 0);

	pc_0			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_1			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_2			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_3			: out std_logic_vector(input_MSB downto 0)				:= (others => '0')
);
end entity pc_ram_intel;


architecture behavioral of pc_ram_intel is

	component ram2048x32_0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_0;
	component ram2048x32_1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_1;
	component ram2048x32_2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_2;
	component ram2048x32_3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_3;

begin

	RAM0 : component ram2048x32_0 port map (
		data 	=> (others => '0'),
		q 		=> pc_0,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	RAM1 : component ram2048x32_1 port map (
		data 	=> (others => '0'),
		q 		=> pc_1,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	RAM2 : component ram2048x32_2 port map (
		data 	=> (others => '0'),
		q 		=> pc_2,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);
	RAM3 : component ram2048x32_3 port map (
		data 	=> (others => '0'),
		q 		=> pc_3,
		address => address,
		wren 	=> '0',
		clock 	=> clk,
		rden	=> rden
	);

end behavioral;