library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj_Horas is
port (Data: in std_logic_vector(4 downto 0);
		Load: in std_logic;
		Clock: in std_logic;
		Hora: buffer std_logic_vector(4 downto 0));
end Reloj_Horas;

architecture Desarrollo of Reloj_Horas is
begin
	process(Clock)
		begin
		if Load='1' then Hora<=Data;
		elsif (Clock'event and Clock='1') then Hora<=Hora+1;
			if (Hora="10111") then Hora<="00000"; end if;
		end  if;
	end process;
end Desarrollo;