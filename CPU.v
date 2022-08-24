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
        wire [31:0] registersData2;       

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


Mux_ExcpControl mux_excp_control(
     32'b00000000000000000000000011111101, 32'b00000000000000000000000011111110, 32'b00000000000000000000000011111111, excpControl, excpControlOut
);
 
Mux_Iord mux_iord(
    pc, ALUOut, excpControlOut, result, iord, iordOut
);

Mux_ExcpCtrl mux_excp_ctrl(
    32'b00000000000000000000000000000001, 32'b00000000000000000000000000000010, 32'b00000000000000000000000000000011, excpCtrl, excpCtrlOut 
);

Mux_ShiftSrc mux_shift_src(
    a, b, shiftSrc, shiftSrcOut
);

Mux_ShiftAmt mux_shift_amt(
    b, OFFSET, shiftAmt, shiftAmtOut
);


Mux_SrcRead mux_src_read(
    RS, 5'b11101, srcRead,srcReadOut
);

Mux_SrcWrite mux_src_write(
    RT, OFFSET, 5'b11101, 5'b11110, 5'b11111, srcWrite, srcWriteOut 
);

Mux_SrcData mux_src_data(
    a, LS, HI, LO, signextend16, shiftleft16, excpCtrlOut, shiftReg, 32'b00000000000000000000000011100011, srcData, srcDataOut
);






    










