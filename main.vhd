library ieee;
use ieee.std_logic_1164.all;

entity main is
port(
    
    CLOCK_50    : in std_logic; ---clock do contador
    V_SW        : in std_logic_vector (3 downto 0); ----- switches da placa   
    LED         : out std_logic_vector (2 downto 0) := (others => '0'); ------ leds 
	 RS, RW      : out bit; -- lcd
    E           : buffer bit;  --lcd
	 DB          : out bit_vector(7 downto 0) --lcd 
    
    );
end main;


architecture hardware of main is
signal vida : std_logic_vector(2 downto 0);
signal num0, num1, num2, num3, num4, num5, resultado: std_logic_vector(3 downto 0);
signal counter: std_logic_vector(7 downto 0);

COMPONENT forca is 
    port(
    CLOCK    : in std_logic_vector (7 downto 0); ---clock do contador
    V_SW        : in std_logic_vector (3 downto 0); ----- switches da placa
    LED       : out std_logic_vector (2 downto 0) := (others => '0'); ------ leds 
	 rev0, rev1, rev2, rev3, rev4, rev5, result: out std_logic_vector(3 downto 0)
    );
END COMPONENT forca;

COMPONENT LCD is 
   port (
				revelado0, revelado1, revelado2, revelado3, revelado4, revelado5, resultado : in std_logic_vector(3 downto 0);
				contador : in std_logic_vector(7 downto 0);
		       clk         :     in std_logic; 
				 RS, RW      :    out bit;
		       E           : buffer bit;  
		       DB          :    out bit_vector(7 downto 0);
				 entrada : in std_logic_vector(3 downto 0));
END COMPONENT LCD;

COMPONENT counter_seconds is 
     port(CLOCK_50: in std_logic;
    counter_out: out std_logic_vector(7 downto 0)
    );
END COMPONENT counter_seconds;

-- codigo somente para juntar os componentes e designar a saida para o LED


    begin
	 forca1: forca port map(counter, V_SW, vida, num0, num1, num2, num3, num4, num5, resultado);
	 LCD1: LCD port map(num0, num1, num2, num3, num4, num5,resultado, counter, CLOCK_50, RS, RW, E, DB, V_SW);
	 counter_seconds1 : counter_seconds port map(CLOCK_50,counter);

	 LED<=vida; -- atribuindo a saida a variavel que sai de forca.vhd
	 
	 

    end hardware;