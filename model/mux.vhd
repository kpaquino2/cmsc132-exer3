library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- 8 to 1 multiplexer
entity MUX is
    port (
        s0, s1, s2, a0, a1, a2, a3, a4, a5, a6, a7 : in std_logic;
        z : out std_logic
    );
end entity MUX;

architecture arch of MUX is
    signal i0, i1, i2, i3, i4, i5, i6, i7 : std_logic;
begin
    process is begin
        wait on s0, s1, s2, a0, a1, a2, a3, a4, a5, a6, a7, i0, i1, i2, i3, i4, i5, i6, i7 ;
        i0 <= a0  and (not s0)  and  (not s1)  and  (not s2);
        i1 <= a1  and (not s0)  and  (not s1)  and       s2;             
        i2 <= a2  and (not s0)  and       s1   and  (not s2);
        i3 <= a3  and (not s0)  and       s1   and       s2;
        i4 <= a4  and      s0   and  (not s1)  and  (not s2);
        i5 <= a5  and      s0   and  (not s1)  and       s2;
        i6 <= a6  and      s0   and       s1   and  (not s2);
        i7 <= a7  and      s0   and       s1   and       s2;
        z <= i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7;
    end process;
end architecture arch;