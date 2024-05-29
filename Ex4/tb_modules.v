module tb_modules ();

    reg [17:0] in = 18'b101010101010101010;
    wire [20:0] out;
    reg [1:0] shift = 2'b11;

    initial begin
        #1000 $stop;
    end
    comb_shift test(in , shift , out);
endmodule