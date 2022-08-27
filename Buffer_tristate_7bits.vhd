library ieee;    
use ieee.std_logic_1164.all;    
  
entity Buffer_tristate_7bits is  
port (Entrada: in std_logic_vector(6 downto 0);
      En: in std_logic;
      Salida: out std_logic_vector(6 downto 0));
end Buffer_tristate_7bits;
    
architecture Solucion of Buffer_tristate_7bits is
begin
   Salida<="ZZZZZZZ" when En='0' else Entrada;
end Solucion;