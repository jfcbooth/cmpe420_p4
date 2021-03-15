module bcdadd #(parameter DIGITS = 4) (
    input wire [(DIGITS*4)-1:0] A,
    input wire [(DIGITS*4)-1:0] B,
    output wire [(DIGITS*4)-1:0] sum
);

genvar i;
genvar j;
generate
    for(i = 1; i < DIGITS+1; i = i+1) begin:blk
        wire [(DIGITS*4)-1:0] out;
        if(i == 1) begin
            assign out = A[3:0];
        end
        else begin
            for(j = 0; j < i; j = j + 1) begin: mult
                wire [(DIGITS*4)-1:0] multi;
                if(j == 0)
                    assign multi = 8'd1;
                else
                    assign multi = (mult[j-1].multi * 8'd10);
            end
            assign out = blk[i-1].out + ((A[(i*4)-1:(i*4)-4]) * mult[i-1].multi); // one bcd digit
        end
    end

    //assign sum = blk[DIGITS].out;

    for(i = 0; i < DIGITS; i = i+1) begin:blk2
        wire [(DIGITS*4)-1:0] out2;
        if(i == 0) begin
            assign out2 = blk[DIGITS].out;
        end
        else begin
            for(j = 0; j < i; j = j + 1) begin: mult2
                wire [(DIGITS*4)-1:0] multi;
                if(j == 0)
                    assign multi = 8'd1;
                else
                    assign multi = (mult2[j-1].multi * 8'd10);
            end
            assign out2 = blk2[i-1].out2 + ((B[(i*4)-1:(i*4)-4]) * mult2[i-1].multi); // one bcd digit
        end
    end
 endgenerate

    assign sum = blk2[DIGITS-1].out2;

endmodule