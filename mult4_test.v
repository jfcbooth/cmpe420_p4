module multiplier4_test();

reg [3:0] A;
reg [3:0] B;
wire [7:0] C;

multiplier4 uut(A, B, C);

initial begin
    
    A = 4'b1001;
    B = 4'b0101;
    #1
    if(C != 7'b0101101) $display("%b != 0101101", C);

    $display("test finished");
    $finish;
end

endmodule