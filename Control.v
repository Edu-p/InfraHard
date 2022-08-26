module Control(
    // inputs

        // basic entries 
        input wire clk,
        input wire reset,

        // exceptions
        input wire O,
        input wire notFound,
        input wire div0,

        // other entries
        input wire zero,
        input wire LT, 
        input wire GT,
        input wire EQ,
        input wire neg,
        input wire [5:0] OPCODE,
        input wire [5:0] FUNCT,

    // outputs
        // mux
        output wire [1:0] excpControl;
        output wire [1:0] iord;
        output wire [1:0] excpCtrl;
        output wire shiftSrc;
        output wire shiftAmt;
        output wire srcRead;
        output wire [2:0] srcWrite;
        output wire [3:0] srcData;
        output wire [1:0] aluSrcA;
        output wire [1:0] aluSrcB;
        output wire [2:0] pcSource;

        // other blocks
        output wire control;
        output wire multControl;
        output wire divControl;
        output wire seControl;
        output wire memWrite;
        output wire [1:0] ssControl;
        output wire irWrite;
        output wire [1:0] lsControl;
        output wire [2:0] shiftControl;
        output wire regWrite;
        output wire [2:0] aluControl;
        output wire aluOutControl;
        output wire epcControl;
        output wire himultControl;
        output wire lomultControl;
        output wire hidivControl;
        output wire lodivControl;
        output wire memRegControl;
        output wire aControl;
        output wire bControl;

);

endmodule