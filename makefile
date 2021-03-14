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
	iverilog -g2001 mult4.v mult4_test.v -o mult4 -s mult4_test
	./mult4

# fulladd: adder.v adder_test.v
# 	iverilog -g2001 $@.v $@_test.v -o $@ -s $@_test
# 	./$@
