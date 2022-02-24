library ieee;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ibufds_wrapper_xilinx is port(
	i 		: in std_logic;
	ib  	: in std_logic;
	o 		: out std_logic 		:= '0'
);
end entity ibufds_wrapper_xilinx;

architecture behavioral of ibufds_wrapper_xilinx is

begin

	ibuf		: IBUFDS
	port map (
		i 	=> i,
		ib  => ib,
		o   => o
	);

end behavioral;