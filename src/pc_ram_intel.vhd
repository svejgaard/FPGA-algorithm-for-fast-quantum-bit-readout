library ieee;
use ieee.std_logic_1164.all;

library work;
use work.data_formats.all;

entity pc_ram_intel is 
generic(
	qstate_id 		: std_logic_vector(3 downto 0)
);
port(
	clk				: in std_logic;
	reset_n 		: in std_logic;
	rden			: in std_logic;
	address 		: in std_logic_vector(10 downto 0);

	pc_0			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_1			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_2			: out std_logic_vector(input_MSB downto 0)				:= (others => '0');
	pc_3			: out std_logic_vector(input_MSB downto 0)				:= (others => '0')
);
end entity pc_ram_intel;


architecture behavioral of pc_ram_intel is
	
	component ram2048x32_A0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_A0;
	component ram2048x32_A1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_A1;
	component ram2048x32_A2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_A2;
	component ram2048x32_A3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_A3;

	component ram2048x32_B0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_B0;
	component ram2048x32_B1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_B1;
	component ram2048x32_B2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_B2;
	component ram2048x32_B3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_B3;

	component ram2048x32_C0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_C0;
	component ram2048x32_C1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_C1;
	component ram2048x32_C2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_C2;
	component ram2048x32_C3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_C3;

	component ram2048x32_D0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_D0;
	component ram2048x32_D1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_D1;
	component ram2048x32_D2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_D2;
	component ram2048x32_D3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_D3;

	component ram2048x32_E0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_E0;
	component ram2048x32_E1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_E1;
	component ram2048x32_E2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_E2;
	component ram2048x32_E3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_E3;

	component ram2048x32_F0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_F0;
	component ram2048x32_F1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_F1;
	component ram2048x32_F2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_F2;
	component ram2048x32_F3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_F3;

	component ram2048x32_G0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_G0;
	component ram2048x32_G1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_G1;
	component ram2048x32_G2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_G2;
	component ram2048x32_G3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_G3;

	component ram2048x32_H0 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_H0;
	component ram2048x32_H1 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_H1;
	component ram2048x32_H2 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_H2;
	component ram2048x32_H3 is
		port (
			data    : in  std_logic_vector(31 downto 0) 					:= (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);					                    -- dataout
			address : in  std_logic_vector(10 downto 0) 					:= (others => 'X'); -- address
			wren    : in  std_logic                     					:= 'X';             -- wren
			clock   : in  std_logic                     					:= 'X';             -- clk
			rden    : in  std_logic                     					:= 'X'              -- rden
		);
	end component ram2048x32_H3;
begin

	RAM_gen : if qstate_id = "0000" generate

		RAM0 : component ram2048x32_A0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_A1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_A2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_A3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
	elsif qstate_id = "0001" generate

		RAM0 : component ram2048x32_B0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_B1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_B2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_B3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0010" generate
		RAM0 : component ram2048x32_C0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_C1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_C2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_C3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0011" generate
		RAM0 : component ram2048x32_D0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_D1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_D2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_D3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0100" generate
		RAM0 : component ram2048x32_E0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_E1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_E2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_E3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0101" generate
		RAM0 : component ram2048x32_F0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_F1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_F2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_F3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0110" generate
		RAM0 : component ram2048x32_G0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_G1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_G2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_G3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);

		elsif qstate_id = "0111" generate
		RAM0 : component ram2048x32_H0 port map (
			data 	=> (others => '0'),
			q 		=> pc_0,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM1 : component ram2048x32_H1 port map (
			data 	=> (others => '0'),
			q 		=> pc_1,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM2 : component ram2048x32_H2 port map (
			data 	=> (others => '0'),
			q 		=> pc_2,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
		RAM3 : component ram2048x32_H3 port map (
			data 	=> (others => '0'),
			q 		=> pc_3,
			address => address,
			wren 	=> '0',
			clock 	=> clk,
			rden	=> rden
		);
	end generate;


end behavioral;