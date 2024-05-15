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