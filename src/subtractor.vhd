library ieee;
use ieee.std_logic_1164.all;
-- use ieee.fixed_pkg.all;
-- since fixed_pkg is not implemented in Vivado 2018.3 (though it is VHDL 2008 standard):
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

library work;
use work.data_formats.all;


entity subtractor is port(
	mean			: in std_logic_vector(input_MSB downto 0);
	input			: in std_logic_vector(input_MSB downto 0);
	result			: out std_logic_vector(input_MSB downto 0)		:= (others => '0')
);
end entity subtractor;

architecture behavioral of subtractor is
	signal subtraction_sfixed 		: sfixed(INTEGER_WIDTH+1 downto -FRACTION_WIDTH)		:= (others => '0');
begin

subtraction_sfixed <= to_sfixed(input, INTEGER_WIDTH, -FRACTION_WIDTH) - to_sfixed(mean, INTEGER_WIDTH, -FRACTION_WIDTH);
result <= to_slv(resize(subtraction_sfixed, subtraction_sfixed'high-1, subtraction_sfixed'low));

end behavioral;