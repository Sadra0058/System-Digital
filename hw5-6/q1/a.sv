module complement_1 (input[7:0]a , output [7:0]w);
    assign w = ~a + 1'b1;
endmodule