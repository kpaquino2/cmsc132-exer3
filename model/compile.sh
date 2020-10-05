ghdl -a not.vhd
ghdl -a xor.vhd
ghdl -a mux.vhd
ghdl -a inc.vhd
ghdl -a sub2.vhd
ghdl -a alu.vhd
ghdl -a alu_tb.vhd
ghdl -e alu_tb
ghdl -r alu_tb --vcd=alu.vcd
gtkwave alu.vcd