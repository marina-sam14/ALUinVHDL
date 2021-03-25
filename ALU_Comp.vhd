--standard libraries
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--Naming the package with the components we need
--so we can use it in our ALU

PACKAGE ALU_COMP IS


--2 to 1 Multiplexer Component(2 inputs, 1 data selection input
--and 1 output with the final result)

	COMPONENT my_mux2to1 

		PORT (w0, w1, s : IN STD_LOGIC ;
						  f : OUT STD_LOGIC ) ;

	END COMPONENT;
		

--4 to 1 Multiplexer Component (4 inputs, 1 data selection input
--and 1 output with the final result)
		

	COMPONENT my_mux4to1 

		PORT (w0, w1,w2,w3 : IN STD_LOGIC ;
							  s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
							  f : OUT STD_LOGIC ) ;
			 
	END COMPONENT;

		
--FullAdder Component for adding and subtracting 
--binary numbers(Inputs:2 binary numbers and carry in
--Outputs:Sum and carry out)


	COMPONENT fullAdder 

		PORT (a,b,cin : in STD_LOGIC;
			 sum, cout : out STD_LOGIC);

	END COMPONENT;
		
		
		
END PACKAGE ALU_COMP;




--Defining the architecture
--of each component we listed above

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux2to1 IS
	
	PORT (w0, w1, s : IN STD_LOGIC ;
					  f : OUT STD_LOGIC ) ;
					  
END my_mux2to1;

--Mux 2 to 1 architecture
--if the selection bit is 0 output becomes equal 
--to our first input, otherwise to our second.

ARCHITECTURE Behavior OF my_mux2to1 IS

	BEGIN 
		WITH s SELECT
		
			f <= w0 WHEN '0',
				  w1 WHEN OTHERS ;
			
END Behavior ;



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux4to1 IS

	PORT (w0, w1,w2,w3 : IN STD_LOGIC ;
						  s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
						  f : OUT STD_LOGIC ) ;
END my_mux4to1 ;

--Mux 4 to 1 architecture, similarly
--except the data selection can take 4 possible values
--because there are 4 inputs instead of 2

ARCHITECTURE Behavior OF my_mux4to1 IS
	
	BEGIN
		WITH s SELECT
			f <= w0 WHEN "00",--and
					w1 WHEN "01",--or
					w2 WHEN "10",--full adder 
					w3 WHEN OTHERS;--xor
			
END Behavior ;



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fullAdder IS
	
	PORT (a, b,cin : IN STD_LOGIC;
		  sum, cout : OUT STD_LOGIC);

END fullAdder;

--FullAdder Architecture
--sum and cout get the appropriate values

ARCHITECTURE Behavior OF fullAdder IS
	
BEGIN
	
	sum <= (a AND (NOT b) AND (NOT cin)) OR ((NOT a) AND b AND (NOT cin)) OR ((NOT a) AND (NOT b) AND cin) OR (a AND b AND cin);
  cout <= ( a AND b) OR (cin AND a) OR (cin AND b);
	
END Behavior;


