library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA is
Port (     clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           h_sync : out STD_LOGIC;
           v_sync : out STD_LOGIC;
           h_pos : out integer;
           v_pos : out integer;
           clk_2 : out STD_LOGIC;
           draw : out STD_LOGIC
           );
end VGA;

architecture Behavioral of VGA is
------------------------------------------signals-------------------------------------------------
signal clk_1 : std_logic;
signal clk_2_s : std_logic;

signal h_pos_s: integer;
signal v_pos_s: integer;

constant hfp: integer := 16;
constant hsp: integer :=96;
constant vfp: integer := 10;
constant vsp: integer := 2;
constant hd: integer := 639;
constant vd: integer := 479;

signal h_sync_s : std_logic;
signal v_sync_s : std_logic;

-------------------------------------------------------------------------------------------------
begin
-----------------------------------frecvency divider---------------------------------------------
frecvency_divider_1: process (clk)
begin
     if rising_edge(clk) then
          clk_1 <= not(clk_1);
     end if;
end process;
frecvency_divider_2:process (clk_1)
begin
     if rising_edge(clk_1) then
          clk_2_s <= not(clk_2_s);
     end if;
end process;
---------------------------------h_pos and v_pos-------------------------------------------
--------------------------------------H_pos------------------------------------------------
H_Position: process(clk_2_s,reset,h_pos_s)
begin
     if reset = '1' then
          h_pos_s <= 0;
     elsif  rising_edge(clk_2_s) then
          if  h_pos_s = 799 then
               h_pos_s <= 0;
          else    
               h_pos_s <= h_pos_s +1 ;
          end if;
     end if;
end process;
--------------------------------------V_pos------------------------------------------------
V_Position: process(clk_2_s,reset,v_pos_s, h_pos_s)
begin
     if reset = '1' then
          v_pos_s <= 0;
     elsif  rising_edge(clk_2_s) then
          if h_pos_s = 799 then
               if  v_pos_s = 524 then
                    v_pos_s <= 0;
               else  
                    v_pos_s <= v_pos_s +1 ;
               end if;
          end if;
     end if;
end process;
--------------------------------h_sync and v_sync-------------------------------------------
--------------------------------------H_sync------------------------------------------------
HSync_enable: process(clk_2_s,reset,h_sync_s, h_pos_s)
begin
     if reset = '1' then
          h_sync_s <= '0';
     elsif rising_edge(clk_2_s) then 
          if ( h_pos_s < hfp + hd  or h_pos_s > (hfp + hsp + hd)) then
               h_sync_s <= '1';  -- H-sync active during front/back porch
          else
               h_sync_s <= '0';  -- H-sync inactive during sync pulse
          end if;
     end if;
end process; 
--------------------------------------V_sync------------------------------------------------
VSync_enable: process(clk_2_s,reset,v_sync_s, v_pos_s)
begin
     if reset = '1' then
          v_sync_s <= '0';
     elsif rising_edge(clk_2_s) then 
   -- Vertical sync
          if (v_pos_s < vfp + vd or v_pos_s >= (vfp + vsp + vd)) then
               v_sync_s <= '1';
          else
               v_sync_s <= '0';
          end if;
     end if;
end process;
-----------------------------------------draw-----------------------------------------------
DrawON : process(clk_2_s, h_pos_s, v_pos_s)
begin
     if(rising_edge(clk_2_s)) then
          if(h_pos_s <= HD and v_pos_s <= VD) then
               draw <= '1';
          else
               draw <= '0';
          end if;
     end if;
end process;
----------------------------------------outputs-----------------------------------------------
v_sync <= v_sync_s;
h_sync <= h_sync_s;
v_pos <= v_pos_s;
h_pos <= h_pos_s;
clk_2 <= clk_2_s;

end Behavioral;