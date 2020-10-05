library IEEE;
use IEEE.std_logic_1164.all;

-- OR operation
entity OR_OP is
	port (
		i0, j0, i1, j1, s0 : in std_logic;
		k0, k1, c_out : out std_logic
	);
end entity OR_OP; 

architecture arch of OR_OP is
begin
	process is begin
		wait on i0, j0, i1, j1, s0;
		k1 <= i1 or j1;
		k0 <= i0 or j0;
		c_out <= s0;
	end process;
end architecture arch;