`timescale 1ns/1ns

module tb1 ();
    reg [15:0]inA, inB;
    reg inc;
    reg [2:0]opc = 3'b0;
    wire zer , neg;
    wire [15:0]w;
    //for synthesized 
    wire syzer , syneg;
    wire [15:0]syw;

    ALU q1(.inA(inA) , .inB(inB) , .inc(inc) , .opc(opc) , .zer(zer) , .neg(neg) , .w(w));
    SY_ALU syq1(.inA(inA) , .inB(inB) , .inc(inc) , .opc(opc) , .zer(syzer) , .neg(syneg) , .w(syw));

    //at the same time
    initial {inA , inB , inc} = $random;
    initial repeat (8) #1000 opc = opc + 3'b001;
    initial repeat (8) #1000 {inA , inB , inc} = $random;

endmodule