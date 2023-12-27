module tb1();
`timescale 1ns/1ns
    wire q_2 , q_3;
    wire qb_2 , qb_3;
    logic s , r;

    SR_latch_2 t1(s , r , q_2 , qb_2);
    SR_latch_3 t2(s , r , s , r , q_3 , qb_3);

    initial {s , r} = 2'b0;

    initial begin
        #100 {s , r} = 2'b10;
        #100 {s , r} = 2'b11;
        #100 {s , r} = 2'b01;
        #100 {s , r} = 2'b11;
        #100 {s , r} = 2'b00;
        #100 $stop;
    end
endmodule