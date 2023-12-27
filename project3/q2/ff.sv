module d_ff(input clk , d , output q , qb);
    wire g1,g2,g3,g4;
    SR_latch_2 p1(g4 , clk , g1 , g2);
    SR_latch_3 p2(g2 , d , clk , d , g3 , g4);
    SR_latch_2 p3(g2 , g3 , q , qb);
endmodule