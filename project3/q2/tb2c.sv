module tb2c();
    logic d , clk;
    wire q , qb;

    d_ff ff(clk , d , q , qb);

    initial {clk , d} = 2'b0;
    
    initial repeat(6) #50 clk = ~clk;

    initial begin
        #39 d = 1;
        #12 d = 0;
    end

    initial begin
        #145 d = 1;
        #12 d = 0;
        #100 $stop;
    end


endmodule