library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCDtoBinary is
port(Decena,Unidad: in std_logic_vector(3 downto 0);
		Binario: out std_logic_vector(6 downto 0));
end BCDtoBinary;

architecture Solucion of BCDtoBinary is
begin
	process(Decena)
	begin
		case Decena is
			when "0000" => Binario<=("000"&Unidad);
			when "0001" => Binario<=("0001010"+("000"&Unidad));
			when "0010" => Binario<=("0010100"+("000"&Unidad));
			when "0011" => Binario<=("0011110"+("000"&Unidad));
			when "0100" => Binario<=("0101000"+("000"&Unidad));
			when "0101" => Binario<=("0110010"+("000"&Unidad));
			when "0110" => Binario<=("0111100"+("000"&Unidad));
			when "0111" => Binario<=("1000110"+("000"&Unidad));
			when "1000" => Binario<=("1010000"+("000"&Unidad));
			when "1001" => Binario<=("1011010"+("000"&Unidad));
			when others => 
		end case;
	end process;
end Solucion;