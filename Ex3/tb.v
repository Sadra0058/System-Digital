module tb ();
    reg clk = 0 , rst = 0 , ld = 1 ;
    wire clk_div_1 , clk_div_2 , clk_div_3;

    wire [7:0] out;
    wire [7:0] out_1;
    wire [7:0] out_2;
    wire [7:0] out_3;

    always #1 clk = ~clk;
    initial begin
        rst = 1;
        ld = 0;
        #10 rst = 0;
    end
    
    DDS d(clk , rst , out);

    amp_selector t1(out , 2'b00 , out_1);
    amp_selector t2(out , 2'b01 , out_2);
    amp_selector t3(out , 2'b10 , out_3);


    initial #100000 $stop;
endmodule