module bcdadd_test();

parameter DIGITS = 4;
reg [(DIGITS*4)-1:0] A;
reg [(DIGITS*4)-1:0] B;
wire [(DIGITS*4)-1:0] sum;
reg [(DIGITS*4)-1:0] C;

bcdadd #(4) uut(A, B, sum);

initial begin
    A = 16'b0000000000000001; // 111
    B = 16'b0000000000000001; // 110 // 221
    //C = 8'd1 << 2;
    #1
    $display("%d", sum);
    $display("Test finished");
    $finish;
end

endmodule