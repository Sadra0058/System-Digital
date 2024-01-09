module mod8_counter(input  clk , rst , ld_cnt , cnt ,input[7:0] init , output co , output reg[7:0]parout);

    always @(posedge clk , posedge rst , posedge ld_cnt) begin
        if (rst)
            parout <= 8'b0;
        else begin
            if(ld_cnt)
                parout <= init;
            else if(cnt) parout <= (co) ? (parout-1) : parout;
        end
    end

    assign co = (|parout);
endmodule