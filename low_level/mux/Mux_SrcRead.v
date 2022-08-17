module Mux_SrcRead(
    input wire [4:0] in0,
    input wire  [4:0] in1,
    input wire [1:0] control,
    output wire [4:0] out
    );

    assign out = (control == 2'b00) ? in0:
                 in1;
                 
endmodule