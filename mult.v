module multiplier #(parameter WIDTH = 4) (
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    output wire [(WIDTH*2)-1:0] C
);

genvar i;
generate
    for(i = 0; i < WIDTH; i=i+1) begin:blk
        wire [(WIDTH*2)-1:0] a;
        if(i == 0)begin
            assign a = ((B[i] == 0) ? 0 : (A << i));
        end
        else begin
            assign a = blk[i-1].a + ((B[i] == 0) ? 0 : (A << i));
        end
    end
endgenerate

assign C = blk[WIDTH-1].a;

endmodule