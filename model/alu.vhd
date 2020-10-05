library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port (
        s0, s1, s2, i0, i1, j0, j1 : in std_logic;
        k0, k1, c_out : out std_logic
    );
end entity alu;

architecture struc of alu is
    signal k0_XOR, k1_XOR, c_out_XOR, k0_NOT, k1_NOT, c_out_NOT, 
    k0_SUB_2, k1_SUB_2, c_out_SUB_2, k0_INC, k1_INC, c_out_INC: std_logic;
begin
    XOR_OP : entity work.XOR_OP(arch) port map(s0, i0, i1, j0, j1, k0_XOR, k1_XOR, c_out_XOR);
    NOT_OP : entity work.NOT_OP(arch) port map(s0, i0, i1, k0_NOT, k1_NOT, c_out_NOT);
    SUB_2_OP : entity work.SUB_2(arch) port map(s0, s1, i0, i1, j0, j1, k0_SUB_2, k1_SUB_2, c_out_SUB_2);
    INC_OP : entity work.INC(arch) port map(s0, s1, s2, i0, i1, k0_INC, k1_INC, c_out_INC);
    MUX_0 : entity work.MUX(arch) port map(s0, s1, s2, '0', '0', k0_XOR, k0_NOT, '0', '0', k0_SUB_2, k0_INC, k0);
    MUX_1 : entity work.MUX(arch) port map(s0, s1, s2, '0', '0', k1_XOR, k1_NOT, '0', '0', k1_SUB_2, k1_INC, k1);
    MUX_C : entity work.MUX(arch) port map(s0, s1, s2, '0', '0', c_out_XOR, c_out_NOT, '0', '0', c_out_SUB_2, c_out_INC, c_out);
end architecture struc;