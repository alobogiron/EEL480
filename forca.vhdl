library ieee;
use ieee.std_logic_1164.all;

entity forca is
port(
    
    CLOCK    : in std_logic_vector (7 downto 0); ---clock do contador
    V_SW        : in std_logic_vector (3 downto 0); ----- switches da placa  
    LED       : out std_logic_vector (2 downto 0) := (others => '0');------ leds 
    rev0, rev1, rev2, rev3, rev4, rev5, result: out std_logic_vector(3 downto 0)
);
end forca;


architecture hardware of forca is

	
		
    signal user_guess : std_logic_vector (3 downto 0) := (others => '1'); ---- Chute da pessoa 
    
    
    ---- NUMEROS SECRETOS ------
    constant numero_secreto0 : std_logic_vector (3 downto 0) := "0111"; ---- número secreto 0  = 7
    constant numero_secreto1 : std_logic_vector (3 downto 0) := "0001"; ---- número secreto 1 = 1
    constant numero_secreto2 : std_logic_vector (3 downto 0) := "0001"; ---- número seceto 2 = 1
    constant numero_secreto3 : std_logic_vector (3 downto 0) := "0110"; ---- numero secreto 3 = 6
	 constant numero_secreto4 : std_logic_vector (3 downto 0) := "0101"; ---- número seceto 4 = 5
    --constant numero_secreto5 : std_logic_vector (3 downto 0) := "0000"; ---- numero secreto 5 = 0
    
  
   

     ------- QUANTIDADE DE VIDAS ------
    signal vida : std_logic_vector (0 to 2) := (others => '1');   --- começa em 1 1 1
    
    
    ----- O QUE SERA MOSTRADO NO DISPLAY------
    signal revelado_numero0, revelado_numero1, revelado_numero2, revelado_numero3, revelado_numero4, perdeu_ganhou :
    std_logic_vector (3 downto 0) := (others => '1'); ---- numeros que foram revelados e P e G



    signal status   :   std_logic_vector (4 downto 0) := (others => '0'); ----- lugar que estamos , quantos acertos já foram 
    
    
    signal ultima_entrada   :   std_logic_vector (3 downto 0) := (others => '0'); -- ultimo numero a ser contabilizado
    
    signal tempo3 :std_logic:='0'; --indica se o contador está em 3
	 
    begin
	 
      user_guess<=V_SW;
		tempo3<= CLOCK(0) and CLOCK(1);   
       
        forca_process: process(tempo3) 
		  begin
         
                
            if (tempo3 = '1') then -- regra dos tres segundos   
                
            
                if (status = "111111") then  ----- status final, ganhamos o jogo 
                
                    revelado_numero0 <= numero_secreto0 ; ---- para o  display mostrar -
                    
                    revelado_numero1 <= numero_secreto1;---- para o  display mostrar -
                    
                    revelado_numero2 <= numero_secreto2;---- para o  display mostrar -
                    
                    revelado_numero3 <= numero_secreto3;----  para o  display mostrar -
						  
						  revelado_numero4 <= numero_secreto4;----  para o  display mostrar -
						  
						  --revelado_numero5 <= numero_secreto5;----  para o  display mostrar -
                    
                    perdeu_ganhou <= "1100"; ---- para o primeiro display mostrar G  escolha de "1100" arbitrária
                    
                    
                  
                
                elsif (vida/="000") then --- caso ainda estejamos jogando e, logo nao perdemos 
                
                ----- CHECANDO SE ESTÁ COMPATIVEL O CHUTE COM O NUMERO SECRETO----
					 
                    case user_guess is
                    
                        when numero_secreto0 => 
                            revelado_numero0 <= numero_secreto0; 
                            status(0) <= '1';
                            
                        
                        when numero_secreto1 =>
                            revelado_numero1 <= numero_secreto1; 
                            status(1) <= '1';

          
                        --when numero_secreto2 => -- numero 2 igual ao numero 1
                            revelado_numero2 <= numero_secreto2; 
                            
                            status(2) <= '1';
          
          
                        when numero_secreto3 =>
                            revelado_numero3 <= numero_secreto3; 
                            
                            status(3) <= '1';
									 
							   when numero_secreto4 =>
                            revelado_numero4 <= numero_secreto4; 
                            
                            status(4) <= '1';
          
							   --when numero_secreto5 =>
                            --revelado_numero5 <= numero_secreto5; 
                            
                            --status(5) <= '1';          
                
                        when "1010" => null;
								when "1011" => null;  ---PARA OS CASOS EM Q NAO É ERRO NEM ACERTO POIS OS DIGITOS SAO MAIORES QUE 9
								when "1100" => null;
								when "1101" => null;
								when "1110" => null;
								when "1111" => null;
								
								
								
          
          
                        when others => --caso de erro

                            if ((ultima_entrada /= user_guess) AND (vida = "111")) then  --- SE FOR DIFERENTE DO ULTIMO CHUTE PERDE 1 VIDA 
                                ultima_entrada <= user_guess;
										  vida <= "011";
										  end if;
									
									 if ((ultima_entrada /= user_guess) AND (vida = "011")) then
                                ultima_entrada <= user_guess;
										  vida <= "001";
										  end if;
										  
								    if ((ultima_entrada /= user_guess) AND (vida = "001")) then
                                ultima_entrada <= user_guess;
										  vida <= "000";
										 
                                 revelado_numero0 <= "1111";  -- RESETAR A SAIDA 
                                        
                                 revelado_numero1 <= "1111";
                                        
                                 revelado_numero2 <= "1111";
                                        
                                 revelado_numero3 <= "1111";
													 
											revelado_numero4 <= "1111";
                                        
                                 revelado_numero5 <= "1111";
                                        
                                 perdeu_ganhou <= "1110";--- para ficar P no display de 7 segmentos
                                   
                                end if;
                                 
                            
                        end case;
          
                    end if;
                        
                end if;
                        
                        
               end process;
            

        LED(2 downto 0) <= vida; ---- para mostrar no led 
        rev0<=revelado_numero0;
		  
		  rev1<=revelado_numero1;
		  rev2<=revelado_numero2;
		  rev3<=revelado_numero3;
		  rev4<=revelado_numero4;
		  --rev5<=revelado_numero5;
		  result<=perdeu_ganhou;
		  
        
        
       
                                                                     

        
    end hardware;