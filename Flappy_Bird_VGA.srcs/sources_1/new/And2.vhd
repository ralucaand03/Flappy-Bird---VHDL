library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And2 is
     Port (
        a: in std_logic;
        b: in std_logic;
        output: out std_logic 
     );
end And2;

architecture Behavioral of And2 is

begin
    output<= a and not(b);
end Behavioral;
