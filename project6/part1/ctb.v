module c_tb();
    reg clk = 0 , rst = 0 , start = 0, lt = 0;
    wire initt , initr , initc , ready , ld_c , ld_x , ld_r , ld_t , cnt , s2 , s1 , s0 , mode;
    controller c(clk , rst , start , lt ,
initt , initr , initc , ready , ld_c , ld_x , ld_r , ld_t , cnt , s2 , s1 , s0 , mode);

    always #50 clk = ~clk;

    initial begin
        #120 start = 1;
        #50 start = 0;
        #1000 lt = 1;
        #200 $stop;
    end 

endmodule