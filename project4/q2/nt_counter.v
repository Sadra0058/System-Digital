module nt_counter(input in , clk , rst , cnt , ld_cnt , input[2:0] init0 , output reg[7:0]parout);

wire co;
wire [2:0] cnt_parout;

mod3_counter c(clk , rst , ld_cnt , cnt , init0 , co , cnt_parout);

always @(posedge clk , posedge rst) begin
    if(rst) parout <= 8'b0;
    else begin
        if(~co) parout <= {in , parout[7:1]};
    end
end

endmodule