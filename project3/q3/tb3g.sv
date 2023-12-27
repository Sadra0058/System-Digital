module tb3g();
    logic d , clk , pre , clr;
    wire q , qb;

    dff_ps_cl ff(clk , pre , clr , d , q , qb);

    initial {clk , d , pre , clr} = 4'b0;

    initial repeat (10) #40 clk = ~clk;
    initial repeat (15) #50 d = ~d;

    initial begin
        #100 pre = 1;
        #200 pre = 0;
    end

    initial begin
        #300 clr = 1;
        #100 $stop;
    end

endmodule