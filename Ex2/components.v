
module shift_reg_2_bit (input serin , shen , clk , rst , clken , output reg[1:0] par_out);
    always @(posedge rst,posedge clk) begin
        if(rst) par_out <= 2'b0;
        else begin
            if(shen & clken)
                par_out <= {par_out[0] , serin};
        end
    end   
endmodule


module shift_reg_4_bit (input serin , shen , clk , rst , clken , output reg[3:0] par_out);
    always @(posedge clk , posedge rst) begin
        if(rst) par_out <= 4'b0;
        else begin
            if(shen & clken)
                par_out <= {par_out[2:0] , serin};
        end
    end   
endmodule


module port_cnter(input cnten, clk, rst, clken,output reg par_out , output co);
    always @(posedge clk ,posedge rst) begin
        if  (rst) begin
            par_out <= 1'b0;
        end 
        else begin
            if((clken & cnten))
                par_out <= par_out + 1'b1;
        end
    end
    assign co = (par_out == 1'b1);
endmodule


module data_num_cnter(input cnten, clk, rst, clken,output reg[1:0] par_out , output co);
    always @(posedge clk , posedge rst) begin
        if  (rst) begin
            par_out <= 2'b0;
        end 
        else begin
            if(clken & cnten)
                par_out <= par_out + 1;
        end
    end
    assign co = (par_out == 2'b11);
endmodule


module data_trns_cnter(input[3:0] par_in , input cnten , clk , rst , clken , ld, 
output reg [3:0] par_out , output reg co);

    always @(posedge clk , posedge rst) begin
    
        if(rst) begin 
            par_out <= 4'b0;
            co <= 1'b0;
        end
        else begin
            if(clken) begin
                if(ld) par_out <= par_in;
                else if(cnten) par_out <= par_out - 1;
            end
        end
    end
    assign co = (par_out == 4'b0001);
endmodule


module demux(input sein , input[1:0] sel , output reg p0 , p1 , p2 , p3);
    parameter P0 = 2'b00 , P1 = 2'b01 , P2 = 2'b10 , P3 = 2'b11 ;
    assign {p0 , p1 , p2 , p3} = 4'bz;
    always@(sel , sein) begin
        {p0 , p1 , p2 , p3} = 4'bz;
        case (sel)
            P0: p0 = sein;
            P1 : p1 = sein;
            P2 : p2 = sein;
            P3 : p3 = sein;
            default: {p0 , p1 , p2 , p3} = 4'bz;
        endcase
    end
endmodule


module SSD (
    input [3:0] count,
    output reg [6:0] SSD_out
);
    always @(count) begin
        SSD_out = 4'h0;
        case (count)
            4'h0: SSD_out = 7'h40;
            4'h1: SSD_out = 7'h79;
            4'h2: SSD_out = 7'h24;
            4'h3: SSD_out = 7'h30;
            4'h4: SSD_out = 7'h19;
            4'h5: SSD_out = 7'h12;
            4'h6: SSD_out = 7'h02;
            4'h7: SSD_out = 7'h78;
            4'h8: SSD_out = 7'h00;
            4'h9: SSD_out = 7'h10;
            4'ha: SSD_out = 7'h08;
            4'hb: SSD_out = 7'h03;
            4'hc: SSD_out = 7'h46;
            4'hd: SSD_out = 7'h21;
            4'he: SSD_out = 7'h06;
            4'hf: SSD_out = 7'h0e;
            default: SSD_out = 7'h01;
        endcase
    end
endmodule