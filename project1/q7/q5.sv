`timescale 1ns/1ns
module OC_7_GL(input [0:6]i , output [2:0] y);
    wire g , j , k , z , w;
    OC_3_GL oc_3_gl1(.y1(z) , .y0(g) , .a(i[0]) , .b(i[1]) , .c(i[2]));
    OC_3_GL oc_3_gl2(.y1(w) , .y0(j) , .a(i[3]) , .b(i[4]) , .c(i[5]));
    OC_3_GL oc_3_gl3(.y1(k) , .y0(y[0]) , .a(g) , .b(i[6]) , .c(j));
    OC_3_GL oc_3_gl4(.y1(y[2]) , .y0(y[1]) , .a(z) , .b(k) , .c(w));
endmodule
