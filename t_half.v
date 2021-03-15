`timescale 1ns/1ns

module t_half();
reg a, b;
wire s, c;
halfadd uut(a, b, s, c);

initial begin
    a = 1;
    b = 1;
    #1 
    $display("%b | %b\n", s, c);
    $display("Test finished");
    $finish;
end
endmodule