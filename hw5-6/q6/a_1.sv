module _4_to_1_mux_al(input[1:0] sel ,input [3:0] in , input en , output out);
    assign out = 
    (en == 1'b1) ? 1'bz:
    (sel == 2'b00) ? in[0]:
    (sel == 2'b01) ? in[1]:
    (sel == 2'b10) ? in[2]:
    (sel == 2'b11) ? in[3]:
    1'bx; 
endmodule