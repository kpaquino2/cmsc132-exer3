ghdl -a model/and.vhd
ghdl -a model/or.vhd
ghdl -a model/add.vhd
ghdl -a model/sub_1.vhd
ghdl -a model/not.vhd
ghdl -a model/xor.vhd
ghdl -a model/mux.vhd
ghdl -a model/inc.vhd
ghdl -a model/sub_2.vhd
ghdl -a model/alu.vhd
ghdl -a test/and_tb.vhd
ghdl -a test/or_tb.vhd
ghdl -a test/xor_tb.vhd
ghdl -a test/not_tb.vhd
ghdl -a test/add_tb.vhd
ghdl -a test/sub_1_tb.vhd
ghdl -a test/sub_2_tb.vhd
ghdl -a test/inc_tb.vhd
ghdl -e and_tb
ghdl -e or_tb
ghdl -e xor_tb
ghdl -e not_tb
ghdl -e add_tb
ghdl -e sub_1_tb
ghdl -e sub_2_tb
ghdl -e inc_tb
ghdl -r and_tb --vcd=test/and_tb.vcd
ghdl -r or_tb --vcd=test/or_tb.vcd
ghdl -r xor_tb --vcd=test/xor_tb.vcd
ghdl -r not_tb --vcd=test/not_tb.vcd
ghdl -r add_tb --vcd=test/add_tb.vcd
ghdl -r sub_1_tb --vcd=test/sub_1_tb.vcd
ghdl -r sub_2_tb --vcd=test/sub_2_tb.vcd
ghdl -r inc_tb --vcd=test/inc_tb.vcd
gtkwave test/inc_tb.vcd