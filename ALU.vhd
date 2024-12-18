LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU is -- ALU unit
	port ( clk, res : in std_logic ;
			Reg1, Reg2 : in std_logic_vector(7 downto 0);
			opcode : in std_logic_vector(7 downto 0);
			Result  : out std_logic_vector(7 downto 0)
			);
end ALU ;

architecture calculation of ALU is
begin
	process (clk, res)
	begin
		if res = '0' then
			Result <= "00000000" ;	
		elsif (clk'EVENT AND clk = '1') then
			case opcode is
				when "00000001" =>
					Result <= reg1 + reg2;
				when "00000010" =>
					Result <= reg1 - reg2;
				when "00000100" =>
					Result <= not(reg1);
				when "00001000" =>
					Result <= reg1 nand reg2;
				when "00010000" =>
					Result <= reg1 nor reg2;
				when "00100000" =>
					Result <= reg1 and reg2;
				when "01000000" =>
					Result <= reg1 xor reg2;
				when "10000000" =>
					Result <= reg1 or reg2;
				when others =>
					Result <= "00000000";
			end case;
      end if;

    end process;
end calculation;