`timescale 1ns/1ns;
module OC_3_GL(input a ,b , c, output y1, y0);
    wire i , j , k , w;

    nand #(10 , 8)(i , a , b);
    nand #(10 , 8)(j , a , c);
    nand #(10 , 8)(k , b , c);
    nand #(15 , 12)(y1 , i , j , k);

    xor #(17 , 19)(w , a , b);
    xor #(17 , 19)(y0 , w , c);
endmodule