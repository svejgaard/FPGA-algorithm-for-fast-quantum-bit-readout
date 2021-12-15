library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

entity mean_ram_xilinx is 
generic(
	qstate_id 		: std_logic_vector(3 downto 0)
);
port(
	clk				: in std_logic;
	mean			: out std_logic_vector(input_MSB downto 0)				:= (others => '0')
);
end entity mean_ram_xilinx;


architecture behavioral of mean_ram_xilinx is
	
	component ram2x32_A0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_A0;
	

	component ram2x32_B0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_B0;
	

	component ram2x32_C0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_C0;

	component ram2x32_D0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_D0;

	component ram2x32_E0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_E0;

	component ram2x32_F0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_F0;

	component ram2x32_G0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_G0;

	component ram2x32_H0 is
		port (
			dina    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- dina
			douta   : out std_logic_vector(31 downto 0);					                    -- douta
			addra   : in  std_logic_vector(0 downto 0) 						:= (others => 'X'); -- addra
			wea     : in  std_logic                     					:= 'X';             -- wea
			clka    : in  std_logic                     					:= 'X';             -- clka
			ena     : in  std_logic                     					:= 'X'              -- ena
		);
	end component ram2x32_H0;

begin

	RAM4_gen : if qstate_id = "0000" generate

		RAM4 : component ram2x32_A0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

	elsif qstate_id = "0001" generate

		RAM4 : component ram2x32_B0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

		elsif qstate_id = "0010" generate
		RAM4 : component ram2x32_C0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);


		elsif qstate_id = "0011" generate
		RAM4 : component ram2x32_D0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

		elsif qstate_id = "0100" generate
		RAM4 : component ram2x32_E0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

		elsif qstate_id = "0101" generate
		RAM4 : component ram2x32_F0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

		elsif qstate_id = "0110" generate
		RAM4 : component ram2x32_G0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);

		elsif qstate_id = "0111" generate
		RAM4 : component ram2x32_H0 port map (
			dina    => (others => '0'),
			douta   => mean,
			addra   => "" & '0',
			wea     => '0',
			clka    => clk,
			ena     => '1'
		);
	end generate;


end behavioral;