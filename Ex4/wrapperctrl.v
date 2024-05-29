module wrapper_controller (
    input clk,rst,start,engdone , output reg w_done , ldx, ldu, shen, write_reg, eng_start
);
    reg carry , init_cnt , cnt;
    reg [1:0] par_out;

    reg [2:0] ps , ns;

    parameter IDLE = 3'd0, LDSTART = 3'd1 , EXPSTART = 3'd2 , HSH = 3'd3 , WRITE = 3'd4;

    always @(ps , start,engdone , carry) begin
        case (ps)
            IDLE : ns = (start) ? LDSTART : IDLE;
            LDSTART : ns = (start) ? LDSTART : EXPSTART;
            EXPSTART : ns = HSH;
            HSH : ns = (engdone) ? WRITE : HSH;
            WRITE : ns = (carry) ? IDLE : EXPSTART;
            default: ns=ps;
        endcase
    end

    always @(ps) begin
        {w_done , ldx, ldu, shen, write_reg, eng_start , cnt , init_cnt} = 8'b0;
        case (ps)
            IDLE : w_done = 1'b1;
            LDSTART : {ldx , ldu , init_cnt} = 3'b111;
            EXPSTART : eng_start = 1'b1;
            WRITE : {shen , cnt , write_reg} = 3'b111; 
            default: {w_done , ldx, ldu, shen, write_reg, eng_start} = 6'b0;
        endcase
    end

    always @(posedge clk , posedge rst) begin
        if(rst)
            ps <= IDLE;
        else
            ps <= ns;
    end

    //internal counter
    always @(posedge clk ,posedge rst) begin
        if  (rst) begin
            par_out <= 2'b0;
        end 
        else if (init_cnt) par_out = 2'b0;
        else begin
            if(cnt)
                par_out <= par_out + 1;
        end
    end
    assign carry = (par_out == 2'b11);

endmodule