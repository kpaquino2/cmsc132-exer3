ghdl -a and.vhd
ghdl -a or.vhd
ghdl -a add.vhd
ghdl -a sub_1.vhd
ghdl -a alu.vhd
ghdl -a alu_tb.vhd
ghdl -e alu_tb
ghdl -r alu_tb --vcd=alu_tb.vcd
gtkwave alu_tb.vcd