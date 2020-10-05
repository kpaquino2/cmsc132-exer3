library IEEE;
use IEEE.std_logic_1164.all;

-- SUB 1's operation
entity SUB_1 is
	port (
		i0, j0, i1, j1 : in std_logic;
		k0, k1, c_out : out std_logic
	) ;
end entity SUB_1; 

architecture arch of SUB_1 is
	signal j0_c, j1_c, carry: std_logic;
begin
	process is begin
		wait on i0, j0, i1, j1, j0_c, j1_c, carry;
		j1_c <= not j1;
		j0_c <= not j0;

		k1 <= i1 xor j1_c;
		carry <= i1 and j1_c;
		k0 <= (i0 xor j0_c) xor carry;
		c_out <= (i0 and j0_c) or (carry and (i0 xor j0_c));

	end process;
end architecture arch;