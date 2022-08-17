module Muu_ShiftSrc(
    input wire [31:0] in0,
    input wire  [31:0] in1,
    input wire [1:0] control,
    output wire [31:0] out
    );

    assign out = (control == 2'b00) ? in0:
                 in1;
                 
endmodule