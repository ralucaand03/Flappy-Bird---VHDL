library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fly is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           button : in STD_LOGIC; 
           
           alt : out integer;
           start : out STD_LOGIC);
end fly;

architecture Behavioral of fly is
------------------------------------------components-------------------------------------------------

------------------------------------------signals-------------------------------------------------
constant default_pos : integer := 220;

signal is_started : std_logic;
signal pos_alt: integer := default_pos;
signal v_alt : integer := 0;
--------------------------------------------------------------------------------------------------
begin
     
     process(clk, reset)
     begin
          if reset='1' then
               pos_alt <= default_pos;
               is_started <= '0';
          elsif rising_edge(clk) then 
                    if is_started = '1' then
                         if pos_alt < 0 then 
                              pos_alt <= pos_alt+1;
                         end if;
                         if pos_alt > 480 then 
                              pos_alt <= pos_alt-1;
                         end if; 
                         pos_alt <= pos_alt + v_alt;
                    end if;
                    
                    if button = '1' then 
                         is_started <= '1';
                         v_alt <= v_alt - 3;
                         -----
                         if v_alt < -4 then
                              v_alt <= v_alt + 1;
                         end if;
                         ------
                    else
                         if v_alt < 5 then
                              v_alt <= v_alt + 1;
                         else
                              v_alt<=v_alt;
                         end if;
                         
                         is_started<= is_started;
                    end if;     
                    
          else
               pos_alt <= pos_alt;
               v_alt <= v_alt;
               is_started <= is_started;
          end if;
              
     end process;  
------------------------------------------------------------------------------------------------
start <= is_started;
alt <= pos_alt;
end Behavioral;
