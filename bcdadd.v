module bcdadd #(parameter DIGITS = 4) (
    input wire [(DIGITS*4)-1:0] A,
    input wire [(DIGITS*4)-1:0] B,
    output wire [(DIGITS*4)-1:0] sum
);

genvar i;
//genvar j;
generate
    for(i = 0; i < DIGITS+1; i = i+1) begin:blk
        wire [(DIGITS*4)-1:0] out;
        wire [(DIGITS*4)-1:0] carry;
        if(i == 0) begin
            assign out = 8'd0;
            assign carry = 8'd0;
        end
        else begin
            assign out = (A[(i*4)-1:(i*4)-4] + B[(i*4)-1:(i*4)-4]+ blk[i-1].carry > 4'd9) ?
            ((A[(i*4)-1:(i*4)-4] + B[(i*4)-1:(i*4)-4] + blk[i-1].carry - 4'd10) << 4*(i-1)) + blk[i-1].out :
            ((A[(i*4)-1:(i*4)-4] + B[(i*4)-1:(i*4)-4] + blk[i-1].carry) << 4*(i-1)) + blk[i-1].out;
            assign carry = (A[(i*4)-1:(i*4)-4] + B[(i*4)-1:(i*4)-4] + blk[i-1].carry > 4'd9) ? 4'd1 : 4'd0;
        end
    end


            // for(j = 0; j < i; j = j + 1) begin: mult
            //     wire [(DIGITS*4)-1:0] multi;
            //     if(j == 0)
            //         assign multi = 8'd1;
            //     else
            //         assign multi = (mult[j-1].multi * 8'd10);
            // end
    //         assign out = blk[i-1].out + ((A[(i*4)-1:(i*4)-4]) * mult[i-1].multi); // one bcd digit
    //     end
    // end

    //assign sum = blk[DIGITS].out;

 endgenerate

    //assign sum = blk2[DIGITS-1].out2;
    assign sum = blk[DIGITS].out;
endmodule