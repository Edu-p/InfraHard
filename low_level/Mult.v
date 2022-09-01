module Mult (
    input wire clk, reset, multControl, 
    input wire [31:0] a, b, 
    output reg [31:0] Hi, Lo
);

    reg [31:0] multiplicand; //primeiro termo (a)
    reg [31:0] multiplier;   //segundo termo (b)
    reg multiplierZero;
    reg [31:0] acumulated;
    reg [5:0] nOfBits;

    reg aux = 1
    
    always @ (posedge clk)begin

        if(multControl == 1'b1)begin

            Hi = 32'b0;
            Lo = 32'b0;
            nOfBits = 6'd32;
            multiplicand = a;
            multiplier = b;
            multiplierZero = 1'b0;
            acumulated = 32'b0;
            aux = 1'b1;

        end

        if(reset == 1'b1 && aux == 1'b1)begin

            Hi = 32'b0;
            Lo = 32'b0;
            nOfBits = 6'd32;
            multiplicand = a;
            multiplier = b;
            multiplierZero = 1'b0;
            acumulated = 32'b0;

        end else if(nOfBits != 0 && aux == 1'b1) begin

            if(multiplier[0] == 1'b1 && multiplierZero == 1'b0) begin

            acumulated = acumulated - multiplicand;

            end else if(multiplier[0] == 1'b0 && multiplierZero == 1'b1) begin

            acumulated = acumulated + multiplicand;

            end 

            {acumulated, multiplier, multiplierZero} = {acumulated, multiplier, multiplierZero} >> 1'b1;

            if(acumulated[30] == 1'b1)begin

                acumulated[31] = 1'b1; //O right shift aritmetico com >>> não estava funcionando, por isso botamos esse corretor de sinal

            end

            nOfBits = nOfBits - 1'b1;
            
            if (nOfBits == 6'b000000) begin

                Hi = acumulated;
                Lo = multiplier;
                aux = 1'b0;

            end

        end
    
    end

endmodule


endmodule