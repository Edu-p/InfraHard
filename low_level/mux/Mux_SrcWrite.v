module Mux_SrcWrite(
    input wire [4:0] in0,
    input wire  [4:0] in1,
    input wire  [4:0] in2,
    input wire  [4:0] in3,
    input wire  [4:0] in4,
    input wire [1:0] control,
    output wire [4:0] out
    );

    assign out = (control == 3'b000) ? in0:
                 (control == 3'b001) ? in1:
                 (control == 3'b010) ? in2:
                 (control == 3'b011) ? in3:
                 in4;
                 
endmodule