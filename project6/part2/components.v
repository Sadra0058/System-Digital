module reg_16 (input clk , rst , init , load , input[15:0] in , output reg[15:0] out);
    always@(posedge clk ,posedge rst) begin
        if(rst) out <= 16'b0;
        else begin
            if(init) out <= {8'b00000001 , 8'b0};
            else if(load) out <= in;
        end
    end
endmodule

module counter_4(input clk , rst , cnt , init , output reg[3:0] out);
    always@(posedge clk ,posedge  rst) begin
        if (rst) out <= 4'b0;
        else begin
            if(init) out <= 4'b0;
            else if(cnt) out <= out + 1;
        end
    end
endmodule

module mux_2_to_1 (input[15:0] in1 ,in2 , input s , output[15:0] out);
    assign out = s ? in1:in2;
endmodule

module sub_add(input[15:0] in1 , in2 , input mode , output[15:0] out);
    assign out = mode ? in1 + in2 : in1 - in2;
endmodule

module comparator(input[7:0] in1 , in2 , output lt);
    assign lt = (in1 <= in2);
endmodule

module Mul(input[15:0] in1 , in2 , output[15:0] out);
    wire[31:0] result;
    assign result = in1 * in2 ;
    assign out = result[23:8] ;
endmodule