module DP(input clk , rst , initt , initr , initc , ld_x , ld_r , ld_t , ld_y, cnt , s2 , s1 , s0 , mode,
input[15:0] xin , input[7:0] yin , output[15:0] out , output lt);

    wire[15:0] x_reg , t_reg , r_reg, y_reg,
    mux0 , mux1 , mux2 , mux3,
    add_sub, lut, mul;
    wire[3:0] address;

    mux_2_to_1 m0(x_reg , lut , s1 , mux0);
    mux_2_to_1 m1(x_reg , mux0 , s0 , mux1);
    mux_2_to_1 m2(x_reg , t_reg , s0 , mux2);
    mux_2_to_1 m3(mul , xin , s2 , mux3);

    reg_16 x(clk , rst , 1'b0 , ld_x , mux3 , x_reg);
    reg_16 t(clk , rst , initt , ld_t , mul , t_reg);
    reg_16 r(clk , rst , initr , ld_r , add_sub , r_reg);
    reg_16 y(clk , rst , 1'b0 , ld_y , {8'b0 , yin} , y_reg );

    counter_4 cntr(clk , rst , cnt , initc , address);
    LUT l(address , lut);

    Mul mx(mux1 , mux2 , mul);
    sub_add as(r_reg , t_reg , mode , add_sub);

    comparator comp(t_reg[7:0] , y_reg[7:0] , lt);

    assign out = r_reg;
endmodule