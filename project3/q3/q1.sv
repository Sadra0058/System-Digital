module SR_latch_2 (input s , r , output q , qb);
    nand #8 nand_1(q , s , qb);
    nand #8 nand_2(qb , r , q);
endmodule

module SR_latch_3 (input s , r , ps , pr, output q , qb);
    nand #12 nand_1(qb , pr , r , q);
    nand #12 nand_2(q , ps , s , qb);
endmodule