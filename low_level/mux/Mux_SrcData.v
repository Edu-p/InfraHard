module Mux_SrcData(
    input wire [31:0] in0,
    input wire  [31:0] in1,
    input wire  [31:0] in2,
    input wire  [31:0] in3,
    input wire  [31:0] in4,
    input wire  [31:0] in5,
    input wire  [31:0] in6,
    input wire  [31:0] in7,
    input wire  [31:0] in8,
    input wire [1:0] control,
    output wire [31:0] out
    );

    assign out = (control == 2'b0000) ? in0:
                 (control == 2'b0001) ? in1:
                 (control == 2'b0010) ? in2:
                 (control == 2'b0011) ? in3:
                 (control == 2'b0100) ? in4:
                 (control == 2'b0101) ? in5:
                 (control == 2'b0110) ? in6:
                 (control == 2'b0111) ? in7:
                 in8;
                 
endmodule