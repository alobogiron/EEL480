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
		r0, r1, r2, r3, r4, x: in std_logic_vector (3 downto 0); 
		--vetor de entrada e senhas, r corresponde a cada digito da senha e x corresponde ao dígito de entrada
		z: out std_logic_vector (2 downto 0);
	    	--saída corresponde ao índice do dígito que foi encontrado ou 111 quando nenhum dígito corresponde com a entrada informada
	    );
end comparador;
--A arquitetura selecionada para este modo é Behavioral, pois utilizamos expressões lógicas.
architecture Behavioral of comparador is
begin
	-- O Seguinte processo consiste em checar se a entrada corresponde a algum digito da forca, caso corresponda o processo preenche a saída com o índice em binário do dígito correspondente.
	process(x)
	begin
	if x = r0 then
		z <= "000";
	elsif x = r1 then
		z <= "001";
	elsif x = r2 then
		z <= "010";
	elsif x = r3 then
		z <= "011";
	elsif x = r4 then
		z <= "100";
	else
		z <= "111";
	end process;
end Behavioral;
