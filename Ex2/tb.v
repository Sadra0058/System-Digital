module TB ();
    reg serin = 1, clkpb = 0, clk = 0, rst = 0;
    wire p0,p1,p2,p3, done , ser_outvalid;
    wire[6:0] ssd_out;

    MSSD mssd(clk , clkpb , rst , serin , p0,p1,p2,p3 , done , ser_outvalid , ssd_out);

    always #20 clk = ~clk;
    always #100 clkpb = ~clkpb;
    initial begin
        rst = 1;
        #100 rst = 0;
        #100 serin = 0;
        
        //port num

        #300 serin = 1;
        #200 serin = 1;

        //data num

        #200 serin = 0;
        #200 serin = 1;
        #200 serin = 1;
        #200 serin = 1;

        //data

        #200 serin = 0;
        #200 serin = 1;
        #200 serin = 1;
        #200 serin = 0;
        #200 serin = 0;
        #200 serin = 0;
        #200 serin = 1;
        #200 serin = 1;
    end

    initial #6000 $stop;

endmodule