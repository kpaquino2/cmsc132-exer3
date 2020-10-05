library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- 8 to 1 multiplexer
entity MUX is
    port (
        s0, s1, s2, i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic;
        z : out std_logic
    );
end entity MUX;

architecture arch of MUX is
    signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic;
begin
    process is begin
        wait on s0, s1, s2, a0, a1, a2, a3, a4, a5, a6, a7, i0, i1, i2, i3, i4, i5, i6, i7 ;
        a0 <= i0  and (not s0)  and  (not s1)  and  (not s2);
        a1 <= i1  and (not s0)  and  (not s1)  and       s2;             
        a2 <= i2  and (not s0)  and       s1   and  (not s2);
        a3 <= i3  and (not s0)  and       s1   and       s2;
        a4 <= i4  and      s0   and  (not s1)  and  (not s2);
        a5 <= i5  and      s0   and  (not s1)  and       s2;
        a6 <= i6  and      s0   and       s1   and  (not s2);
        a7 <= i7  and      s0   and       s1   and       s2;
        z <= a0 or a1 or a2 or a3 or a4 or a5 or a6 or a7;
    end process;
end architecture arch;