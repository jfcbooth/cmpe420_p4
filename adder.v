module halfadd(
    input wire a,
    input wire b,
    output wire s,
    output wire c
);

    xor g1 (s, a, b);
    and g2 (c, a, b);

endmodule

module fulladd(
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout
);

    wire ha1;
    wire ha2;
    wire a1;

    halfadd h1(a, b, ha1, ha2);
    halfadd h2(ha1, cin, s, a1);
    or g1 (cout, a1, ha2);

endmodule


module adder #(parameter WIDTH = 4) (
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    output wire [WIDTH-1:0] S,
    output wire C
);


wire [WIDTH:0] sum;
wire [WIDTH:0] carries;

halfadd f1(A[0], B[0], sum[0], carries[0]);

genvar i;
generate
    for(i = 1; i < WIDTH; i = i + 1) begin: adding
         fulladd f2(A[i], B[i], carries[i-1], sum[i], carries[i]);
    end
endgenerate

assign S = sum[WIDTH-1:0];
assign C = carries[WIDTH-1];

endmodule