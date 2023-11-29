`timescale 1ns/1ns
module tb();
    logic [7:0]a;
    wire [7:0]w;
    
    complement_2_sy c(.a(a) , .w(w));
    initial begin
        #100 a = 8'b00010111;
        #100 $stop;
    end
endmodule