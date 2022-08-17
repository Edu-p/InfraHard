module Mux_Iord(input wire [31:0] in0, in1, in2, in3, input wire [1:0] control, output wire [31:0] out);

    assign out = (control == 2'b00) ? in0:
                 (control == 2'b01) ? in1:
                 (control == 2'b10) ? in2:
                 in3;
endmodule