`timescale 1ns/1ns
module tb2();
    reg ld_cnt = 0 , cnt = 1 , clk = 0 , rst = 0;
    reg [2:0] init = 3'b0;

    wire[2:0] parout;
    wire co;

    mod3_counter t(clk , rst , ld_cnt , cnt , init , co , parout);
    always #50 clk = ~clk;
    
    initial begin
        #20 ld_cnt = 1;
        #50 ld_cnt = 0;
        #1000 ld_cnt = 1;
        #200 $stop;
    end


endmodule