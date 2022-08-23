module ShiftLeft16(
    input wire [31:0] in,
    output wire [31:0] out
);
    assign out = {{16'b0000000000000000}, in};
    assign out = out << 16; 

endmodule