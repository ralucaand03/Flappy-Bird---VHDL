library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pipes is
    Generic ( pos_def : integer);
    Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC; 
         start : in STD_LOGIC;
          
         pos_pipes : out integer;
         score : out std_logic_vector(7 downto 0)
           );
end pipes;

architecture Behavioral of pipes is
------------------------------------------signals-------------------------------------------------
signal pos : integer := pos_def;
constant pos_teleport : integer := 700;
signal score_s : std_logic_vector(7 downto 0);
-------------------------------------------------------------------------------------------------
begin
    
    pipe: process(clk,reset,start)
        begin
            if reset = '1' or start = '0' then
                pos <= pos_def;
                score_s <= x"00";
            elsif start = '1'  then
                if rising_edge(clk) then
                    if pos > 0  then
                        pos <= pos-1;
                    else 
                        pos <= pos_teleport;
                        score_s(3 downto 0) <= score_s(3 downto 0) + 1;
                        
                        if score_s(3 downto 0) = "1010" then
                            score_s(3 downto 0) <= x"0";
                            score_s(7 downto 4) <= score_s(7 downto 4) + 1;
                        end if;
                    end if;
                else
                    pos <= pos;
                end if;
            end if;
        end process;  
          
pos_pipes <= pos;
score <= score_s;

end Behavioral;
