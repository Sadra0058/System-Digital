`timescale 1ns/1ns
module tb1();
    logic aa,bb,cc;
    wire out0,out1;
    OC_3_TL oc_tl(.y0(out0), .y1(out1), .a(aa), .b(bb), .c(cc));
    initial begin
        
        //y1 to 0 & y0 to 1 
        #100 aa = 0 ; bb = 1 ; cc = 1;
        #100 aa = 0 ; bb = 0 ; cc = 1;
        
        #100 {aa, bb, cc} = 3'bzzz;

        //y0 to 1 & y1 to 0
        #100 aa = 1 ; bb = 0 ; cc = 0;
    	#100 aa = 1 ; bb = 0 ; cc = 1;
        
        #100 {aa, bb, cc} = 3'bzzz;

        #100 aa = 0 ; bb = 0 ; cc = 0;
        #100 aa = 0 ; bb = 0 ; cc = 1;
        #100 aa = 0 ; bb = 1 ; cc = 0;
        #100 aa = 0 ; bb = 1 ; cc = 1;
        #100 aa = 1 ; bb = 0 ; cc = 0;
        #100 aa = 1 ; bb = 0 ; cc = 1;
        #100 aa = 1 ; bb = 1 ; cc = 0;
        #100 aa = 1 ; bb = 1 ; cc = 1;
    
        #100 $stop;
    end
endmodule