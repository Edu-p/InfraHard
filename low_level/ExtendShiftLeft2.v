module ExtendShiftLeft2(
    input wire [4:0] in1,
    input wire [4:0] in2,
    input wire [15:0] in3,
    output wire [27:0] out
);
    assign out = {{2'b00},in1,in2 ,in3};
    assign out = out << 2; 

endmodule