library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------
entity display is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           h_pos : in integer;
           v_pos : in integer;
           draw : in std_logic;
           alt : in integer;
           
           alt_pipe_1 : in integer ;
           alt_pipe_2 :in  integer ;
           pos_pipe_1: in integer;
           pos_pipe_2: in integer;
           
           Red : out STD_LOGIC_vector(3 downto 0);
           Green : out STD_LOGIC_vector(3 downto 0);
           Blue : out STD_LOGIC_vector(3 downto 0));
end display;
----------------------------------
architecture Behavioral of display is

------------------------------------------color-------------------------------------------------
signal color : std_logic_vector(11 downto 0);
signal color_bird : std_logic_vector(11 downto 0) := x"ccc";
signal color_pipes : std_logic_vector(11 downto 0) := x"ccc";
signal color_background : std_logic_vector(11 downto 0) := x"afd";
signal color_grass: std_logic_vector(11 downto 0) := x"ccc";
------------------------------bird---------------------------------------
constant default_alt: integer := 220;
constant default_bird_size : integer := 40;  
constant default_bird_x : integer := 64;  
signal is_bird: BOOLEAN;
----------------------------------------pipes------------------------------------------------
signal is_pipe1: BOOLEAN;
signal is_pipe2: BOOLEAN;
 Signal is_grass: BOOLEAN; 
constant pipe_size : integer :=  60;
constant pipe_gap : integer :=  90;

-------------------------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------------------------
      is_bird <= (h_pos > default_bird_x) and
             (h_pos < default_bird_X + default_bird_size) and
             (v_pos > alt) and
             (v_pos < alt + default_bird_size);
      
      is_pipe1 <= (h_pos + pipe_size > pos_pipe_1) and
              (h_pos+pipe_size  < pos_pipe_1 +  pipe_size) and
              ((v_pos < alt_pipe_1) or
              (v_pos > alt_pipe_1 + pipe_gap));
              
      is_pipe2 <= (h_pos + pipe_size  > pos_pipe_2) and
              (h_pos + pipe_size < pos_pipe_2 + pipe_size) and
              ((v_pos < alt_pipe_2) or
              (v_pos > alt_pipe_2 + pipe_gap));
              
      is_grass <= (v_pos>430);
--------------------------------------white white white-----------------------------------------------------
process( reset,draw)
begin
    --if reset = '1' then
       --   color <= color_background;
    -- end if;
    --elsif rising_edge(clk) then
        if draw = '1' then
            if is_bird = true then 
                color <= color_bird;
            elsif is_pipe1= true then
                color <= color_pipes;
            elsif is_pipe2= true then
                color <= color_pipes;
            elsif is_grass= true then
                color <= color_grass;
            else color <= color_background;
            end if;
        end if;
    --end if;
end process;

-------------------------------------------------------------------------------------------
Red <= color (11 downto 8);
Green <= color (7 downto 4);
Blue <= color (3 downto 0);

end Behavioral;