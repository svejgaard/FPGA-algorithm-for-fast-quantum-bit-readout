library ieee;
use ieee.std_logic_1164.all;

-- This wrapper block takes std_logic as input/output and convert them in order to give std_logic_vectors to the Intel Source and Probe IP


entity source_and_probe_intel is port(
	clk 		: in std_logic;
	probe  		: in  std_logic;
	source 		: out std_logic 							:= '0'
);
end entity source_and_probe_intel;

architecture behavioral of source_and_probe_intel is

	component intel_source_and_probe is
		port (
			source     : out std_logic_vector(0 downto 0);                    	-- source
			source_clk : in  std_logic                    	:= 'X';             -- clk
			probe      : in  std_logic_vector(0 downto 0) 	:= (others => 'X')  -- probe
		);
	end component intel_source_and_probe;

begin

	u0 : component intel_source_and_probe
		port map (
			source(0) 	=> source,
			source_clk 	=> clk,
			probe(0)  	=> probe
		);

end behavioral;