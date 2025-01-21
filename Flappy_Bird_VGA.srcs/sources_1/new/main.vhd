-------------------------------------------------------------------------------------------------
--Flappy Bird--
-- Andronescu Raluca -- Marinescu George -- Moise Mihai --
--Group 40311 -- 2023 -- UTCN -- AN1 -- sem2 -- CTI-engleza --
-------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------------------------------------
entity main is
    Port ( clk : in STD_LOGIC;
           button : in STD_LOGIC; 
           h_sync : out STD_LOGIC;
           v_sync : out STD_LOGIC;
           Red : out STD_LOGIC_vector(3 downto 0);
           Green : out STD_LOGIC_vector(3 downto 0);
           Blue : out STD_LOGIC_vector(3 downto 0);
           an : out   STD_LOGIC_VECTOR (3 downto 0); 
           cat : out  STD_LOGIC_VECTOR (6 downto 0));
end main;
----------------------------------
architecture Behavioral of main is
--------------------------------components & signals----------------------------------------------
component fly is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           button : in STD_LOGIC; 
         
           alt : out integer;
           start : out STD_LOGIC);
end component;
signal reset_s :std_logic;
signal alt_s :integer;
signal start_s: std_logic;

component VGA is
     Port (clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           h_sync : out STD_LOGIC;
           v_sync : out STD_LOGIC;
           h_pos : out integer;
           v_pos : out integer;
           clk_2 : out STD_LOGIC;
           draw : out STD_LOGIC
           );
end component;
signal draw_s: std_logic;
signal clk_2:std_logic;
signal h_pos_s: integer;
signal v_pos_s: integer;

component display is
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
end component;

component frequency_divider is
     Port (
          clk : in std_logic;
          div : in integer;
          divided_clk : out std_logic
           );
end component;
signal clk_50:std_logic;
signal clk_191:std_logic;
constant div: integer := 499999;
constant div_200: integer := 124999;

component pipes is
    Generic ( pos_def : integer);
    Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC; 
         start : in STD_LOGIC;
          
         pos_pipes : out integer;
         score : out std_logic_vector(7 downto 0)
           );
end component;
constant alt_pipe_1 : integer := 240 ;
constant alt_pipe_2 : integer := 180;
signal pos_pipe_1: integer;
signal pos_pipe_2: integer;
signal score_1: std_logic_vector(7 downto 0);
signal score_2: std_logic_vector(7 downto 0);
signal score_all: std_logic_vector(7 downto 0);


signal en : std_logic := '1';

component collision is
    Port ( clk : in std_logic;
           alt : in integer;        
           alt_pipe_1 : in integer ;
           alt_pipe_2 :in  integer ;
           pos_pipe_1: in integer;
           pos_pipe_2: in integer;
           reset:out std_logic);
end component;

component SSD is
    Port ( CLK : in STD_LOGIC;
           digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0);
           CAT : out STD_LOGIC_VECTOR (6 downto 0));
end component;
 
-----------------------------------------------------------
begin
fly_bird :fly
    Port map( clk => clk_50,
              reset => reset_s,
              button => button,  
              alt => alt_s,
              start => start_s);
              
VGA_out : VGA
     Port map (clk => clk,
           reset => reset_s,
           h_sync =>h_sync,
           v_sync => v_sync,
           h_pos => h_pos_s,
           v_pos => v_pos_s,
           clk_2 => clk_2,
           draw => draw_s
           );
           
display_out : display
    Port map
         ( clk =>clk_2,
           reset => reset_s,
           h_pos => h_pos_s,
           v_pos => v_pos_s,
           draw  => draw_s,
           alt => alt_s,
           
           alt_pipe_1 => alt_pipe_1,
           alt_pipe_2 => alt_pipe_2,
           pos_pipe_1=> pos_pipe_1,
           pos_pipe_2=> pos_pipe_2,
           
           Red => Red,
           Green => Green, 
           Blue => Blue);
           
FD_50: frequency_divider
Port map(
          clk => clk_2,
          div => div,
          divided_clk => clk_50
           );
           
FD_191: frequency_divider
Port map(
          clk => clk_2,
          div => div_200,
          divided_clk => clk_191
           );
            
Pipe1: pipes 
    Generic map ( pos_def =>280)
    Port map( clk => clk_191,
         reset => reset_s,
         start =>start_s,
         pos_pipes => pos_pipe_1,
         score => score_1
           );
           
Pipe2: pipes 
    Generic map ( pos_def => 600)
    Port map( clk => clk_191,
         reset => reset_s,
         start =>start_s,
         pos_pipes => pos_pipe_2,
         score => score_2
           );

crash: collision 
    Port map ( clk => clk_191, 
           alt =>alt_s,        
           alt_pipe_1=>alt_pipe_1,
           alt_pipe_2 =>alt_pipe_2,
           pos_pipe_1 => pos_pipe_1,
           pos_pipe_2=> pos_pipe_2,
           reset =>reset_s);
           
score_all <= score_1 + score_2;

SSD_in : SSD 
    Port map( CLK => clk,
           digit0 => score_all(3 downto 0),
           digit1 => score_all(7 downto 4),
           digit2 => x"0",
           digit3 => x"0",
           AN => an,
           CAT => cat);
----------------------------out----------------------

end Behavioral;