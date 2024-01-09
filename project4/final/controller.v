module controller(input w , co , carry , clk , rst, output reg ld_cnt1 , cnt1 , ld_cnt0 , cnt0 , outvalid);
    reg [1:0] ps , ns;
    parameter [1:0]  seq = 0 , nt = 1 , trns = 2;

    always @(ps , w , co , carry) begin
        ns = 0;
        {ld_cnt1 , cnt1 , ld_cnt0 , cnt0 , outvalid} = 5'b0;

        case(ps)
            seq: begin ns = (w) ? nt:seq ; ld_cnt0 = w ? 1:0; cnt0 = w ? 1:0; end

            nt: begin ns = (co) ? trns:nt ; ld_cnt0 = 0; outvalid = co ? 1:0; ld_cnt1 = co ? 1:0 ; 
            cnt1 = co ? 1:0 ; cnt0 = co ? 0:1; end

            trns: begin ns = (carry) ? trns:seq ; cnt1 = carry ? 1:0 ; outvalid = carry ? 1:0 ; ld_cnt1 = 0; end
            
            default: ns = seq;
        endcase    
        end

    always @(clk , rst) begin
        if(rst) ps <= 2'b0;
        else ps <= ns;
    end

endmodule