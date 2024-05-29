`timescale 1ps/1ps
module tb();

    reg clk = 0 , rst = 1 , start = 0;

    wire done_1 , done_2 , done_3;
    wire [15:0] f_out_1 , f_out_2 , f_out_3;
    wire [1:0] i_out_1 , i_out_2 , i_out_3;

    always #30 clk = ~clk;
    initial begin
        # 60 rst = 0;
        #60 start = 1;
       # 60 start = 0;
       #2000 $stop;
    end

    reg[15:0] val_1 = 16'b1000000000000000;//0.5
    reg[15:0] val_2 = 16'b0100000000000000;//0.25
    reg[15:0] val_3 = 16'b1100000000000000;//0.75

    exponential test1(.clk(clk) , .rst(rst) , .start(start) , .done(done_1) , .intpart(i_out_1) , .fracpart(f_out_1) , .x(val_1));

    exponential test2(.clk(clk) , .rst(rst) , .start(start) , .done(done_2) , .intpart(i_out_2) , .fracpart(f_out_2) , .x(val_2));

    exponential test3(.clk(clk) , .rst(rst) , .start(start) , .done(done_3) , .intpart(i_out_3) , .fracpart(f_out_3) , .x(val_3));

endmodule