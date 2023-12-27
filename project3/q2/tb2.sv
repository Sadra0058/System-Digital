module tb2();
    logic d , clk;
    wire q , qb;

    d_ff ff(clk , d , q , qb);

    initial {clk , d} = 2'b0;
    
    initial repeat(6) #50 clk = ~clk;

    initial begin
        #50 d = 0;
        #25 d = 1;
        repeat(4) #30 d = ~d;
    end

endmodule