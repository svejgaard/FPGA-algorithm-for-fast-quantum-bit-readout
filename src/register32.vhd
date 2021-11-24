library ieee;
use ieee.std_logic_1164.all;


library work;
use work.data_formats.all;


entity register32 is port(
	clk			: in std_logic;
	reset_n		: in std_logic;
	data_in		: in std_logic_vector(31 downto 0);
	data_out	: out std_logic_vector(31 downto 0)		:= (others => '0')
);
end entity register32;


architecture behavioral of register32 is
begin

process(clk)
begin
	if rising_edge(clk) then
		if reset_n = '0' then
			data_out <= (others => '0');
		else
			data_out <= data_in;
		end if;
	end if;
end process;

end behavioral;