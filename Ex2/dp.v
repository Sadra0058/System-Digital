module datapath (input SerIn,ShEn,Cnt1,ShEnD,clk,rst,ClkEn,Cnt2,CntD,ld ,
output Co1,Co2,CoD,p0,p1,p2,p3,output[6:0] ssd_out);
    wire [1:0] port_num , datanum_cnter;
    wire portnum_cnter;
    wire [3:0] data_num , trnc_count;

    shift_reg_2_bit portnum_shreg(SerIn , ShEn , clk , rst , ClkEn , port_num);
    shift_reg_4_bit datanum_shreg(SerIn , ShEnD , clk , rst , ClkEn , data_num);
    port_cnter port_counter(Cnt1 , clk , rst , ClkEn , portnum_cnter , Co1);
    data_num_cnter datanum_counter(Cnt2 , clk , rst , ClkEn , datanum_cnter , Co2);

    data_trns_cnter dt_counter(data_num , CntD , clk , rst , ClkEn , ld , trnc_count , CoD);
    demux Demux(SerIn , port_num , p0 , p1 , p2 , p3);
    SSD s_s_d(trnc_count , ssd_out);

endmodule