
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD is
    Port ( CLK : in STD_LOGIC;
           digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0);
           CAT : out STD_LOGIC_VECTOR (6 downto 0));
end SSD;

architecture Behavioral of SSD is
signal count:std_logic_vector(15 downto 0);
signal input_decoder:std_logic_vector(3 downto 0);
begin

-- COUNTER
process(clk,count)
begin

if (clk='1' and clk'event) then  -- IF RISING_EDGE(CLK)
        count<=count +1;
end if;


end process;

--ANODES
process(count)
begin
case count(15 downto 14) is
when "00"=>an<="1110";
when "01"=>an<="1101";
when "10"=>an<="1011";
when others=>an<="0111";

end case;
end process;

--for digits
process(count,digit0,digit1,digit2,digit3)
begin
case count(15 downto 14) is
when "00"=>input_decoder<=digit0;
when "01"=>input_decoder<=digit1;
when "10"=>input_decoder<=digit2;
when others=>input_decoder<=digit3;

end case;
end process;

process(input_decoder)
begin
	 case input_decoder is
		when "0000" => cat<="0000001";
		when "0001" => cat<="1001111";
		when "0010" => cat<="0010010";
		when "0011" => cat<="0000110";

		when "0100" => cat<="1001100";
		when "0101" => cat<="0100100";
		when "0110" => cat<="0100000";
		when "0111" => cat<="0001111";

		when "1000" => cat<="0000000";
		when "1001" => cat<="0000100";
		when "1010" => cat<="0001000";
    	when "1011" => cat<="1100000";

		when "1100" => cat<="0110001";
		when "1101" => cat<="1000010";
    	when "1110" => cat<="0110000";
		when others => cat<="0111000";
		
		end case;

end process;

end Behavioral;
