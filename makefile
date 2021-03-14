halfadd: adder.v adder_test.v
	iverilog -g2001 adder.v adder_test.v -o adder -s halfadd_test
	./adder

fulladd: adder.v adder_test.v
	iverilog -g2001 adder.v adder_test.v -o adder -s fulladd_test
	./adder

adder: adder.v adder_test.v
	iverilog -g2001 adder.v adder_test.v -o adder -s adder_test
	./adder

mult4: mult4.v mult4_test.v
	iverilog -g2001 mult4.v mult4_test.v -o mult4 -s multiplier4_test
	./mult4

multiplier: mult.v mult_test.v
	iverilog -g2001 mult.v mult_test.v -o mult -s multiplier_test
	./mult

bcdadd: bcdadd.v bcdadd_test.v
	iverilog -g2001 bcdadd.v bcdadd_test.v -o bcdadd -s bcdadd_test
	./bcdadd