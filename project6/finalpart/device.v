module device(input start , clk , rst , input[15:0] xin , input[7:0] yin , output[15:0] out , output ready);
    wire initt , initr , initc , ld_x , ld_y , ld_r , ld_t , cnt , s2 , s1 , s0 , mode , lt;

    controller cu(clk , rst , start , lt , initt , initr , initc , ready , ld_x , ld_y , ld_r , ld_t , cnt , s2 , s1 , s0 , mode);
    DP d(clk , rst , initt , initr , initc , ld_x , ld_r , ld_t , ld_y, cnt , s2 , s1 , s0 , mode,
xin , yin , out , lt);

endmodule