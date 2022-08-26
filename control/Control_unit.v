module Control_unit (
    input wire clk
    input wire reset

    //Inputs
    input wire [5:0] OPCODE;
    input wire EQ;
    input wire GT;
    input wire OFFSET; //DUVIDOSO
    
    //OUTPUTS

    //Out especial para reset
    output wire reset_out;

    //MUX
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

    //large outputs
    output wire [1:0] ssControl;
    output wire [1:0] lsControl;
    output wire [2:0] shiftControl;
    output wire [2:0] aluControl;

    //Other blocks
    output wire control;
    output wire multControl;
    output wire divControl;
    output wire seControl;
    output wire memWrite;
    output wire irWrite;       
    output wire regWrite;
    output wire aluOutControl;
    output wire epcControl;
);

//VARIAVEIS LOCAIS
reg [] COUNTER;  //Contador que conta em qual etapa atual o estado executado está
reg  [] STATE;    //Identificador do estado atual (Intrução)

//PARÂMETROS FIXOS (IDENTIFICADORES DE ESTADOS)



//Reset de Inicialização ()


//always eh um bloco que vai executar essa funcao sempre que determinada coisa aconteca
//posedge sera para detectar algum aumento no clock
//negedge sera para detectar alguma diminuicao no clock
always @(posedge clk) begin


    
end
    
endmodule