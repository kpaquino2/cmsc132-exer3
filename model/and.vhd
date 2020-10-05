library IEEE;
use IEEE.std_logic_1164.all;

-- AND operation
entity AND_OP is
	port (
		i0, j0, i1, j1, s0 : in std_logic;
		k0, k1, c_out : out std_logic
	);
end entity AND_OP; 

architecture arch of AND_OP is
begin
	process is begin
		wait on i0, j0, i1, j1, s0;
		k1 <= i1 and j1;
		k0 <= i0 and j0;
		c_out <= s0;
	end process;
end architecture arch;