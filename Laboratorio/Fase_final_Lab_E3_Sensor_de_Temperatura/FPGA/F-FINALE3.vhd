library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity F-FINALE3 is
 Port(
		   Clk:			     in 	std_logic;
		   En: 		     out 	std_logic_vector(2 downto 0);
			Display:		     out 	std_logic_vector(7 downto 0);
			ACT_0:          in    std_logic;
			ACT_1:          in    std_logic;
			Reset:             in    std_logic;
		   bomba :           out   std_logic;
       	gnd: 		     out 	std_logic_vector(2 downto 0);
			DPS  :		     out 	std_logic_vector(7 downto 0);
			Sensor:          in     std_logic_vector(3 downto 0);
			Pul:        in     std_logic			
		);

end Proyecto_E3;

architecture Behavioral of F-FINALE3 is
   signal NFX:		integer range 0 to 11999 := 0;
   signal n: integer range 0 to 2 := 0;
	signal count :			integer range 0 to 9 := 0;
	signal m:  	integer range 0 to 9:= 0;
   signal	z:  	integer range 0 to 1:= 0;
   signal back : integer range 0 to 19999999;
   signal back1 : integer range 0 to 1599999;
   signal back2 : integer range 0 to 15999999;
	signal sensbo : std_logic;


begin

Temperatura: entity work.TempSignal port map(
  Clk => Clk,
  gnd => gnd,
  DPS => DPS,
  Pul => sensbo,
  Sensor => Sensor  
);


process(Clk)
 begin
 -----------------------rising edge--------------------------------------------------------------------------------------------------------------------------------------------------
 if (rising_edge(Clk))then
 -----------------------inicio/reinicio------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
	   if(Reset= '0') then
		   m<=0;
			z<=0;
		 end if;
		 
	  if(ACT_0= '1')then 
		   back <= back +1;
			if(back = 19999999) then
			back<= 0;
		   m<= m + 1;
			end if;
		end if;
		

	if(ACT_1= '0')then 
		   back1 <= back1 +1;
			if(back1 = 1599999) then
			back<= 0;
		   m<= m - 1;
			end if;
		end if;
		
----------------UNIDADES NUMERICAS MOSTRADAS Y MULTIPLEXADAS---------------------------------------------------------------------------------------------------------------------------------		


	 if(m = 9 and ACT_0 = '1') then
	  back <= back +1;
	   if(back = 19999999) then
	      m<= 0;
		   z<= z + 1;
		if(z = 1) then
         z<= 0;
		 end if;	
      end if;			
    end if;

-------------LIMITE DE CONTADOR--------------------------------------------------------------------------------------------------------------------------------------------------------------------
   if(m = 5 and z = 1 and ACT_0 = '1')then
	  back <= back +1;
	 if(back = 19999999)then
	     m<= 5;
		  z<= 1;
        back <= 0;
      end if;
	end if;

	
 if(m = 0 and z = 0 and ACT_1 = '0')then
	 back1 <= back1 +1;
	 if(back1 = 1599999)then
	     m<= 0;
		  z<= 0;
		  back1 <= 0;
      end if;
	end if;
	
------------------------------------------------------------------------------------------------------------------------------------

 if(m = 0 and ACT_1 = '0') then
	  back1 <= back1 +1;
	   if(back1 = 1599999) then
	      m<= 9;
			z<= z - 1;
		if(z = 0) then
		 z<= 1;
		 end if;
      end if;			
    end if;

	
			if(NFX < 11999) then
				NFX <= NFX + 1;
				else
				n <= n + 1;
				NFX<=0;
			end if;
			
					
				case a is
				when 0 => En <= "011";
							   count<= m;
				when 1 => En <= "101";
						      count<= z;
				when 2 => En <= "110";
								count<= 0;
				when others => En <= "111";
			end case;
			
------------------7 display----------------------------------------------------------------------------------------------------------------------------		
			case count is
				when 0 => Display <= "11000000";
				when 1 => Display <= "11111001";
				when 2 => Display <= "10100100";
				when 3 => Display <= "10110000";
				when 4 => Display <= "10011001";
				when 5 => Display <= "10010010";
				when 6 => Display <= "10000010";
				when 7 => Display <= "11111000";
				when 8 => Display <= "10000000";
				when 9 => Display <= "10010000";
				when others => Display <="11111111";
			end case;
		
---------------------------------------------funcionamiento de pwm o bomba dispensar el gel-------------------------------------------------------------------------------------
	if(ACT_0 = '1') then
		bomba <= '1'; 
	 end if;
	 
	if(ACT_0 = '0') then
		 bomba <= '0';
		 end if;
		
	
		 
 sensbo <= ACT_0;
   end if;
end process;



end Behavioral;
