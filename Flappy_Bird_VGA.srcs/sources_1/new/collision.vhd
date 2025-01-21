library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity collision is
    Port ( clk : in std_logic;
           alt : in integer;        
           alt_pipe_1 : in integer ;
           alt_pipe_2 :in  integer ;
           pos_pipe_1: in integer;
           pos_pipe_2: in integer;
           reset:out std_logic);
end collision;

architecture Behavioral of collision is
constant min_alt : integer :=0;
constant max_alt : integer :=430;

constant default_bird_size : integer := 40;  
constant default_bird_x : integer := 64; 
constant pipe_size : integer :=  60;
constant pipe_gap : integer :=  90;

Signal pipe1_ok : BOOLEAN;
Signal pipe2_ok : BOOLEAN;
Signal alt_ok : BOOLEAN;
signal reset_s : std_logic;

begin

  alt_ok <= (min_alt < alt) and (alt + default_bird_size < max_alt);
  
  pipe1_ok <= (pos_pipe_1 < default_bird_X) or -- pipe is before
              (pos_pipe_1 > default_bird_X + default_bird_size + pipe_size) or -- pipe is after
              ((alt > alt_pipe_1) and
               (alt + default_bird_size < alt_pipe_1 + pipe_gap)); -- bird is in pipe gap
               
  pipe2_ok <= (pos_pipe_2 < default_bird_X) or -- pipe is before
              (pos_pipe_2 > default_bird_X + default_bird_size + pipe_size) or -- pipe is after
              ((alt > alt_pipe_2) and
               (alt + default_bird_size < alt_pipe_2 + pipe_gap)); -- bird is in pipe gap
 
    reset_s <= '0' when alt_ok and pipe1_ok and pipe2_ok else '1';
    reset <= reset_s when rising_edge(clk);

end Behavioral;
