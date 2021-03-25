--standard libraries
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;


--creating this package
--so we can use it in ALU16BIT
PACKAGE ALU_1_BIT IS

	COMPONENT ALU1BIT IS

	PORT (A,B,Ainvert,Binvert,CarryIn : IN STD_LOGIC ;
									Operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							Result,CarryOut : OUT STD_LOGIC);
									 
			  
	END COMPONENT;
	
END PACKAGE ALU_1_BIT;

	
--standard libraries		
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--using the package we created
--with all the components we need
USE work.ALU_Comp.ALL;


--ALU1BIT ENTITY
--Inputs:A,B as bits, Ainvert for the invertion of A, Binvert for the invertion of B,
--CarryIn, Operation signals which operation our ALU will execute
--Outputs: Result and CarryOut (Self explanatory)

ENTITY ALU1BIT IS

	PORT (A,B,Ainvert,Binvert,CarryIn : IN STD_LOGIC ;
									Operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							Result,CarryOut : OUT STD_LOGIC);
									 
			  
END ALU1BIT ;



--ALU1BITT architecture to be followed

ARCHITECTURE Structural OF ALU1BIT IS
	
	--Signals used for connecting gates or components of the ALU1BIT circuit
	
	SIGNAL Aterm,Bterm,myAND,myOR,myXOR,sum1: STD_LOGIC;
	

BEGIN
	
		--using multiplexer 2 to 1 component for A
		Step0: my_mux2to1 PORT MAP (A,NOT A,Ainvert,Aterm);
		
		--using multiplexer 2 to 1 component for B
		Step1: my_mux2to1 PORT MAP (B,NOT B,Binvert,Bterm);
		
		--using myAND signal for the AND operation
		Step2: myAND<= Aterm AND Bterm;
		
		--using myOR signal for the OR operation 
		Step3: myOR<= Aterm OR Bterm;
		
		--using fullAdder component for the add-sub operation
		Step4: fullAdder PORT MAP(Aterm,Bterm,CarryIn,sum1,CarryOut);
		
		--using myXOR signal for the XOR operation
		Step5: myXOR<=Aterm XOR Bterm;
		
		--using multiplexer 4 to 1
		Step6: my_mux4to1 PORT MAP(myAND,myOR,sum1,myXOR,Operation,Result);
		
		
		
			 
END Structural;