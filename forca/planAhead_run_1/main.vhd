----------------------------------------------------------------------------------
-- Create Date:    Fri Dec  8 12:21:48 2023
-- Design Name: 
-- Module Name:    main - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity main is
  Port ( 
    V_SW : in STD_LOGIC_VECTOR ( 3 downto 0 );
    LED : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLOCK_50 : in STD_LOGIC;
    RS : out STD_LOGIC;
    RW : out STD_LOGIC;
    E : out STD_LOGIC
  );

end main;

architecture Behavioral of main is 
begin

end Behavioral;
