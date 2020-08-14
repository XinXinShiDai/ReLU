module Adder(
clk,
rst_n,
Din0,
Din1,
Din2,
Din3,
Din4,
Din5,
Din6,
Din7,
Dout
);

    input clk;
    input rst_n;
    input signed [15:0] Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7;
    output reg signed [15:0] Dout;

    reg signed [15:0] buffer0,buffer1;
    reg signed [7:0]  bc = 8'b00010111; // 偏置权重；
    
    // 共 8 个：
    // 8'b00010111
    // 8'b00011011
    // 8'b00001010
    // 8'b00011111
    // 8'b00010100
    // 8'b00010111
    // 8'b00100011
    // 8'b00000110

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            Dout <= 0;
        end
        else begin
            buffer0 <= Din0 + Din1 + Din2 + Din3;
            buffer1 <= Din4 + Din5 + Din6 + Din7;
            Dout    <= buffer0 + buffer1 + bc;
        end
    end

endmodule