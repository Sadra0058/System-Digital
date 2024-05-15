module Controller(input clk , start , co1 , co2 , cod , rst , clken,
output reg done , cnt1 , shenp , cnt2 , shend , outvalid , ld , cntd);
    parameter IDEL = 3'b000 , GETPORT = 3'b001 , GETDATA = 3'b010 , 
    LD = 3'b011 ,DATATR = 3'b100 , DONE = 3'b101;

    reg [2:0] ps , ns;
    always @(ps , start , co1 , co2 , cod) begin
        ns = IDEL;
        case (ps)
            IDEL : ns = (start == 1'b0) ? GETPORT:IDEL;
            GETPORT : ns = (co1) ? GETDATA:GETPORT;
            GETDATA : ns = (co2) ? LD:GETDATA;
            LD: ns = (cod) ? DONE:DATATR;
            DATATR : ns = (cod) ? DONE:DATATR;
            DONE : ns = IDEL;
            default: ns = IDEL;
        endcase
    end

    always @(ps) begin
        {done , cnt1 , shenp , cnt2 , shend , outvalid , ld , cntd } = 8'b0;
        case (ps)
            GETPORT : begin cnt1 = 1'b1 ; shenp = 1'b1 ; end
            GETDATA : begin cnt2 = 1'b1 ; shend = 1'b1 ; end
            LD : begin outvalid = 1'b1 ; ld = 1; end
            DATATR : begin outvalid = 1'b1 ; cntd = 1'b1 ; end
            DONE : done = 1'b1;
            default: {done , cnt1 , shenp , cnt2 , shend , outvalid , ld , cntd} = 8'b0;
        endcase
    end


    always @(posedge clk , posedge rst) begin
        if(rst) ps <= IDEL;
        else if(clken) ps <= ns;
    end
    
endmodule
