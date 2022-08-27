library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj_Segundos is
port (Clock: in std_logic;
		Segundo: buffer std_logic_vector(5 downto 0);
		Fin: out std_logic);
end Reloj_Segundos;

architecture Desarrollo of Reloj_Segundos is
begin
	process(Clock)
		begin
		if (Clock'event and Clock='1') then Segundo<=Segundo+1; Fin<='0';
			if (Segundo="111011") then Segundo<="000000"; Fin<='1'; 
			end if;
		end  if;
	end process;
end Desarrollo;