
module Div(
    input wire clk,
    input wire reset,
    input wire control,
    input wire [31:0] in0,
    input wire [31:0] in1,
    output reg DivZero,
    output reg [31:0] out0,
    output reg [31:0] out1
    );
   

    reg [5:0] counter;
    reg [31:0] M;
    reg [31:0] Q;
    reg [31:0] A;

    always @(posedge clk) begin
        

        if (control == 1'b0) begin
            M = 32'b00000000000000000000000000000000;
            Q = 32'b00000000000000000000000000000000;
            A = 32'b00000000000000000000000000000000;
            counter = 6'b000000;
            DivZero = 1'b0;
        end
        else if(in0 == 32'b00000000000000000000000000000000) begin
            DivZero = 1'b1;
        end 

        else begin
            if (counter == 6'b000000) begin
                M = in0;
                Q = in1;    
            end
            if (counter == 6'b100000) begin
                out0 = A;
                out1 = Q;
            end
            

            {A, Q} = {A, Q} << 1;
            A = A - M;

            if (A[31] == 1'b1) begin
                Q[0] = 1'b0;
                A = A + M;
            end

            else begin
                Q[0] = 1'b1;
            end

            
            counter = counter + 1;

        end

    end

endmodule