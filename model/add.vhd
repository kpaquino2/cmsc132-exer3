library IEEE;
use IEEE.std_logic_1164.all;

-- ADD operation
entity ADD is
	port (
		i0, j0, i1, j1 : in std_logic;
		k0, k1, c_out : out std_logic
	) ;
end entity ADD; 

architecture arch of ADD is
	signal carry: std_logic;
begin
	process is begin
		wait on i0, j0, i1, j1, carry;
		k1 <= i1 xor j1;
		carry <= i1 and j1;
		k0 <= (i0 xor j0) xor carry;
		c_out <= (i0 and j0) or (carry and (i0 xor j0));
	end process;
end architecture arch;