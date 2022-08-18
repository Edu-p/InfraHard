module Mux_PcSource(
    input wire [31:0] in0,
    input wire  [31:0] in1,
    input wire  [31:0] in2,
    input wire  [31:0] in3,
    input wire  [31:0] in4,
    input wire  [31:0] in5,
    input wire  [1:0] control,
    output wire [31:0] out
    );

    assign out = (control == 2'b000) ? in0:
                 (control == 2'b001) ? in1:
                 (control == 2'b010) ? in2:
                 (control == 2'b011) ? in3:
                 (control == 2'b100) ? in4:
                 in5;
                 
endmodule