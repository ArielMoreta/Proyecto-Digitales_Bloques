library ieee;
use ieee.std_logic_1164.all;

entity MSS is
	port(Clk,Resetear,Hora,Minuto,Clock,Fotocelda,Fin_V1,Fin_V2,Fin_V3,Fin_V4,Riego: in std_logic;
		  Switch: in std_logic_vector(1 downto 0);
		  En_Decena,En_Unidad,Ld_Hora_Real,Ld_Min_Real,Ld_Hora_Riego,Ld_Min_Riego,Conf,Display,En_V1,Ld_V1,
		  En_V2,Ld_V2,En_V3,Ld_V3,En_V4,Ld_V4,SC,V1_Led,V2_Led,V3_Led,V4_Led: out std_logic;
		  Sel: out std_logic_vector(1 downto 0));
end MSS;

architecture Controlador of MSS is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Too,Tp,Tq,Tr,Ts,Tt,Tu,Tv,Tw,Tx,Ty,Tz,
					 Taa,Tab,Tac,Tad,Tae,Taf,Tag,Tah,Tai,Taj,Tak,Tal,Tam,Tan,Tao,Tap,Taq,Tar,Tas,Tat,Tau,Tav,Taw,Tax,Tay);
signal y: estado;
begin
	process(Clk, Resetear)
	begin
		if Resetear='0' then y<=Ta;
		elsif (Clk' event and Clk='1') then
			case y is
				when Ta=> if (Hora='1' and Clock='0') then y<=Tb; else y<=Ta; end if;
				when Tb=> if (Hora='0' and Clock='0') then y<=Tc; else y<=Tb; end if;
				when Tc=> y<=Td;
				when Td=> if (Hora='1' and Clock='0') then y<=Te; else y<=Td; end if;
				when Te=> if (Hora='0' and Clock='0') then y<=Tf; else y<=Te; end if;
				when Tf=> y<=Tg;
				when Tg=> y<=Th;
				when Th=> if (Minuto='1' and Clock='0') then y<=Ti; else y<=Th; end if;
				when Ti=> if (Minuto='0' and Clock='0') then y<=Tj; else y<=Ti; end if;
				when Tj=> y<=Tk;
				when Tk=> if (Minuto='1' and Clock='0') then y<=Tl; else y<=Tk; end if;
				when Tl=> if (Minuto='0' and Clock='0') then y<=Tm; else y<=Tl; end if;
				when Tm=> y<=Tn;
				when Tn=> y<=Too;
				when Too=> if (Hora='1' and Clock='1') then y<=Tp; else y<=Too; end if;
				when Tp=> if (Hora='0' and Clock='1') then y<=Tq; else y<=Tp; end if;
				when Tq=> y<=Tr;
				when Tr=> if (Hora='1' and Clock='1') then y<=Ts; else y<=Tr; end if;
				when Ts=> if (Hora='0' and Clock='1') then y<=Tt; else y<=Ts; end if;
				when Tt=> y<=Tu;
				when Tu=> y<=Tv;
				when Tv=> if (Minuto='1' and Clock='1') then y<=Tw; else y<=Tv; end if;
				when Tw=> if (Minuto='0' and Clock='1') then y<=Tx; else y<=Tw; end if;
				when Tx=> y<=Ty;
				when Ty=> if (Minuto='1' and Clock='1') then y<=Tz; else y<=Ty; end if;
				when Tz=> if (Minuto='0' and Clock='1') then y<=Taa; else y<=Tz; end if;
				when Taa=> y<=Tab;
				when Tab=> y<=Tac;
				when Tac=> if (Minuto='1' and Switch="00") then y<=Tad; else y<=Tac; end if;
				when Tad=> if (Minuto='0' and Switch="00") then y<=Tae; else y<=Tad; end if;
				when Tae=> y<=Taf;
				when Taf=> if (Minuto='1' and Switch="01") then y<=Tag; else y<=Taf; end if;
				when Tag=> if (Minuto='0' and Switch="01") then y<=Tah; else y<=Tag; end if;
				when Tah=> y<=Tai;
				when Tai=> if (Minuto='1' and Switch="10") then y<=Taj; else y<=Tai; end if;
				when Taj=> if (Minuto='0' and Switch="10") then y<=Tak; else y<=Taj; end if;
				when Tak=> y<=Tal;
				when Tal=> if (Minuto='1' and Switch="11") then y<=Tam; else y<=Tal; end if;
				when Tam=> if (Minuto='0' and Switch="11") then y<=Tan; else y<=Tam; end if;
				when Tan=> y<=Tao;
				when Tao=> if Minuto='1' then y<=Tap; else y<=Tao; end if;
				when Tap=> if Minuto='0' then y<=Taq; else y<=Tap; end if;
				when Taq=> if (Fotocelda='1' and Riego='1') then y<=Tar; else y<=Taq; end if;
				when Tar=> y<=Tas;
				when Tas=> if Fin_V1='1' then y<=Tat; else y<=Tar; end if;
				when Tat=> y<=Tau;
				when Tau=> if Fin_V2='1' then y<=Tav; else y<=Tat; end if;
				when Tav=> y<=Taw;
				when Taw=> if Fin_V3='1' then y<=Tax; else y<=Tav; end if;
				when Tax=> y<=Tay;
				when Tay=> if Fin_V4='1' then y<=Ta; else y<=Tax; end if;
			end case;
		end if;
	end process;
	
	process(y)
	begin
	En_Decena<='0'; En_Unidad<='0'; Ld_Hora_Real<='0'; Ld_Min_Real<='0'; Ld_Hora_Riego<='0'; Ld_Min_Riego<='0'; Conf<='0'; 
	En_V1<='0'; Ld_V1<='0'; Display<='0'; En_V2<='0'; Ld_V2<='0'; En_V3<='0'; Ld_V3<='0'; En_V4<='0'; Ld_V4<='0'; SC<='0';
	V1_Led<='0'; V2_Led<='0'; V3_Led<='0'; V4_Led<='0'; Sel<="00";
		case y is
			when Tc=> En_Decena<='1';
			when Tf=> En_Unidad<='1';
			when Tg=> Ld_Hora_Real<='1';
			when Tj=> En_Decena<='1';
			when Tm=> En_Unidad<='1';
			when Tn=> Ld_Min_Real<='1';
			when Tq=> En_Decena<='1';
			when Tt=> En_Unidad<='1';
			when Tu=> Ld_Hora_Riego<='1';
			when Tx=> En_Decena<='1';
			when Taa=> En_Unidad<='1';
			when Tab=> Ld_Min_Riego<='1';
			when Tac=> Conf<='1'; 
			when Tad=> Conf<='1';
			when Tae=> En_V1<='1'; Ld_V1<='1'; V1_Led<='1'; Sel<="00"; Display<='1'; Conf<='1';
			when Taf=> V1_Led<='1'; Sel<="00"; Display<='1'; Conf<='1';
			when Tag=> V1_Led<='1'; Sel<="00"; Display<='1'; Conf<='1';
			when Tah=> En_V2<='1'; Ld_V2<='1'; V2_Led<='1'; Sel<="01"; Display<='1'; Conf<='1';
			when Tai=> V2_Led<='1'; Sel<="01"; Display<='1'; Conf<='1';
			when Taj=> V2_Led<='1'; Sel<="01"; Display<='1'; Conf<='1';
			when Tak=> En_V3<='1'; Ld_V3<='1'; V3_Led<='1'; Sel<="10"; Display<='1'; Conf<='1';
			when Tal=> V3_Led<='1'; Sel<="10"; Display<='1'; Conf<='1';
			when Tam=> V3_Led<='1'; Sel<="10"; Display<='1'; Conf<='1';
			when Tan=> En_V4<='1'; Ld_V4<='1'; V4_Led<='1'; Sel<="11"; Display<='1'; Conf<='1';
			when Tao=> V4_Led<='1'; Sel<="11"; Display<='1'; Conf<='1';
			when Tap=> V4_Led<='1'; Sel<="11"; Display<='1'; Conf<='1';
			when Taq=> Sel<="00"; SC<='1';
			when Tar=> Sel<="00"; Display<='1'; SC<='1'; V1_Led<='1';
			when Tas=> En_V1<='1'; Sel<="00"; Display<='1'; SC<='1'; V1_Led<='1';
			when Tat=> Sel<="01"; Display<='1'; SC<='1'; V2_Led<='1';
			when Tau=> En_V2<='1'; Sel<="01"; Display<='1'; SC<='1'; V2_Led<='1';
			when Tav=> Sel<="10"; Display<='1'; SC<='1'; V3_Led<='1';
			when Taw=> En_V3<='1'; Sel<="10"; Display<='1'; SC<='1'; V3_Led<='1';
			when Tax=> Sel<="11"; Display<='1'; SC<='1'; V4_Led<='1';
			when Tay=> En_V4<='1'; Sel<="11"; Display<='1'; SC<='1'; V4_Led<='1';		
			when others=>
		end case;
	end process;
end Controlador;