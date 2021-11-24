library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

-- NOTE: could the delay be left out, if the PC loaded the 3rd address from the beginning?

entity delay is port(
	clk					: in std_logic;
	reset_n 			: in std_logic;

	input_data_ready	: in std_logic_vector(3 downto 0);
	data_in_A			: in std_logic_vector(input_MSB downto 0);
	data_in_B			: in std_logic_vector(input_MSB downto 0);
	data_in_C			: in std_logic_vector(input_MSB downto 0);
	data_in_D			: in std_logic_vector(input_MSB downto 0);

	data_out_A			: out std_logic_vector(input_MSB downto 0)		:= (others => '0');	
	data_out_B			: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	data_out_C			: out std_logic_vector(input_MSB downto 0)		:= (others => '0');
	data_out_D			: out std_logic_vector(input_MSB downto 0)		:= (others => '0')
);
end entity delay;


architecture behavioral of delay is
	signal register_A1	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_B1	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_C1	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_D1	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_A2	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_B2	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_C2	: std_logic_vector(input_MSB downto 0)			:= (others => '0');
	signal register_D2	: std_logic_vector(input_MSB downto 0)			:= (others => '0');

begin

process(clk)
begin
	if rising_edge(clk) then
		if reset_n = '0' then
			register_A1 <= (others => '0');
			register_B1 <= (others => '0');
			register_C1 <= (others => '0');
			register_D1 <= (others => '0');
			register_A2 <= (others => '0');
			register_B2 <= (others => '0');
			register_C2 <= (others => '0');
			register_D2 <= (others => '0');
			data_out_A <= (others => '0');
			data_out_B <= (others => '0');
			data_out_C <= (others => '0');
			data_out_D <= (others => '0');
		else
			if input_data_ready(0) = '1' then
				register_A1 <= data_in_A;
				register_A2 <= register_A1;
			else
				register_A1 <= (others => '0');
			end if;
			if input_data_ready(1) = '1' then
				register_B1 <= data_in_B;
				register_B2 <= register_B1;
			else
				register_B1 <= (others => '0');
			end if;
			if input_data_ready(2) = '1' then
				register_C1 <= data_in_C;
				register_C2 <= register_C1;
			else 
				register_C1 <= (others => '0');
			end if;
			if input_data_ready(3) = '1' then
				register_D1 <= data_in_D;
				register_D2 <= register_D1;
			else
				register_D1 <= (others => '0');
			end if;
			register_A2 <= register_A1;
			register_B2 <= register_B1;
			register_C2 <= register_C1;
			register_D2 <= register_D1;
			data_out_A <= register_A2;
			data_out_B <= register_B2;
			data_out_C <= register_C2;
			data_out_D <= register_D2;
		end if;
	end if;

end process;

end behavioral;