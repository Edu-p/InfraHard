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
        input wire [5:0] CODE,
        input wire [5:0] ,

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
        output wire resetOut;

);
// states
    
    parameter RESET_State = 6'b111111;
    parameter fetch = 6'b110000;
    parameter decode = 6'b111000;
    parameter op404 = 6'b111101;
    parameter overflow = 6'b001100;
    parameter ZeroDiv_State = 6'b100101;

// r format
    parameter codeR = 6'b000000;

    parameter ADD = 6'b100000;
    parameter AND = 6'b100100;
    parameter DIV = 6'b011010;
    parameter MULT = 6'b011000;
    parameter JR = 6'b001000;
    parameter MFHI = 6'b010000;
    parameter MFLO = 6'b010010;
    parameter SLL = 6'b000000;
    parameter SLLV = 6'b000100;
    parameter SLT = 6'b101010;
    parameter SRA = 6'b000011;
    parameter SRAV = 6'b000111;
    parameter SRL = 6'b000010;
    parameter SUB = 6'b100010;
    parameter BREAK = 6'b001101;
    parameter RTE = 6'b010011;
    parameter ADDM = 6'b000101;

// j format
    parameter J = 6'b000010;
    parameter JAL = 6'b000011;

// i format
    parameter ADDI = 6'b001000;
    parameter ADDIU = 6'b001001;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter BLE = 6'b000110;
    parameter BGT = 6'b000111;
    parameter SLLM = 6'b000001;
    parameter LB = 6'b100000;
    parameter LH = 6'b100001;
    parameter LW = 6'b100011;
    parameter SB = 6'b101000;
    parameter SH = 6'b101001;
    parameter SW = 6'b101011;
    parameter SLTI = 6'b001010;
    parameter LUI = 6'b001111;


// reset
    initial begin
        resetOut = 1'b1;
    end

// main cycle
    always @(posedge clk) begin

        if(reset=1'b1)begin
            if(state != RESET_State)begin
                  // mux
                    excpControl = 2'b00;
                    iord = 2'b00;
                    excpCtrl = 2'b00;
                    shiftSrc = 1'b0;
                    shiftAmt = 1'b0;
                    srcRead = 1'b0;
                    srcWrite = 3'b000;
                    srcData = 4'b0000;
                    aluSrcA = 2'b00;
                    aluSrcB = 2'b00;
                    pcSource = 3'b000;

                // other blocks
                    control = 1'b0;
                    multControl = 1'b0;
                    divControl = 1'b0;
                    seControl = 1'b0;
                    memWrite = 1'b0;
                    ssControl = 2'b00;
                    irWrite = 1'b0;
                    lsControl = 2'b00;
                    shiftControl = 3'b000;
                    regWrite = 1'b0;
                    aluControl = 3'b000;
                    aluOutControl = 1'b0;
                    epcControl = 1'b0;
                    himultControl = 1'b0;
                    lomultControl = 1'b0;
                    hidivControl = 1'b0;
                    lodivControl = 1'b0;
                    memRegControl = 1'b0;
                    aControl = 1'b0;
                    bControl = 1'b0;
                    resetOut = 1'b0;

                counter = 6'b000000;
            end else begin
            
            end 



    end

endmodule