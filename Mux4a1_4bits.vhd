library ieee;
use ieee.std_logic_1164.all;

entity Mux4a1_4bits is
port( Sel: in std_logic_vector(1 downto 0);
		I0,I1,I2,I3: in std_logic_vector (3 downto 0);
		Q: out std_logic_vector (3 downto 0));
end Mux4a1_4bits;

architecture Desarrollo of Mux4a1_4bits is
begin
	process(Sel)
	begin
		case Sel is
			when "00"=> Q<=I0;
			when "01"=> Q<=I1;
			when "10"=> Q<=I2;
			when "11"=> Q<=I3;
		end case;
	end process;
end Desarrollo;