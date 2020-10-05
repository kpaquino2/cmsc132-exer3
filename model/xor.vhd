library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity XOR_OP is
    port (
        s0, i0, i1, j0, j1: in std_logic;
        k0, k1, c_out: out std_logic
    );
end entity XOR_OP;

architecture arch of XOR_OP is
begin
    process is begin
        wait on i0, i1, j0, j1;
        k0 <= i0 xor j0;
        k1 <= i1 xor j1;
        c_out <= s0;
    end process;
end architecture arch;