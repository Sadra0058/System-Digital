module half_adder(input a, cin, output s , cout);
    assign {cout , s} = a + cin;
endmodule

module complement_2 (input [7:0] a, output [7:0] w);
    wire [8:0] carry;
    assign carry[0] = 1'b1;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            half_adder  comp(.a(~a[i]), .cin(carry[i]), .cout(carry[i + 1]), .s(w[i]));
        end
    endgenerate
endmodule