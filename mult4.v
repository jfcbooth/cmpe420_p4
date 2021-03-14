module multiplier4(
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [7:0] C
);

assign C = ((B[0] == 0) ? 0 : A) + ((B[1] == 0) ? 0 : A << 1) + ((B[2] == 0) ? 0 : A << 2) + ((B[3] == 0) ? 0 : A << 3);

endmodule