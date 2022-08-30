module Control(
    // inputs

        // basic entries 
        input wire clk,
        input wire reset,

        // exceptions
        input wire O,
        input wire notFound,
        input wire div0,

        //instruction
        input wire [5:0] OPCODE,
        input wire [5:0] Funct,

        // other entries
        input wire zero,
        input wire LT, 
        input wire GT,
        input wire EQ,
        input wire neg,

    // outputs
        // mux
        output reg [1:0] excpControl,
        output reg [1:0] iord,
        output reg [1:0] excpCtrl,
        output reg shiftSrc,
        output reg shiftAmt,
        output reg srcRead,
        output reg [2:0] srcWrite,
        output reg [3:0] srcData,
        output reg [1:0] aluSrcA,
        output reg [1:0] aluSrcB,
        output reg [2:0] pcSource,

        // other blocks
        output reg control,
        output reg [1:0]multControl,
        output reg [1:0]divControl,
        output reg seControl,
        output reg memWrite,
        output reg [1:0] ssControl,
        output reg irWrite,
        output reg [1:0] lsControl,
        output reg [2:0] shiftControl,
        output reg regWrite,
        output reg [2:0] aluControl,
        output reg aluOutControl,
        output reg epcControl,
        output reg himultControl,
        output reg lomultControl,
        output reg hidivControl,
        output reg lodivControl,
        output reg memRegControl,
        output reg aControl,
        output reg bControl,
        output reg resetOut

);
// states
    
    parameter codeR = 6'b000000;
    parameter codeIorJ = 6'b000001;
    
    parameter RESET_State = 6'b111111;
    parameter fetch = 6'b110000;
    parameter decode = 6'b111000;
    parameter op404 = 6'b111101;
    parameter overflow = 6'b001100;
    parameter ZeroDiv_State = 6'b100101;
// r format

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

// variables
    reg [5:0] state;
    reg [5:0] counter;



// reset
    initial begin
        resetOut = 1'b1;
        state = fetch;
        counter = 6'b000000;
        O = 1'b0;
        notFound = 1'b0;
        div0 = 1'b0;
        OPCODE = 6'b000000;
        Funct = 6'b100000;
    end

// main cycle
    always @(posedge clk) begin
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


        if(reset == 1'b1)begin
                counter = 6'b000000;
                srcWrite = 3'b010;
                srcData = 4'b1000;
                regWrite = 1'b1;
            if(state != RESET_State)begin
                    resetOut = 1'b1;
                    state = RESET_State;
                    
            end 
            else begin
                    resetOut = 1'b0;
                    state = fetch;
            end 
        end   
        else begin
            case(state) 
                //Fetch
                    fetch: begin
                        aluControl = 3'b001;
                        aluSrcB = 2'b01;
                        if(counter != 6'b000011)begin
                            counter = counter + 1;
                        end 
                        else begin
                            control = 1'b1;
                            irWrite = 1'b1;
                            counter = 6'b000000;
                            state = decode;
                        end
                    end

                //Decode
                    decode: begin
                        
                        if(counter == 6'b000000)begin
                            counter = counter + 1;
                        end
                        else begin
                            if(OPCODE == codeR)begin
                                state = codeR;
                            end
                            else begin
                                state = codeIorJ;
                            end
                            counter = 6'b000000;
                        end
                        regWrite = 1'b0;
                        aluControl = 3'b001;
                        srcRead = 1'b0;
                        aluSrcA = 2'b00;
                        aluSrcB = 2'b11;
                        seControl = 1'b1;
                        aluOutControl = 1'b1;
                    end

                    codeR: begin
                        case(Funct)
                            ADD:begin
                               if(counter == 6'b000000)begin
                                    aluSrcA = 2'b01;
                                    aluSrcB = 2'b00;
                                    aluControl = 3'b001;
                                    aluOutControl = 1'b1;

                                    counter = counter + 1;
                               end 
                               else begin
                                    if(O==1)begin
                                        counter = 6'b000000;
                                        state=overflow;
                                    end 
                                    else begin
                                        srcData = 4'b0000;
                                        srcWrite = 3'b001;
                                        regWrite = 1'b1;
                                    end
                                    if (counter == 6'b000010) begin
                                        state = fetch; 
                                        counter = 6'b000000;
                                    end
                                    else begin
                                        counter = counter + 1;
                                    end
                               end
                            end
                        endcase
                    end
                    codeIorJ: begin
                        case(OPCODE)
                            ADDI: begin
                                if (counter == 6'b000000)begin
                                    aluSrcA = 2'b01;
                                    aluSrcB = 2'b10;
                                    aluOutControl = 1'b1;
                                    aluControl = 1'b1;
                                    counter = counter + 1;
                                end
                                else begin
                                    if(O==1)begin
                                        counter = 6'b000000;
                                        state=overflow;
                                    end
                                    else begin
                                        srcData = 4'b0000;
                                        srcWrite = 3'b001;
                                        regWrite = 1'b1;
                                    end
                                    if (counter == 6'b000010) begin
                                        state = fetch; 
                                        counter = 6'b000000;
                                    end
                                    else begin
                                        counter = counter + 1;
                                    end
                                end
                            end
                        endcase
                    end

            endcase
        end
    end

endmodule