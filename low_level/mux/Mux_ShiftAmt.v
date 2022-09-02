module Mux_ShiftAmt(
    input wire [31:0] in0,
    input wire  [15:0] in1,
    input wire control,
    output wire [4:0] out
    );

    assign out = (control == 1'b0) ? in0[4:0]:
                 in1[10:6];
                 
endmodule