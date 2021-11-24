library ieee;
use ieee.std_logic_1164.all;
-- use ieee.fixed_pkg.all;


library work;
use work.data_formats.all;


entity top is port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	-- test_trig 		: in std_logic; -- simulation
	result			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
	state			: out std_logic 										:= '0';
	valid			: out std_logic 										:= '0';
	stop			: out std_logic 										:= '0'
);
end entity top;


architecture behavioral of top is

	signal sample_A  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_B  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_C  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_D  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_valid_A 		: std_logic 								:= '0';
	signal sample_valid_B 		: std_logic 								:= '0';
	signal sample_valid_C 		: std_logic 								:= '0';
	signal sample_valid_D 		: std_logic 								:= '0';
	signal start 				: std_logic 								:= '0';
	signal trigger_sig 			: std_logic 								:= '0';

begin

QST0 		: entity work.qstate port map (
	-- inputs
	clk 			=> clk,
	reset_n 		=> reset_n,
	sample_valid_A 	=> sample_valid_A,
	sample_valid_B 	=> sample_valid_B,
	sample_valid_C 	=> sample_valid_C,
	sample_valid_D 	=> sample_valid_D,
	sample_A 		=> sample_A,
	sample_B 		=> sample_B,
	sample_C 		=> sample_C,
	sample_D 		=> sample_D,
	-- outputs
	result 			=> result,
	state 			=> state,
	valid 			=> valid,
	stop 			=> stop
);

INI0		: entity work.injector port map (
	-- inputs
	clk 			=> clk,
	reset_n 		=> reset_n,
	trig 			=> trigger_sig,
	-- trig 		=> test_trig, --simulation
	-- outputs
	start 			=> start,
	sample_valid_A 	=> sample_valid_A,
	sample_valid_B 	=> sample_valid_B,
	sample_valid_C 	=> sample_valid_C,
	sample_valid_D 	=> sample_valid_D,
	sample_A 		=> sample_A,
	sample_B 		=> sample_B,
	sample_C 		=> sample_C,
	sample_D 		=> sample_D
);

SNP0		: entity work.source_and_probe_intel port map(
	-- inputs
	clk 			=> clk,
	probe 			=> stop,
	-- outputs
	source 			=> trigger_sig
);

end behavioral;