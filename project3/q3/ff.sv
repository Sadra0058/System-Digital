module dff_ps_cl(input clk , pre , clr , d , output q , qb);
    wire g1 , g2 , g3 , g4;

    SR_latch_3 r1(.s(g4) , .ps(~pre) , .r(clk) , .pr(~clr) , .q(g1) , .qb(g2));
    SR_latch_3 r2(.s(g2) , .ps(clk) , .r(d) , .pr(~clr) , .q(g3) , .qb(g4));
    SR_latch_3 r3(.s(g2) , .ps(~pre) , .r(g3) , .pr(~clr) , .q(q) , .qb(qb));

endmodule

