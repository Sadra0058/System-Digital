module 3_to_8_decoder(input [2:0] in , input en , output [7:0] out);
    assign out =
    (en == 1'b1) ?  8'b00000000:
    (in == 3'b000) ? 8'b00000001:
    (in == 3'b001) ? 8'b00000010:
    (in == 3'b010) ? 8'b00000100:
    (in == 3'b011) ? 8'b00001000:
    (in == 3'b100) ? 8'b00010000:
    (in == 3'b101) ? 8'b00100000:
    (in == 3'b110) ? 8'b01000000:
    (in == 3'b111) ? 8'b10000000:
    8'bx;
endmodule