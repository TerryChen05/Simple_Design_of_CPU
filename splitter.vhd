LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity splitter is
	port (
	result: in std_logic_vector(7 downto 0);
	res1, res2: out std_logic_vector (3 downto 0);
	negLeft, negRight     : out std_logic
	);
end splitter;

ARCHITECTURE behavior of splitter is
	SIGNAL resLeft : std_logic_vector(3 DOWNTO 0); --temporary results, res1/res2 are outputs
	SIGNAL resRight : std_logic_vector(3 DOWNTO 0); 

BEGIN
	res1 <= result(7 downto 4); --left 4 bits
	res2 <= result(3 downto 0); --right 4 bits
	
	resLeft <= result(7 downto 4);
	negLeft <= resLeft(3); --left sign bit
	
	resRight <= result(3 downto 0);
	negRight <= resRight(3); --right sign bit
	
END behavior;
	