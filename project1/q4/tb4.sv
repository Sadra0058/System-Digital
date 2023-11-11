`timescale 1ns/1ns
module tb4();
    logic aa , bb , cc;
    wire tl_out0 , tl_out1;
    wire gl_out0 , gl_out1;
    wire as_out0 , as_out1;
    OC_3_TL oc_tl(.y0(tl_out0) , .y1(tl_out1) , .a(aa) , .b(bb) , .c(cc));
    OC_3_GL oc_gl(.y0(gl_out0) , .y1(gl_out1) , .a(aa) , .b(bb) , .c(cc));
    OC_3_AS oc_as(.y0(as_out0) , .y1(as_out1) , .a(aa) , .b(bb) , .c(cc));
    
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