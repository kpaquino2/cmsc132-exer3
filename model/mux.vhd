library IEEE;
use IEEE.std_logic_1164.all;

-- 8:1 MUX
entity MUX is
	port (
		s0, s1, s2, 
		IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7 : in std_logic;
		z : out std_logic
	) ;
end entity MUX; 

architecture arch of MUX is
	signal a0, a1, a2, a3, a4, a5, a6, a7: std_logic;
begin
	process is begin
		wait on s0, s1, s2, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7;
		a0 <= IN0 and (not s0) and (not s1) and (not s2);
 		a1 <= IN1 and (not s0) and (not s1) and s2;  
		a2 <= IN2 and (not s0) and  s1 and (not s2);
		a3 <= IN3 and (not s0) and  s1 and s2;
		a4 <= IN4 and s0 and (not s1) and (not s2);
		a5 <= IN5 and s0 and (not s1) and s2;
		a6 <= IN6 and s0 and s1 and (not s2);
		a7 <= IN7 and s0 and s1 and s2;
		z <= a0 or a1 or a2 or a3 or a4 or a5 or a6 or a7;
	end process;
end architecture arch;