module OnePulser(input clkPB , clk , rst , output reg clkEN);
    parameter A = 2'b00 , B = 2'b01 , C = 2'b10;
    reg[1:0] ps , ns;

    always @(ps, clkPB) begin
        case (ps)
            A: ns = (clkPB) ? B:A;
            B: ns = C;
            C: ns = (clkPB) ? C:A;
            default: ns = A;
        endcase
    end

    always @(ps) begin
        clkEN = 1'b0;
        case (ps)
            B: clkEN = 1'b1;
        endcase
    end

    always @(posedge clk , posedge rst) begin
        if(rst) ps <= A;
        else ps <= ns;
    end
endmodule


module shift_reg_16_bit (input shen , clk , rst  , ld , input[15:0] par_in , output reg[15:0] par_out);
    always @(posedge clk , posedge rst) begin
        if(rst) par_out <= 16'b0;
        else begin
            if(ld)
                par_out <= par_in;
            else if(shen)
                par_out <= {par_out[15:0] , 1'b0};
        end
    end   
endmodule


module concat (input [4:0] vin , output [15:0] vout);
    assign vout = {3'b0,vin,8'b0};
endmodule


module ui_reg (input [1:0] ui_in , input clk,rst,ldu,output reg [1:0] ui_out);
    always @(posedge clk, rst) begin
        if(rst) ui_out <= 2'b0;
        else if (ldu) ui_out <= ui_in;
    end
endmodule 


module comb_shift (input [17:0] in , input [1:0] ui_out,output[20:0] wr_data);
    assign wr_data = {3'b0 , in} << ui_out ; 
endmodule
