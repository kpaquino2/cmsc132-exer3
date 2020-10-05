library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- INC operation
entity INC is
    port (
        s0, s1, s2, i0, i1 : in std_logic;
        k0, k1, c_out : out std_logic
    );
end entity INC;

architecture arch of INC is
    signal s_and, c : std_logic;
begin
    process is begin
        wait on s0, s1, s2, i0, i1, s_and, c;
        s_and <= s0 and s1 and s2;
        k1 <= s_and xor i1;
        c <= s_and and i1;
        k0 <= i0 xor c;
        c_out <= c and i0;
    end process;    
end architecture arch;