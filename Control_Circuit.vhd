--standard libraries
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


--Creating and naming the package
--so we can use it in ALU16BIT

PACKAGE CC IS

	--Consists of Control_Circuit Component

	COMPONENT Control_Circuit
	
		PORT (OPCODE				         : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
				Ainvert, Binvert, CarryIn	: OUT STD_LOGIC;
				Operation				      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
				
	END COMPONENT;	
	
	
END PACKAGE CC;



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--Input:OPCODE
--Outputs:Ainvert,Binvert, CarryIn, Operation

ENTITY Control_Circuit IS
	
	PORT (OPCODE					      : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Ainvert, Binvert, CarryIn	: OUT STD_LOGIC;
			Operation				      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
			
END Control_Circuit;



--Control_Circuit Arch

ARCHITECTURE Behavior OF Control_Circuit IS

BEGIN

	--Process to follow
	Operation_Pick : PROCESS(OPCODE)
		
	BEGIN
		
		--AND OPERATION
		IF(OPCODE="000") THEN 
				
			Operation <= "00";
			  Ainvert <= '0';
			  Binvert <= '0';
			  CarryIn <= '0';
				
			
		--OR OPERATION
		ELSIF(OPCODE="001") THEN
				
			Operation <= "01";
			  Ainvert <= '0';
			  Binvert <= '0';
			  CarryIn <= '0';
				
		
		--ADD OPERATION		
		ELSIF(OPCODE="010") THEN 
				
			Operation <= "10";
			  Ainvert <= '0';
			  Binvert <= '0';
			  CarryIn <= '0';
			  
			  
		--SUB OPERATION			
		ELSIF(OPCODE="011") THEN 
				
			Operation <= "10";
			  Ainvert <= '0';
			  Binvert <= '1';
			  CarryIn <= '1';
					
					
		--NOR OPERATION			
		ELSIF(OPCODE="100") THEN 
				
			Operation <= "00";
			  Ainvert <= '1';
			  Binvert <= '1';
			  CarryIn <= '0';
			  
			  
		--NAND OPERATION			
		ELSIF(OPCODE="101") THEN
				
			Operation <= "01";
			  Ainvert <= '1';
			  Binvert <= '1';
			  CarryIn <= '0';
			  
			  
			  
		--XOR OPERATION	
		ELSIF(OPCODE="110") THEN
				
			Operation <= "11";
			  Ainvert <= '0';
			  Binvert <= '0';
			  CarryIn <= '0';
			  
		
		--OPCODE=111(nothing happens)
		ELSE
				
			Operation <= NULL;
			  Ainvert <= NULL;
			  Binvert <= NULL;
			  CarryIn <= NULL;
					
		END IF;
			
	END PROCESS;
							  
					 
END Behavior;