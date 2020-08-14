module ReLU(
clk,
rst_n,
Din,
Dout
);
    parameter WIDTH=8;
    input clk;
    input rst_n;
    input [2*WIDTH-1:0] Din;
    output reg [2*WIDTH-1:0] Dout;

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n)
            Dout <= 16'd0;
        else begin
            if (Din[15] == 1'b0) 
                Dout <= Din; // �жϷ���λ������λΪ 0 ��Ϊ���������ֲ���;
            else
                Dout <= 16'd0;
        end
    end

endmodule