----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:54:58 10/21/2023 
-- Design Name: 
-- Module Name:    comparador3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparador is
	port(
		r0,r1,r2,r3,r4,x: in std_logic_vector (3 downto 0); --vetor de entrada e senhas
		z: out std_logic_vector (2 downto 0);	
	    );
end comparador;

architecture Behavioral of comparador is 
begin
	process(x)
	begin
		if x = r0 then
			z <= "001";
		elsif x = r1 then
			z <= "010";
		elsif x = r2 then
			z <= "011";
		elsif x = r3 then
			z <= "100";
		elsif x = r4 then
			z <= "101";
		else
			z <= "000";
	end process;
end Behavioral;
