ghdl -a and.vhd
ghdl -a or.vhd
ghdl -a add.vhd
ghdl -a sub_1.vhd
ghdl -a not.vhd
ghdl -a xor.vhd
ghdl -a mux.vhd
ghdl -a inc.vhd
ghdl -a sub_2.vhd
ghdl -a alu.vhd
ghdl -a and_tb.vhd
ghdl -a or_tb.vhd
ghdl -a xor_tb.vhd
ghdl -a not_tb.vhd
ghdl -a add_tb.vhd
ghdl -a sub_1_tb.vhd
ghdl -a sub_2_tb.vhd
ghdl -a inc_tb.vhd
ghdl -e and_tb
ghdl -e or_tb
ghdl -e xor_tb
ghdl -e not_tb
ghdl -e add_tb
ghdl -e sub_1_tb
ghdl -e sub_2_tb
ghdl -e inc_tb
ghdl -r and_tb --vcd=and_tb.vcd
ghdl -r or_tb --vcd=or_tb.vcd
ghdl -r xor_tb --vcd=xor_tb.vcd
ghdl -r not_tb --vcd=not_tb.vcd
ghdl -r add_tb --vcd=add_tb.vcd
ghdl -r sub_1_tb --vcd=sub_1_tb.vcd
ghdl -r sub_2_tb --vcd=sub_2_tb.vcd
ghdl -r inc_tb --vcd=inc_tb.vcd
gtkwave inc.vcd