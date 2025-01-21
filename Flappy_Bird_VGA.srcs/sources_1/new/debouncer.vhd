
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port ( CLK : in STD_LOGIC;
           BTN : in STD_LOGIC;
           ENABLE : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
    signal count: STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal q0,q1,q2,en: STD_LOGIC;
  
    
   component And2 is
     Port (
        a: in std_logic;
        b: in std_logic;
        output: out std_logic 
     );
    end component And2;
begin
    process(clk,count)
    begin
    --if rising_edge(clk) then
    if (clk='1' and clk'event) then count<=count+1;
    end if;
    end process;
    
    process(count,q0)
    begin
        if(count =x"ffff") then
            q0<=Btn;
        end if;
    end process;
    
    process(q1,q2)
    begin
        q2<=q1;
        q1<=q0;
    end process; 

 label1: And2 port map(a=>q1, b=>q2, output=>enable );
end Behavioral;
