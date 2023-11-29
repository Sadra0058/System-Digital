`timescale 1ns/1ns

module tb3 ();
    reg [15:0]inA, inB;
    reg inc;
    reg [2:0]opc = 3'b0;

    wire zer1 , neg1 , zer2 , neg2 , zer3 , neg3;
    wire [15:0]w1 , w2 , w3;


    SY_ALU q1(.inA(inA) , .inB(inB) , .inc(inc) , .opc(opc) , .zer(zer1) , .neg(neg1) , .w(w1));
    SY_ALU_2 q2(.inA(inA) , .inB(inB) , .inc(inc) , .opc(opc) , .zer(zer2) , .neg(neg2) , .w(w2));
    SY_ALU_MIN q2min(.inA(inA) , .inB(inB) , .inc(inc) , .opc(opc) , .zer(zer3) , .neg(neg3) , .w(w3));

    //at the same time
    initial {inA , inB , inc} = $random;
    initial repeat (8) #1000 opc = opc + 3'b001;
    initial repeat (8) #1000 {inA , inB , inc} = $random;

endmodule