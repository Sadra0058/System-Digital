module controller (input clk , rst , start , lt ,
output reg  initt , initr , initc , ready , ld_x , ld_y , ld_r , ld_t , cnt , s2 , s1 , s0 , output mode);

    reg [2:0] ps , ns;
    reg tmode = 1;

    parameter [2:0] Idle = 0 , Init = 1 , Bgin = 2 , Mul0 = 3 , Mul1 = 4 ,
    Mul2 = 5 , Mul3 = 6 , Add = 7;

    always @(ps, start , lt) begin
        {initt , initr , initc , ready , ld_x , ld_y , ld_r , ld_t , cnt , s2 , s1 , s0} = 12'b0;
        ns = 0;
        case(ps)
            Idle : begin ns = (start) ? Init:Idle ; ready = 1; end
            Init : begin  ns = (start) ? Init:Bgin ;  initc = 1 ; initr = 1; end
            Bgin : begin ns = Mul0 ; ld_x = 1 ; ld_y = 1 ; end
            Mul0 : begin ns = Mul1 ; ld_x = 1 ; s0 = 1 ; s2 = 1; initt = 1 ; end
            Mul1 : begin ns = Mul2 ; ld_t = 1 ; s1 = 1 ; tmode <= ~tmode ; end
            Mul2 : begin ns = Mul3 ; ld_t = 1 ; s1 = 0 ; cnt = 1 ;end
            Mul3 : begin ns = Add ; ld_t = 1 ; s1 = 0 ; cnt = 1; end
            Add : begin ns = (lt) ? Idle:Mul1 ; ld_r = 1 ; end
            default : ns = Idle;
        endcase     
end

    assign mode = tmode;

    always@(posedge clk ,posedge rst) begin
        if(rst) ps <= 0;
        else ps <= ns;
    end
    
endmodule