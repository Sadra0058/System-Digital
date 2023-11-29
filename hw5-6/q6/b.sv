module _16_to_1_mux_ah(input [15:0] in , input [3:0] sel , input en , output out);
    wire mux_1_out , mux_2_out , mux_3_out , mux_4_out;
    _4_to_1_mux_ah mux_1(sel[1:0] , in[3:0] , en , mux_1_out);
    _4_to_1_mux_ah mux_2(sel[1:0] , in[7:4] , en , mux_2_out);
    _4_to_1_mux_ah mux_3(sel[1:0] , in[11:8] , en , mux_3_out);
    _4_to_1_mux_ah mux_4(sel[1:0] , in[15:12] , en , mux_4_out);
    _4_to_1_mux_ah out_(sel[3:2] , {mux_4_out , mux_3_out , mux_2_out , mux_1_out} , en , out);
endmodule