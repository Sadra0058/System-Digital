module transmit(input  clk , rst , ld_cnt , cnt ,input[7:0] init , output outvalid);
wire [7:0] cnt_parout;
        mod8_counter c(clk , rst , ld_cnt , cnt , init , outvalid , cnt_parout);
endmodule
