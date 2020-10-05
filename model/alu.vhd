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
    signal k0_AND, k1_AND, c_out_AND, 
    k0_OR, k1_OR, c_out_OR, 
    k0_XOR, k1_XOR, c_out_XOR, 
    k0_NOT, k1_NOT, c_out_NOT, 
    k0_ADD, k1_ADD, c_out_ADD, 
    k0_SUB_1, k1_SUB_1, c_out_SUB_1, 
    k0_SUB_2, k1_SUB_2, c_out_SUB_2, 
    k0_INC, k1_INC, c_out_INC: std_logic;
begin
    AND_OP : entity work.AND_OP(arch) port map (i0, j0, i1, j1, s0, k0_AND, k1_AND, c_out_AND);
    OR_OP : entity work.OR_OP(arch) port map (i0, j0, i1, j1, s0, k0_OR, k1_OR, c_out_OR);
    XOR_OP : entity work.XOR_OP(arch) port map(s0, i0, i1, j0, j1, k0_XOR, k1_XOR, c_out_XOR);
    NOT_OP : entity work.NOT_OP(arch) port map(s0, i0, i1, k0_NOT, k1_NOT, c_out_NOT);
    ADD : entity work.ADD(arch) port map (i0, j0, i1, j1, k0_ADD, k1_ADD, c_out_ADD);
    SUB_1 : entity work.SUB_1(arch) port map (i0, j0, i1, j1, k0_SUB_1, k1_SUB_1, c_out_SUB_1);
    SUB_2_OP : entity work.SUB_2(arch) port map(s0, s1, i0, i1, j0, j1, k0_SUB_2, k1_SUB_2, c_out_SUB_2);
    INC_OP : entity work.INC(arch) port map(s0, s1, s2, i0, i1, k0_INC, k1_INC, c_out_INC);
    MUX_0 : entity work.MUX(arch) port map(s0, s1, s2, k0_AND, k0_OR, k0_XOR, k0_NOT, k0_ADD, k0_SUB_1, k0_SUB_2, k0_INC, k0);
    MUX_1 : entity work.MUX(arch) port map(s0, s1, s2, k1_AND, k1_OR, k1_XOR, k1_NOT, k1_ADD, k1_SUB_1, k1_SUB_2, k1_INC, k1);
    MUX_C : entity work.MUX(arch) port map(s0, s1, s2, c_out_AND, c_out_OR, c_out_XOR, c_out_NOT, c_out_ADD, c_out_SUB_1, c_out_SUB_2, c_out_INC, c_out);
    signal k0_AND, k1_AND, c_out_AND,
    k0_OR, k1_OR, c_out_OR, 
    k0_ADD, k1_ADD, c_out_ADD, 
    k0_SUB_1, k1_SUB_1, c_out_SUB_1 : std_logic;
end architecture struc;