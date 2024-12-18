LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is -- ALU2 unit
	port ( clk, res: in std_logic ;
			Reg1, Reg2 : in std_logic_vector(7 downto 0); 
			opcode : in std_logic_vector(7 downto 0); 
			Result  : out std_logic_vector(7 downto 0)
			);
end ALU2 ;

architecture calculation of ALU2 is
begin
	
	process (clk, res)
	begin
		if res = '0' then
			Result <= "00000000" ;
		elsif (clk'EVENT AND clk = '1') then
			case opcode is
				when "00000001" =>
					Result <= "11" & reg1(7 DOWNTO 2); --Shift A right 2 bits (input = 1) (SHR)
				when "00000010" =>
					Result <= reg1 - reg2 + "0100"; --A-B + 4
				when "00000100" =>
					if (reg1 > reg2) then
						Result <= reg1;
					else
						Result <= reg2; --Max(A, B)
					end if;
					
				when "00001000" =>
					Result <= reg2(3 DOWNTO 0) & reg1(3 DOWNTO 0); --Swap upper 4 A bits with lower 4 B bits
				when "00010000" =>
					Result <= reg1 + '1'; --A + 1
				when "00100000" =>
					Result <= reg1 and reg2; --A and B
				when "01000000" =>
					Result <= not(reg1(7 downto 4)) & reg1(3 downto 0); --Invert upper 4 A bits
				when "10000000" =>
					Result <= reg2(4 DOWNTO 0) & reg2(7 DOWNTO 5); --Rotate B 3 bits left (ROL)
				when others =>
					Result <= "00000000";
			end case;
      end if;

    end process;
end calculation;