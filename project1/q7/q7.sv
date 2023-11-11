`timescale 1ns/1ns
module OC_15(input [0:14] in , output [3:0] out);
    wire [2:0] out1 , out2;
    wire j , w;
    
    OC_7_GL oc_7_1(.i(in[0:6]) , .y(out1));
    OC_7_GL oc_7_2(.i(in[7:13]) , .y(out2));
    OC_3_GL oc_3_1(.a(out1[0]) , .b(out2[0]) , .c(in[14]) , .y0(out[0]) , .y1(j));
    OC_3_GL oc_3_2(.a(out1[1]) , .b(out2[1]) , .c(j) , .y0(out[1]) , .y1(w));
    OC_3_GL oc_3_3(.a(out1[2]) , .b(out2[2]) , .c(w) , .y0(out[2]) , .y1(out[3]));

endmodule