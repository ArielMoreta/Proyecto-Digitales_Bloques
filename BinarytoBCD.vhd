library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity BinarytoBCD is
port(I: in std_logic_vector(5 downto 0);
	  Unidad,Decena: out std_logic_vector(3 downto 0));
end BinarytoBCD;

Architecture BTB of BinarytoBCD is
signal temporal_unidad: std_logic_vector(5 downto 0);

Begin
	process(I)
	Begin
		if (I<"001010") then 
			Decena<="0000"; temporal_unidad<=I;
		elsif ((I>="001010") and (I<"010100")) then
			Decena<="0001"; temporal_unidad<=(I-"001010");
		elsif ((I>="010100") and (I<"011110")) then
			Decena<="0010"; temporal_unidad<=(I-"010100");
		elsif ((I>="011110") and (I<"101000")) then
			Decena<="0011"; temporal_unidad<=(I-"011110");
		elsif ((I>="101000") and (I<"110010")) then
			Decena<="0100"; temporal_unidad<=(I-"101000");
		elsif ((I>="110010") and (I<"111100")) then
			Decena<="0101"; temporal_unidad<=(I-"110010");
		else
			Decena<="0110"; temporal_unidad<=(I-"111100");
		end if;
	end process;
unidad<=temporal_unidad(3 downto 0);
end BTB;