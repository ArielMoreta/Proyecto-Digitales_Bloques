library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj_Minutos is
port (Data: in std_logic_vector(5 downto 0);
		Load: in std_logic;
		Clock: in std_logic;
		Minuto: buffer std_logic_vector(5 downto 0);
		Fin: out std_logic);
end Reloj_Minutos;

architecture Desarrollo of Reloj_Minutos is
begin
	process(Clock)
		begin
		if Load='1' then Minuto<=Data; Fin<='0';
		elsif (Clock'event and Clock='1') then Minuto<=Minuto+1; Fin<='0';
			if (Minuto="111011") then Minuto<="000000"; Fin<='1'; end if;
		end  if;
	end process;
end Desarrollo;