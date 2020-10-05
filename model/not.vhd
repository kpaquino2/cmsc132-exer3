library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NOT_OP is
    port (
        s0, i0, i1 : in std_logic;
        k0, k1, c_out: out std_logic
    );
end entity NOT_OP;

architecture arch of NOT_OP is
begin
    process is begin
        wait on i0, i1;
        k0 <= not i0;
        k1 <= not i1;
        c_out <= s0;
    end process;
end architecture arch;