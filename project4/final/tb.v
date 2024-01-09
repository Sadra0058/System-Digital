`timescale 1ns/1ns
module tb();
    reg in , clk = 0 , rst = 0;
    wire outvalid , out;

    device d(clk , rst ,  in , outvalid , out);

    always #50 clk = ~clk;

    initial begin
        #20 in = 1;
        #100 in = 0;
        #100 in = 1;
        #100 in = 1;
        #100 in = 1;
        #100 in = 1;
        #100 in = 1;
        #100 in = 0;

        #100 in = 1;
        #100 in = 0;
        #100 in = 1;
        #100 in = 0;
        #100 in = 0;
        #100 in = 0;
        #100 in = 0;
        #100 in = 0;

        #100 in = 1;
        #100 in = 0;
        #100 in = 1;
        #100 in = 0;
        #100 in = 1;
        #100 in = 0;
        #1000 $stop;
    end
endmodule