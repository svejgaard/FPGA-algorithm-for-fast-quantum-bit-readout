library ieee;
use ieee.std_logic_1164.all;

entity probe_xilinx is port(
	clk 		: in std_logic;
	probe0  	: in std_logic_vector(31 downto 0);
	probe1  	: in std_logic_vector(31 downto 0);
	probe2  	: in std_logic_vector(31 downto 0)
);
end entity probe_xilinx;

architecture behavioral of probe_xilinx is

	component ila_0 is
		port (
			clk 	    : in std_logic;
			probe0      : in std_logic_vector(31 downto 0);
			probe1      : in std_logic_vector(31 downto 0);
			probe2      : in std_logic_vector(31 downto 0)
		);
	end component ila_0;


begin

	u0 : component ila_0
		port map (
			clk 		=> clk,
			probe0  	=> probe0,
			probe1  	=> probe1,
			probe2  	=> probe2
		);

end behavioral;