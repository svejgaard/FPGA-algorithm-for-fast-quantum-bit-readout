library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --- signed and unsigned


library work;
use work.data_formats.all;


entity top is port(
	clk_p			: in std_logic;
	clk_n 			: in std_logic;
	reset   		: in std_logic;
	trig 			: in std_logic;
	-- test_trig 		: in std_logic; -- simulation
	start 			: out std_logic 										:= '0';
	state			: out std_logic_vector(7 downto 0)						:= (others => '0');
-- 	valid			: out std_logic_vector(7 downto 0)						:= (others => '0');
--	stop_sig		: out std_logic_vector(7 downto 0)						:= (others => '0')
	stop_sig		: out std_logic_vector(7 downto 0)						:= (others => '0')
-- 	result_0		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_1		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_2		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_3		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_4		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_5		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_6		: out std_logic_vector(input_MSB downto 0)				:= (others => '0');	
-- 	result_7		: out std_logic_vector(input_MSB downto 0)				:= (others => '0')	
);
end entity top;


architecture behavioral of top is
	signal clk 					: std_logic;
	signal reset_n 				: std_logic;
	signal sample_A  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_B  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_C  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_D  			: std_logic_vector(input_MSB downto 0)		:= (others => '0');
	signal sample_valid_A 		: std_logic 								:= '0';
	signal sample_valid_B 		: std_logic 								:= '0';
	signal sample_valid_C 		: std_logic 								:= '0';
	signal sample_valid_D 		: std_logic 								:= '0';
	-- signal start 			: std_logic 								:= '0';
	signal trigger_sig 			: std_logic 								:= '0';

	type result_array is array (0 to 7) of std_logic_vector(input_MSB downto 0);
	signal result 				: result_array								:= (others => (others => '0'));

begin

reset_n <= not reset;

SINGLE_CLK_gen 		: if XILINX generate
ibuf				: entity work.ibufds_wrapper_xilinx
port map (
	i 	=> clk_p,
	ib  => clk_n,
	o   => clk
);
end generate;

intel_clk_gen		: if INTEL generate
clk <= clk_p;
end generate;

DEBOUNCE_TRIG_gen 	: if XILINX generate
	DTR0			: entity work.debouncer
	port map(
		clk 			=> clk,
		din 			=> trig,
		dout 			=> trigger_sig
	);
end generate;

QSTATE_gen 			: for i in 0 to NO_OF_DIMENSIONS-1 generate
	QST 			: entity work.qstate
	generic map (
		qstate_id 		=> std_logic_vector(to_unsigned(i, 3))
	)
	port map (
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
		result 			=> result(i),
		state 			=> state(i),
-- 		valid 			=> valid(i),
		stop 			=> stop_sig(i)
	);
end generate;

-- result_0 <= result(0);
-- result_1 <= result(1);
-- result_2 <= result(2);
-- result_3 <= result(3);
-- result_4 <= result(4);
-- result_5 <= result(5);
-- result_6 <= result(6);
-- result_7 <= result(7);

intel_injector_gen	: if INTEL generate
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
end generate;
xilinx_injector_gen	: if XILINX generate
INX0		: entity work.injector_xilinx port map (
	-- inputs
	clk 			=> clk,
	reset_n 		=> reset_n,
	trig 			=> trigger_sig,
	-- trig 			=> test_trig, --simulation
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
end generate;

intel_source_and_probe_gen 	: if INTEL generate
SP0		: entity work.source_and_probe_intel port map(
	-- inputs
	clk 			=> clk,
	-- probe 			=> stop_sig(0),
	probe 			=> '0',
	-- outputs
	source 			=> trigger_sig
);
end generate;

xilinx_probe_gen 	: if XILINX generate
XPR		: entity work.probe_xilinx port map(
	-- inputs
	clk 			=> clk,
	probe0 			=> result(0),
	probe1 			=> result(1),
	probe2 			=> result(2)
);
end generate;

end behavioral;