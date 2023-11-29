`timescale 1ns/1ns
module tb ();
    logic [7:0] a;
    logic [7:0] b;

    wire lt, eq, gt;

    _8_bit_comprator cmp(.a(a), .b(b), .l(1'b0), .g(1'b0), .q(1'b1), .lt(lt), .gt(gt), .eq(eq));

    initial begin
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
        a = $random;
        b = $random;
        #200;
    end
endmodule
