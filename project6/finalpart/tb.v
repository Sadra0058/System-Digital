`timescale 1ns/1ns
module tb();

    reg start = 0 , clk = 0 , rst = 0 ;
    reg[7:0] yin = 8'b00000000;
    reg[15:0] xin = {8'b0 , 8'b11001000}; //pi/4 ~= 0.707106781
    wire[15:0] out;
    wire ready;

    device test(start , clk , rst , xin , yin , out , ready);

    always #50 clk = ~clk;

    initial begin
        #70 start = 1;
        #100 start = 0;
        #2000 $stop;
    end
    //answer : 00000000.10110110 = 0.7109375 :)
endmodule