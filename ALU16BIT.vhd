--standard libraries
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--Control_Circuit package
USE work.CC.ALL;

--ALU1BIT package
USE work.ALU_1_BIT.ALL;



--Defining the ALU16BIT EntITY
--Inputs: 2 16 bits binary numbers A and B,
--OPCODE representing the operation to follow
--Outputs:Result (self explanatory),
--Overflow representing possible overflow

ENTITY ALU16BIT IS

	PORT (A,B	  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			OPCODE  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Result  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		   Overflow: OUT STD_LOGIC);
	
END ALU16BIT; 


--ALU16BIT Arch
ARCHITECTURE Structural OF ALU16BIT IS

	--Signals used for connecting gates or components of the ALU16BIT circuit
	
	--cout_to_cin will represent the carry out which then becomes the carry in
	-- in the operation for the next 2 bits and so on...
	
	SIGNAL Operation       : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL cout_to_cin     : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL Ainvert, Binvert: STD_LOGIC; 



BEGIN

	--Giving the appropriate values to Ainvert,Binvert,cout_to_cin(0), Operation via the Control_Circuit
	Control_Circ:  Control_Circuit PORT MAP(OPCODE,Ainvert,Binvert,cout_to_cin(0),Operation);
	
	
	--Using the ALU1BIT component 16 times
	--as we have 16bit binary numbers
	
	ALU_16bit: FOR i IN 0 to 15 GENERATE

						ALU_OP: ALU1BIT PORT MAP( A(i), B(i), Ainvert, Binvert, cout_to_cin(i), Operation, Result(i), cout_to_cin(i+1));
					
			     END GENERATE;
	
	
	--if there is a carry out from
	--the addition or subtraction of the last 2 bits
	--then overflow happens (0 when the operation is not addition or sub)
	
	overflow_check: Overflow<= cout_to_cin(16) WHEN Operation = "10" 
															 ELSE '0';
															
		


END Structural;


