library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SUB_2 is
    port (
        s0, s1, i0, i1, j0, j1 : in std_logic;
        k0, k1, c_out : out std_logic
    );
end entity SUB_2;

architecture arch of SUB_2 is
    signal j0_c, j1_c, s_and, c : std_logic;
begin
    process is begin
        wait on s0, s1, i0, i1, j0, j1, j0_c, j1_c, c;
        j1_c <= not j1;
        j0_c <= not j0;
        s_and <= s0 and s1;

        k1 <= (i1 xor j1_c) xor s_and;
        c <= (i1 and j1_c) or (s_and and (i1 xor j1_c));
        k0 <= (i0 xor j0_c) xor c;
        c_out <= (i0 and j0_c) or (c and (i0 xor j0_c));
    end process;
end architecture arch;