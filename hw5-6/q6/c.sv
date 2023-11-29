module func(input a,b,c,d,e , output w);
    wire [15:0] in;
    wire [3:0] sel;
    assign in = {1,e,~e,~e,~e,~e,e,e,1,0,~e,1,0,1,e,e};
    assign sel = {a,d,b,c};
    _16_to_1_mux_ah mux(in , sel , 1'b1 , w);
endmodule