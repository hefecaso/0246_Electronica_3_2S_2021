
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TempSignal is
   Port(
	      Clk  :           in     std_logic;
			gnd: 		     out 	std_logic_vector(2 downto 0);
			DPS  :		     out 	std_logic_vector(7 downto 0);
			Sensor:          in     std_logic_vector(3 downto 0);
			Pul:        in     std_logic

	);

end Temperatura;

architecture Behavioral of TempSignal is
   signal plx:		integer range 0 to 11999 := 0;
   signal w: integer range 0 to 2 := 0;
	signal dis :			integer range 0 to 9 := 0;
	signal m:     integer range 0 to 9 := 0;
	signal z :     integer range 0 to 9 := 0;
   signal e:     integer range 0 to 9 := 0;
	
begin
process (Clk)
begin
 if (rising_edge(Clk))then
  if(Pul = '1')then

   



  			if(mlx < 11999) then
				mlx <= multiplexacion + 1;
				else
				w <= w+ 1;
				mlx<=0;
			end if;
			
					
				case b is
				when 0 => gnd <= "011";
							   dis<= unidades;
				when 1 => gnd <= "101";
						      dis<= decenas;
				when 2 => gnd <= "110";
								dis<= centenas;
				when others => gnd <= "111";
			end case;

			case dis is
				when 0 => DPS <= "11000000";
				when 1 => DPS <= "11111001";
				when 2 => DPS <= "10100100";
				when 3 => DPS <= "10110000";
				when 4 => DPS <= "10011001";
				when 5 => DPS <= "10010010";
				when 6 => DPS<= "10000010";
				when 7 => DPS <= "11111000";
				when 8 => DPS <= "10000000";
				when 9 => DPS <= "10010000";
				when others => DPS <="11111111";
			end case;





 end if;
end if;
end process;
end Behavioral;

