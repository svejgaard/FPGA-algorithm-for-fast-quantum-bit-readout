library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

library work;
use work.data_formats.all;

entity adder is port(
	clk			: in std_logic;
	input_a		: in std_logic_vector(input_MSB downto 0);
	input_b		: in std_logic_vector(input_MSB downto 0);
	sum			: out std_logic_vector(input_MSB downto 0)		:= (others => '0')
);
end entity adder;

architecture behavioral of adder is
	signal sum_sfixed : sfixed(5 downto -27)					:= (others => '0');
begin

sum_sfixed <= to_sfixed(input_a, sum_sfixed'high - 1, sum_sfixed'low) + to_sfixed(input_b, sum_sfixed'high - 1, sum_sfixed'low);
sum <= to_slv(resize(sum_sfixed, sum_sfixed'high-1, sum_sfixed'low));

end behavioral;