module ALU_2(input signed[15:0]inA ,inB , input[2:0]opc , input inc , 
output reg[15:0]w , output reg zer , neg);
    wire [15:0]func[7:0];

    assign neg = w[15];
    assign zer = ~(|w);

assign w = 
    (opc == 3'b000) ? ~inA + 1:
    (opc == 3'b001) ? inA + 1:
    (opc == 3'b010) ? inA + inB + inc:
    (opc == 3'b011) ? inA + (inB >>> 1):
    (opc == 3'b100) ? inA & inB:
    (opc == 3'b101) ? inA | inB:
    (opc == 3'b110) ? {inA[7:0] , inB[7:0]}:
        16'b0;
endmodule