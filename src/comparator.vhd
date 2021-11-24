library ieee;
use ieee.std_logic_1164.all;
-- use ieee.fixed_pkg.all;

library work;
use work.data_formats.all;

entity comparator is port(
	input			: in std_logic_vector(input_MSB downto 0);
	state			: out std_logic 							:= '0'
);
end entity comparator;

architecture behavioral of comparator is
begin

-- only checking the sign bit:
state <= '1' when input(input_MSB) = '0' else '0';

end behavioral;