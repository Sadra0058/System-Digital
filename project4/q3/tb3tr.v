`timescale 1ns/1ns
module tb3();
    reg ld_cnt = 1 , cnt = 1 , clk = 0 , rst = 0;
    reg [7:0] init = 8'b00000101;

    wire outvalid_pre;
    wire outvalid_post;

    transmit_pre t(clk , rst , ld_cnt , cnt , init , outvalid_pre);
    transmit tp(clk , rst , ld_cnt , cnt , init , outvalid_post);

    always #50 clk = ~clk;
    
    initial begin
        #51 ld_cnt = 0;
        #1000 ld_cnt = 1;
        #200 $stop;
    end

endmodule