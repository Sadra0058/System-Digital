`timescale 1ns/1ns
module tb1();
    reg j , clk = 0 , rst = 0;
    wire w;
    wire wp;

    seq_dtc q(clk , rst , j , w);
    seq_dtc_post qp(clk , rst , j , wp);

    always #50 clk = ~clk;

    initial begin
        #20 j = 1;
        #100 j = 0;
        #100 j = 1;
        #500 j = 0;
        #200 $stop;
    end
endmodule