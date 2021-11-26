library ieee;
use ieee.std_logic_1164.all;


library work;
use work.data_formats.all;


entity qstate is port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	sample_A		: in std_logic_vector(input_MSB downto 0);
	sample_B		: in std_logic_vector(input_MSB downto 0);
	sample_C		: in std_logic_vector(input_MSB downto 0);
	sample_D		: in std_logic_vector(input_MSB downto 0);
	sample_valid_A	: in std_logic;
	sample_valid_B	: in std_logic;
	sample_valid_C	: in std_logic;
	sample_valid_D	: in std_logic;
	stop 			: out std_logic 												:= '0';
	valid			: out std_logic 												:= '0';
	state			: out std_logic 												:= '0';
	result			: out std_logic_vector(input_MSB downto 0)						:= (others => '0')
);
end entity qstate;


architecture behavioral of qstate is

	component ram2x32_0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 							:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);                    							-- dataout
			address : in  std_logic_vector(0 downto 0)  							:= (others => 'X'); -- address
			wren    : in  std_logic                     							:= 'X';             -- wren
			clock   : in  std_logic                     							:= 'X';             -- clk
			rden    : in  std_logic                     							:= 'X'              -- rden
		);
	end component;

	signal input_data_ready		: std_logic_vector(3 downto 0)						:= (others => '0');
	signal clear_registers_n	: std_logic 										:= '1';
	signal address 				: std_logic_vector(ADDRESS_WIDTH-1 downto 0)		:= (others => '0');
	signal rden 				: std_logic 										:= '0';
	signal data_sig_0			: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal data_sig_1			: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal data_sig_2			: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal data_sig_3			: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal dotproduct			: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal integral				: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal mean					: std_logic_vector(input_MSB downto 0)				:= (others => '0');
	signal result_sig			: std_logic_vector(input_MSB downto 0)				:= (others => '0');

-- To display principal components in Modelsim in radix sfixed:
	-- signal data_sig_0_sfixed		: sfixed(4 downto -27)								:= (others => '0');
	-- signal data_sig_1_sfixed		: sfixed(4 downto -27)								:= (others => '0');
	-- signal data_sig_2_sfixed		: sfixed(4 downto -27)								:= (others => '0');
	-- signal data_sig_3_sfixed		: sfixed(4 downto -27)								:= (others => '0');
	-- signal dotproduct_sfixed 	: sfixed(4 downto -27)								:= (others => '0');
	-- signal integral_sfixed		: sfixed(4 downto -27)								:= (others => '0');
	-- signal result_sfixed 		: sfixed(4 downto -27)								:= (others => '0');
begin

input_data_ready <= sample_valid_D & sample_valid_C & sample_valid_B & sample_valid_A;
result <= result_sig;

-- To display principal components in Modelsim in radix sfixed:
-- data_sig_0_sfixed <= to_sfixed(data_sig_0, result_sfixed);
-- data_sig_1_sfixed <= to_sfixed(data_sig_1, result_sfixed);
-- data_sig_2_sfixed <= to_sfixed(data_sig_2, result_sfixed);
-- data_sig_3_sfixed <= to_sfixed(data_sig_3, result_sfixed);
-- dotproduct_sfixed <= to_sfixed(dotproduct, result_sfixed);
-- integral_sfixed <= to_sfixed(integral, result_sfixed);
-- result_sfixed <= to_sfixed(result, result_sfixed);

CON0 			: entity work.control port map (
	-- inputs
	clk 				=> clk,
	reset_n 			=> reset_n,
	input_data_ready 	=> input_data_ready,
	-- outputs
	clear_registers_n 	=> clear_registers_n,
	address 			=> address,
	rden 				=> rden,
	stop 				=> stop,
	valid 				=> valid
);


DEL0 			: entity work.delay port map (
	-- inputs
	clk 				=> clk,
	reset_n 			=> reset_n,
	input_data_ready 	=> input_data_ready,
	data_in_A 			=> sample_A,
	data_in_B 			=> sample_B,
	data_in_C 			=> sample_C,
	data_in_D 			=> sample_D,
	-- outputs
	data_out_A 			=> data_sig_0,
	data_out_B 			=> data_sig_1,
	data_out_C 			=> data_sig_2,
	data_out_D 			=> data_sig_3
);

DOT0 			: entity work.dot_product_module port map (
	-- inputs
	clk 		=> clk,
	reset_n 	=> reset_n,
	rden 		=> rden,
	address 	=> address,
	sample_0 	=> data_sig_0,
	sample_1 	=> data_sig_1,
	sample_2 	=> data_sig_2,
	sample_3 	=> data_sig_3,
	-- outputs
	dotproduct 	=> dotproduct
);

INT0			: entity work.integrator port map (
	-- inputs
	clk 		=> clk,
	reset_n 	=> clear_registers_n,
	input 		=> dotproduct,
	-- outputs
	integral 	=> integral
);

intel_ram_initialization_2 : if INTEL generate
begin
RAM4 	: component ram2x32_0 port map (
	data 	=> (others => '0'),
	q 		=> mean,
	address => "" & '0',
	wren 	=> '0',
	clock 	=> clk,
	rden	=> '1'
);
end generate;

SUB0		: entity work.subtractor port map (
	-- inputs
	mean 	=> mean,
	input 	=> integral,
	-- outputs
	result 	=> result_sig
);

COM0		: entity work.comparator port map (
	-- inputs
	input 	=> result_sig,
	-- outputs
	state 	=> state
);


end behavioral;