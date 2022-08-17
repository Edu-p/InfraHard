module cpu_MIPS (
    input wire clk,
    input wire reset
);

// Control wires
    // sent wires 
        // mux
        wire [1:0] excpControl;
        wire [1:0] iord;
        wire [1:0] excpCtrl;
        wire shiftSrc;
        wire shiftAmt;
        wire srcRead;
        wire [2:0] srcWrite;
        wire [3:0] srcData;
        wire [1:0] aluScrcA;
        wire [1:0] aluScrcB;
        wire [2:0] pcSource;

        // other blocks
        wire control;
        wire multControl;
        wire divControl;
        wire seControl;
        wire memWrite;
        wire [1:0] ssControl;
        wire irWrite;
        wire [1:0] lsControl;
        wire [2:0] shiftControl;
        wire regWrite;
        wire [2:0] aluControl;
        wire aluOutControl;
        wire epcControl;
    // received wires
        //TODO


// Data wires
    //Data from instruction
    wire [5:0] OPCODE;
    wire [4:0] RT;
    wire [4:0] RS;
    wire [15:0] OFFSET;

    //output wires per block 
        // excpcontrol
        wire [31:0] excpControlOut;

        // pc
        wire [31:0]  pc;

        // iord
        wire [31:0] iordOut;

        // mult
        wire [31:0] mult;

        // div
        wire [31:0] div;
        
        // HI
        wire [31:0] hi;

        // LO
        wire [31:0] lo;

        // signExtend16
        wire [31:0] signextend16;

        // shiftleft16
        wire [31:0] shiftleft16;

        // excpCtrl
        wire [31:0] excpCtrlOut;

        //SS
        wire [31:0] ss;

        //memory
        wire [31:0] memory;

        //memoryDataRegister
        wire [31:0] memoryDataRegister;

        //shiftSrc
        wire [31:0] shiftSrcOut;

        //shiftAmt
        wire [31:0] shiftAmtOut;

        //shiftReg
        wire [31:0] shiftReg;

        //LS
        wire [31:0] ls;



        //srcRead
        wire [31:0] srcReadOut;

        //srcWrite
        wire [31:0] srcWriteOut;

        //srcData
        wire [31:0] srcDataOut;

        //iShiftLeft2
        wire [31:0] iShiftLeft2;

        //Registers
        wire [31:0] registersData1;
        wire [31:0] registersData1;       

        //ShiftLeft2
        wire [31:0] shiftLeft2;

        //Concat
        wire [31:0] Concat;

        //A
        wire [31:0] a;

        //B
        wire [31:0] b;

        //aluSrcA
        wire [31:0] aluScrcAOut

        //aluSrcB
        wire [31:0] aluScrcBOut

        //ALU
        wire zero;
        wire LT;
        wire [31:0] result;
        wire EQ;
        wire GT;
        wire O;

        //signExtend1
        wire [31:0] signExtend1;

        //ALUOut
        wire [31:0] ALUOut;

        //EPC
        wire [31:0] EPC;

        //pcSource
        wire [31:0] pcSourceOut;











    










