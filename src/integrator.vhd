library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

entity integrator is port(
	clk				: in std_logic;
	reset_n			: in std_logic;
	input			: in std_logic_vector(input_MSB downto 0);
	integral		: out std_logic_vector(input_MSB downto 0)		:= (others => '0')
);
end entity integrator;

architecture behavioral of integrator is
	signal sum_sig		: std_logic_vector(input_MSB downto 0)		:= (others => '0');

begin

A0 		: entity work.adder port map (
	-- inputs
	clk			=> clk,
	input_a		=> input,
	input_b 	=> integral,
	-- outputs
	sum 		=> sum_sig
);

REG0 	: entity work.register32 port map (
	-- inputs
	clk 		=> clk,
	reset_n		=> reset_n,
	data_in		=> sum_sig,
	-- outputs
	data_out 	=> integral
);

end behavioral;