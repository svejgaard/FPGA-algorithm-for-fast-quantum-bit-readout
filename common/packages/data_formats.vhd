--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --- signed and unsigned



package data_formats is


	-- CONFIGURATION
	constant XILINX					: boolean := false;
	constant INTEL					: boolean := not XILINX;

	constant NO_OF_MODULES			: integer := 1;
	constant NO_OF_RAM				: integer := 4;

	constant NO_OF_DIMENSIONS		: integer := 4;


	-- SIGNAL LENGTHS
	constant SIGN 					: integer := 1;
	constant INTEGER_WIDTH 			: integer := 4;
	constant FRACTION_WIDTH 		: integer := 27;
	constant SIGNAL_LENGTH			: integer := SIGN + INTEGER_WIDTH + FRACTION_WIDTH;
	constant LENGTH_OF_RAM 			: integer := 2048;
	constant ADDRESS_WIDTH 			: integer := 11;

	constant input_MSB 				: integer := signal_length-1;
	constant output_MSB				: integer := signal_length*2-1;

	-- TIMING
	constant FINAL_ADDRESS  		: integer := 1385;
	-- constant MAX_COUNT_VALUE 	: unsigned(31 downto 0) 			:= x"000003FF"; -- 1023, for simulation
	constant MAX_COUNT_VALUE 		: unsigned(31 downto 0) 			:= x"59682F00"; -- 15s @ 100MHz: WAIT_TIME / (1 / CLK_SPEED)



end package data_formats;