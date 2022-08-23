module ExtendShiftLeft2(
    input wire [25:0] in,
    output wire [27:0] out
);
    assign out = {{2'b00}, in};
    assign out = out << 2; 

endmodule