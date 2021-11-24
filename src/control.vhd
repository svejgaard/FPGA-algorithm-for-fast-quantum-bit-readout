library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --- signed and unsigned

library work;
use work.data_formats.all;

entity control is port(
	clk					: in std_logic;
	reset_n				: in std_logic;
	input_data_ready	: in std_logic_vector(3 downto 0);
	address 			: out std_logic_vector(ADDRESS_WIDTH-1 downto 0)	:= (others => '0');
	rden 				: out std_logic										:= '0';
	stop				: out std_logic 									:= '0';
	valid				: out std_logic 									:= '0'
);
end entity control;

architecture behavioral of control is
begin


process(clk)
begin
	if rising_edge(clk) then
		-- Måske jeg kan tælle antal invalid samples, og sætte valid, hvis tallet er over en threshold

		if reset_n = '0' then
			rden <= '0';
			address <= (others => '0');
			stop <= '0';
		else
			if input_data_ready = "1111" then
				rden <= '1';
			end if;
			if rden = '1' then
				address <= std_logic_vector(unsigned(address) + 1);
			end if;
			if unsigned(address) = FINAL_ADDRESS then
				stop <= '1';
			end if;
		end if;
	end if;
end process;

end behavioral;