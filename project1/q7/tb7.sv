`timescale 1ns/1ns
module tb7();
    logic [0:14] inp = 15'b0;
    wire [3:0] out;
    OC_15 gate(.out(out), .in(inp));
    initial begin
        // logic table
        #1000 inp = 15'b000000000000000;
        #1000 inp = 15'b000000000000001;
        #1000 inp = 15'b000000000000011;
        #1000 inp = 15'b000000000000111;
        #1000 inp = 15'b000000000001111;
        #1000 inp = 15'b000000000011111;
        #1000 inp = 15'b000000000111111;
        #1000 inp = 15'b000000001111111;
        #1000 inp = 15'b000000011111111;
        #1000 inp = 15'b000000111111111;
        #1000 inp = 15'b000001111111111;
        #1000 inp = 15'b000011111111111;
        #1000 inp = 15'b000111111111111;
        #1000 inp = 15'b001111111111111;
        #1000 inp = 15'b011111111111111;
        #1000 inp = 15'b111111111111111;
        #1000 $stop;
    end
endmodule