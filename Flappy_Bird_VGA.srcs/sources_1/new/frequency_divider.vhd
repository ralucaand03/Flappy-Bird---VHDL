library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frequency_divider is
     Port (
          clk : in std_logic;
          div : in integer;
          divided_clk : out std_logic
           );
end frequency_divider;

architecture Behavioral of frequency_divider is
     signal count : integer;
     signal new_clk : std_logic;
  
begin
     CLK_div: process (clk)
     begin
          if rising_edge(clk) then
               count <= count + 1;
               if count = div then -- the counter reaches the required number of clock cycles
                    count <= 0;
                    new_clk <= not new_clk; -- invert the output clock signal
               end if;
          end if;
     end process;
  
     divided_clk <= new_clk;
end Behavioral;