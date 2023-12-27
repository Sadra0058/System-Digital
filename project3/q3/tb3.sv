module tb3();
    logic d , clk , pre , clr;
    wire q , qb;

    dff_ps_cl ff(clk , pre , clr , d , q , qb);

    initial {clk , d , pre , clr} = 4'b0;
    
    initial repeat(10) #50 clk = ~clk;
    initial repeat(2) #40 d = ~d; 

    initial #300 pre = 1;

    initial begin
        #350 clr = 1 ; pre = 0;
    end

    initial begin
        # 400 pre = 1;
        #100 $stop;
    end    
endmodule