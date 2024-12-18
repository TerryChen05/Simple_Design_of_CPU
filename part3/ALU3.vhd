LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU3 is -- ALU unit 3 B)
	port ( clk, res : in std_logic ;
			Reg1, Reg2 : in std_logic_vector(7 downto 0); 
			opcode : in std_logic_vector(7 downto 0); 
			student_id : in std_logic_vector(3 downto 0); 
			Result  : out std_logic_vector(3 downto 0) 
			);
end ALU3 ;

architecture calculation of ALU3 is
begin
	process (clk, res)
	begin
		if res = '0' then
			Result <= "0000" ;
		elsif (clk'EVENT AND clk = '1') then
			
			Result <= "111" & student_id(0); -- even: 1110, odd: 1111
			
      end if;

    end process;
end calculation;