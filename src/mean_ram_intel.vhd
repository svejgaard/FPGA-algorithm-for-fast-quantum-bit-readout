library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

entity mean_ram_intel is 
generic(
	qstate_id 		: std_logic_vector(2 downto 0)
);
port(
	clk				: in std_logic;
	mean			: out std_logic_vector(input_MSB downto 0)				:= (others => '0')
);
end entity mean_ram_intel;


architecture behavioral of mean_ram_intel is
	
	component ram2x32_A0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_A0;
	

	component ram2x32_B0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_B0;
	

	component ram2x32_C0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_C0;

	component ram2x32_D0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_D0;

	component ram2x32_E0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_E0;

	component ram2x32_F0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_F0;

	component ram2x32_G0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_G0;

	component ram2x32_H0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2x32_H0;

begin

	RAM4_gen : if qstate_id = "000" generate

		RAM4 : component ram2x32_A0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

	elsif qstate_id = "001" generate

		RAM4 : component ram2x32_B0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

		elsif qstate_id = "010" generate
		RAM4 : component ram2x32_C0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);


		elsif qstate_id = "011" generate
		RAM4 : component ram2x32_D0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

		elsif qstate_id = "100" generate
		RAM4 : component ram2x32_E0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

		elsif qstate_id = "101" generate
		RAM4 : component ram2x32_F0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

		elsif qstate_id = "110" generate
		RAM4 : component ram2x32_G0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);

		elsif qstate_id = "111" generate
		RAM4 : component ram2x32_H0 port map (
			data 	=> (others => '0'),
			q 		=> mean,
			address => "" & '0',
			wren 	=> '0',
			clock 	=> clk,
			rden	=> '1'
		);
	end generate;


end behavioral;