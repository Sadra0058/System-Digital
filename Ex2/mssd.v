module MSSD (input clk , clkpb , rst , serin , output p0 , p1 , p2 , p3 , done ,
outvalid , output[6:0] ssd);
    
    wire clken , shen , cnt1 , cnt2 , shend , cntd , ld;
    wire co1 , co2, cod;
 

    OnePulser onepulser(clkpb , clk , rst , clken);


    datapath dp(serin , shen , cnt1 , shend , clk , rst , clken , cnt2 , cntd , ld
    ,co1,co2,cod,p0,p1,p2,p3,ssd);
    

    Controller conroller(clk , serin , co1 , co2 , cod , rst ,clken,
    done , cnt1 , shen , cnt2 , shend , outvalid , ld , cntd);

endmodule