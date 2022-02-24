--------------------------------------------------------------------------------
-- Design     : Debouncer
  
-- Author     : Sebastian DITTMEIER
-- Created    : 23.03.2021 Last Modified: xx.xx.xxxx
-- Comments   : Used to debounce push-buttons
--          
-- xx.xx.xxxx : first modification details; Name FAMILYNAME
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity debouncer is
    port(
        clk:            in std_logic;
        din:            in std_logic;
        dout:           out std_logic
        );
end debouncer;

architecture rtl of debouncer is
-------------------------------------------------------------------------------- 
-- header (functions, limitations, assumptions, generics) 
-- 
-------------------------------------------------------------------------------- 
-- constant declarations, component declarations, signal declarations 
signal insample : std_logic_vector(4 downto 0)  := (others => '0');
signal counter  : std_logic_vector(11 downto 0) := (others => '0');
signal dout_last: std_logic := '0';

begin
-- component instances, processes, combinatorial expressions

    process(clk)
        begin
        if(rising_edge(clk)) then
            counter <= counter + '1';
            if(counter = "000000000000") then
                insample <= insample(3 downto 0) & din;
            end if;
            if(insample = "00000") then
                dout_last   <= '0';
            elsif(insample = "11111") then
                dout_last   <= '1';
            end if;
            dout <= dout_last;
        end if;
    end process;

end rtl;