--------------------------------------------------------------------------------
-- Title       : <Title Block>
-- Project     : Default Project Name
--------------------------------------------------------------------------------
-- File        : top_tb.vhd
-- Author      : User Name <user.email@user.company.com>
-- Company     : User Company Name
-- Created     : Thu Nov 18 00:20:33 2021
-- Last update : Sun Feb 20 13:25:51 2022
-- Platform    : Default Part Number
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2021 User Company Name
-------------------------------------------------------------------------------
-- Description: 
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

library work;
use work.data_formats.all;

-----------------------------------------------------------

entity top_tb is

end entity top_tb;

-----------------------------------------------------------

architecture testbench of top_tb is

	-- Testbench DUT generics


	-- Testbench DUT ports
	signal clk        : std_logic;
	signal reset_n     	: std_logic;
	signal trig 		: std_logic 						   := '0';
	signal start 		: std_logic 						   := '0';
	-- signal result_0     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_1     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_2     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_3     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_4     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_5     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_6     : std_logic_vector(input_MSB downto 0) := (others => '0');
	-- signal result_7     : std_logic_vector(input_MSB downto 0) := (others => '0');
	signal state        : std_logic_vector(NO_OF_DIMENSIONS-1 downto 0)         := (others => '0');
	-- signal valid  	: std_logic_vector(7 downto 0)     := (others => '0');
	signal stop_sig		: std_logic_vector(2 downto 0)         := (others => '0');
	-- Other constants
	constant C_CLK_PERIOD : real := 10.0e-9; -- NS

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	CLK_GEN : process
	begin
		clk <= '1';
		wait for C_CLK_PERIOD / 2.0 * (1 SEC);
		clk <= '0';
		wait for C_CLK_PERIOD / 2.0 * (1 SEC);
	end process CLK_GEN;

	RESET_GEN : process
	begin
		reset_n <= '0';
		wait for 25 ns;
		reset_n <= '1';
		wait for 20 ns;
		reset_n <= '0';
		-- wait for 25000 ns;
		-- reset <= '1';
		-- wait for 20 ns;
		-- reset <= '0';

		wait;
	end process RESET_GEN;

	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
	STIMULUS : process
	begin
		trig <= '0';
		wait for 160 ns;
		trig <= '1';
		-- -- wait for 10 ns;
		-- wait for 205 us;

		-- trig <= '0';
		-- wait for 25100 ns;
		-- trig <= '1';
		-- wait for 10 ns;
		-- trig <= '0';

		wait;

	end process;
	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	DUT : entity work.top
		port map (
			clk          => clk,
			reset_n      => reset_n,
			trig 	 	 => trig,
			start 		 => start,
			-- result_0     => result_0,
			-- result_1     => result_1,
			-- result_2     => result_2,
			-- result_3     => result_3,
			-- result_4     => result_4,
			-- result_5     => result_5,
			-- result_6     => result_6,
			-- result_7     => result_7,
			state        => state,
			-- valid    	 => valid,
			stop_sig	 => stop_sig
		);

end architecture testbench;