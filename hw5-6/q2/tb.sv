`timescale 1ns/1ns
module tb();
    logic [7:0] a , b;
    logic cin;
    wire [7:0]sum;
    wire cout;
    
    adder_c c(.a(a) , .b(b) , .cin(cin) , .sum(sum) , .cout(cout));
    initial begin
        #100 a = 4'10111 ; b = 4'0011 ; cin = 1'b1;
        #100 $stop;
    end
endmodule