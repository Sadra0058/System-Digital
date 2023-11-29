module ALU (input signed[15:0]inA ,inB , input[2:0]opc , input inc , 
output reg[15:0]w , output reg zer , neg);
    always @ (inc , inA , inB , opc) 
    begin
        w = 16'b0;
        neg = 1'b0;
        zer = 1'b0;

        case(opc)
            3'b000 : w = ~inA + 1;
            3'b001 : w = inA + 1;
            3'b010 : w = inA + inB + inc;
            3'b011 : w = inA + (inB >>> 1);
            3'b100 : w = inA & inB;
            3'b101 : w = inA | inB;
            3'b110 : w = {inA[7:0] , inB[7:0]};
        endcase

            if(w[15] == 1'b1)
                neg = 1'b1;

            if(w == 16'b0)
                zer = 1'b1;
    end
endmodule