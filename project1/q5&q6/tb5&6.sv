`timescale 1ns/1ns
module tb5();
    wire [2:0] out_gl;
    wire [2:0] out_as;
    logic [0:6] in;
    OC_7_GL oc_7_gl(.i(in) , .y(out_gl));
    OC_7_AS oc_7_as(.i(in) , .y(out_as));
    initial begin
        //y0 to 0
        #1000 in = 7'b1111111;
        #1000 in = 7'b1101111;
        #1000 in = 7'bz;
        //y0 to 1
        #1000 in = 7'b1111110;
        #1000 in = 7'b1101110;
        #1000 in = 7'bzzzzzzz;
        //y1 to 0
        #1000 in = 7'b0001110;
        #1000 in = 7'b0011110;
        #1000 in = 7'bzzzzzzz;
        // //y1 to 1
        #1000 in = 7'b0000000;
        #1000 in = 7'b1001000;
        #1000 in = 7'bzzzzzzz;
        // //y2 to 0
        #1000 in = 7'b1100011;
        #1000 in = 7'b1100001;
        #1000 in = 7'bzzzzzzz;
        // //y2 to 1
        #1000 in = 7'b1100000;
        #1000 in = 7'b1110001;
        #1000 in = 7'bzzzzzzz;
        //check all outputs
        #1000 in = 7'b0000000;
        #1000 in = 7'b0000001;
        #1000 in = 7'b0000011;
        #1000 in = 7'b0000111;
        #1000 in = 7'b0001111;
        #1000 in = 7'b0011111;
        #1000 in = 7'b0111111;
        #1000 in = 7'b1111111;
        #1000 $stop;
    end
endmodule