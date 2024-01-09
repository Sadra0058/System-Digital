module seq_dtc(input clk , rst , j , output w);
    parameter[2:0] A = 3'b000, B = 3'b001 , C = 3'b010 , D = 3'b011 , E = 3'b100 ,
    F = 3'b101 , G = 3'b110 , H = 3'b111;
    reg [2:0] ps , ns;

    always @(j , ps) begin
        ns = A;
        case(ps)
            A : ns = j ? A : B;
            B : ns = j ? C : B;
            C : ns = j ? D : B;
            D : ns = j ? E : B;
            E : ns = j ? F : B;
            F : ns = j ? G : B;
            G : ns = j ? A : H;
            H : ns = j ? C : B;
            default : ps = A;
        endcase
    end

    assign w = (ps == H) ? 1:0;

    always @(posedge clk ,posedge rst) begin
        if(rst) 
            ps <= 3'b0;
        else 
            ps <= ns;
    end

endmodule