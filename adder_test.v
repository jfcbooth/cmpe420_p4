`default_nettype none
`timescale 1ns/1ns

module halfadd_test();
reg a, b;
wire s, c;
halfadd uut(a, b, s, c);

initial begin
    a = 1;
    b = 1;
    #1
    if(s != 0 || c != 1) $display("%b | %b\n", s, c);

    $display("Test finished");
    $finish;
end
endmodule



module fulladd_test();
reg a, b, cin;
wire s,c;
fulladd uut(a,b, cin,s,c);

initial begin
    a = 1;
    b = 1;
    cin = 0;
    #1
    if(s != 0 || c != 1) $display("%b | %b\n", s, c);

    a = 1;
    b = 0;
    cin = 1;
    #1
    if(s != 0 || c != 1) $display("%b | %b\n", s, c);

    a = 1;
    b = 1;
    cin = 1;
    #1
    if(s != 1 || c != 1) $display("%b | %b\n", s, c);

    $display("Test finished");
    $finish;
end
endmodule


module adder_test();
parameter WIDTH = 4;
reg [WIDTH-1:0] a;
reg [WIDTH-1:0] b;
wire [WIDTH-1:0] s;
wire c;
adder uut(a,b,s,c);

initial begin
    a = 4'b1011;
    b = 4'b1001;
    #1
    $display("S = %b, C = %b", s, c);
    //if(s != 0 || c != 1) $display("%b | %b\n", s, c);
    $display("Test finished");
    $finish;
end
endmodule