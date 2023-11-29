module ALU_MIN(input signed[15:0]inA ,inB , input[2:0]opc , input inc , 
output reg[15:0]w , output reg zer , neg);
    wire[15:0] mux_1 , mux_2 , mux_3 , mux_5 , mux_6;
    wire mux_4;
    wire opc_or = |opc;

    assign mux_1 = 
    (opc_or == 0) ? ~inA:
    (opc_or == 1) ? inA:
    16'bx;

    assign mux_2 =
    (opc[0] == 1'b0) ? inB:
    (opc[0] == 1'b1) ? (inB >>> 1):
    16'bx;

    assign mux_3 =
    (opc[1] == 1'b0) ? 0:
    (opc[1] == 1'b1) ? mux_2:
    16'bx;

    assign mux_4 =
    (opc[1:0] == 2'b11) ? 0:
    (opc[1:0] == 2'b10) ? inc:1;

    assign mux_5 =
    (opc[1:0] == 2'b00) ? inA & inB:
    (opc[1:0] == 2'b01) ? inA | inB:
    (opc[1:0] == 2'b10) ? {inA[7:0] , inB[7:0]}:
    16'b0;

    assign w = 
    (opc[2] == 0) ? (mux_1 + mux_3 + mux_4):
    (opc[2] == 1) ? (mux_5):
    16'bx;

    assign zer = ~(|w);
    assign neg = w[15];
endmodule