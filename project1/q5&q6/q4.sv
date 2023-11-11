`timescale 1ns/1ns
module OC_3_AS(input a, b, c, output y1, y0);
    assign #(25 , 22) y1 = a&b | a&c | b&c;
    assign #(36 , 38) y0 = a^b^c;
endmodule
