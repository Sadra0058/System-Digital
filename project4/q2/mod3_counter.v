module mod3_counter(input  clk , rst , ld_cnt , cnt ,input[2:0] init0 , output co , output reg[2:0]parout);
    
    always @(posedge clk , posedge rst , posedge ld_cnt) begin
        if (rst)
            parout <= 3'b000;
        else begin
            if(ld_cnt)
                parout <= init0;
            else if(cnt) parout <= (~co) ? (parout+1) : parout;
        end
    end

    assign co = &parout;
endmodule