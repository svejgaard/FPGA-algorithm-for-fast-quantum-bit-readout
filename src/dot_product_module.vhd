library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

library work;
use work.data_formats.all;

entity dot_product_module is port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	rden			: in std_logic;
	address 		: in std_logic_vector(10 downto 0);
	sample_0		: in std_logic_vector(input_MSB downto 0);
	sample_1		: in std_logic_vector(input_MSB downto 0);
	sample_2		: in std_logic_vector(input_MSB downto 0);
	sample_3		: in std_logic_vector(input_MSB downto 0);
	dotproduct 		: out std_logic_vector(input_MSB downto 0)		:= (others => '0')
);
end entity dot_product_module;

architecture behavioral of dot_product_module is
	signal pc_0 			: std_logic_vector(input_MSB downto 0)	:= (others => '0');
	signal pc_1 			: std_logic_vector(input_MSB downto 0)	:= (others => '0');
	signal pc_2 			: std_logic_vector(input_MSB downto 0)	:= (others => '0');
	signal pc_3 			: std_logic_vector(input_MSB downto 0)	:= (others => '0');
	signal pc_0_sfixed		: sfixed(4 downto -27)					:= (others => '0');
	signal pc_1_sfixed		: sfixed(4 downto -27)					:= (others => '0');
	signal pc_2_sfixed		: sfixed(4 downto -27)					:= (others => '0');
	signal pc_3_sfixed		: sfixed(4 downto -27)					:= (others => '0');
	signal sample_0_sfixed	: sfixed(4 downto -27)					:= (others => '0');
	signal sample_1_sfixed	: sfixed(4 downto -27)					:= (others => '0');
	signal sample_2_sfixed	: sfixed(4 downto -27)					:= (others => '0');
	signal sample_3_sfixed	: sfixed(4 downto -27)					:= (others => '0');
	signal product_0 		: sfixed(9 downto -54)					:= (others => '0');
	signal product_1 		: sfixed(9 downto -54)					:= (others => '0');
	signal product_2 		: sfixed(9 downto -54)					:= (others => '0');
	signal product_3 		: sfixed(9 downto -54)					:= (others => '0');
	signal component_0 		: sfixed(4 downto -27)					:= (others => '0');
	signal component_1 		: sfixed(4 downto -27)					:= (others => '0');
	signal component_2 		: sfixed(4 downto -27)					:= (others => '0');
	signal component_3 		: sfixed(4 downto -27)					:= (others => '0');	
	signal sum_1A 			: sfixed(5 downto -27)					:= (others => '0');
	signal sum_1B 			: sfixed(5 downto -27)					:= (others => '0');
	signal sum_2 			: sfixed(6 downto -27)					:= (others => '0');
	signal sum_3 			: sfixed(4 downto -27)					:= (others => '0');
	signal sum				: sfixed(7 downto -27)					:= (others => '0');	
begin

	intel_ram_initialization : if INTEL generate
	begin
	PCRAM_INTEL : entity work.pc_ram_intel port map (
		-- inputs
		clk => clk,
		reset_n => reset_n,
		rden => rden,
		address => address,
		-- outputs
		pc_0 => pc_0,
		pc_1 => pc_1,
		pc_2 => pc_2,
		pc_3 => pc_3
	);
	end generate;

process(clk)
begin
	if rising_edge(clk) then
		if reset_n = '0' then
			sample_0_sfixed <= (others => '0');
			sample_1_sfixed <= (others => '0');
			sample_2_sfixed <= (others => '0');
			sample_3_sfixed <= (others => '0');
			pc_0_sfixed <= (others => '0');
			pc_1_sfixed <= (others => '0');
			pc_2_sfixed <= (others => '0');
			pc_3_sfixed <= (others => '0');
			product_0 <= (others => '0');
			product_1 <= (others => '0');
			product_2 <= (others => '0');
			product_3 <= (others => '0');
			component_0 <= (others => '0');
			component_1 <= (others => '0');
			component_2 <= (others => '0');
			component_3 <= (others => '0');
			sum_1A <= (others => '0');
			sum_1B <= (others => '0');
			sum_2 <= (others => '0');
			sum_3 <= (others => '0');
			dotproduct <= (others => '0');	
		else
			sample_0_sfixed <= to_sfixed(sample_0, component_0);
			sample_1_sfixed <= to_sfixed(sample_1, component_0);
			sample_2_sfixed <= to_sfixed(sample_2, component_0);
			sample_3_sfixed <= to_sfixed(sample_3, component_0);
			pc_0_sfixed <= to_sfixed(pc_0, component_0);
			pc_1_sfixed <= to_sfixed(pc_1, component_0);
			pc_2_sfixed <= to_sfixed(pc_2, component_0);
			pc_3_sfixed <= to_sfixed(pc_3, component_0);
			product_0 <= sample_0_sfixed * pc_0_sfixed;
			product_1 <= sample_1_sfixed * pc_1_sfixed;
			product_2 <= sample_2_sfixed * pc_2_sfixed;
			product_3 <= sample_3_sfixed * pc_3_sfixed;
			component_0 <= resize(product_0, component_0);
			component_1 <= resize(product_1, component_0);
			component_2 <= resize(product_2, component_0);
			component_3 <= resize(product_3, component_0);
			sum_1A <= component_0 + component_1;
			sum_1B <= component_2 + component_3;
			sum_2 <= sum_1A + sum_1B;
			sum_3 <= resize(sum_2, component_0);
			dotproduct <= to_slv(sum_3);
		end if;
	end if;
end process;

end behavioral;