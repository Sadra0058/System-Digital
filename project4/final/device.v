module device(input clk , rst ,  in , output outvalid , output out);
    wire  ld_cnt0 , ld_cnt1 , cnt0 , cnt1;
    wire  w , co , carry;
    wire [7:0] parout;
    wire  [2:0] init0 = 3'b0;

    seq_dtc s(clk , rst , in , w);
    nt_counter n(in , clk , rst , cnt0 , ld_cnt0 , init0 , parout);
    transmit t(clk , rst , ld_cnt1 , cnt1 , (parout-1) , carry);
    controller c(w , co , carry , clk , rst, ld_cnt1 , cnt1 , ld_cnt0 , cnt0 , outvalid);

    assign out = in;
endmodule