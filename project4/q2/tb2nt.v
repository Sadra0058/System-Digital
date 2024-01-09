`timescale 1ns/1ns
module tb2nt();

    reg ld_cnt = 1 , cnt = 1 , clk = 0 , rst = 0;
    reg in = 0;
    reg [2:0] init = 3'b0;

    wire[7:0] parout_pre;
    wire[7:0] parout_post;
    
    nt_counter_pre nt(in , clk , rst , cnt , ld_cnt , init , parout_pre);
    nt_counter ntp(in , clk , rst , cnt , ld_cnt , init , parout_post);

    always #50 clk = ~clk;
    
    initial begin
        #51 ld_cnt = 0;

        #100 in = 1;
        #100 in = 1;
        #100 in = 0;
        #100 in = 0;
        #100 in = 1;
        #100 in = 0;
        #100 in = 1;

        #1000 $stop;
    end

endmodule