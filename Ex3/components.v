module counter_8_bit (input clk, rst,output reg[7:0] par_out , output co);
    always @(posedge clk ,posedge rst) begin
        if  (rst) begin
            par_out <= 8'b0;
        end 
        else begin
                par_out <= par_out + 1;
        end
    end
    assign co = (par_out == 8'b1);
endmodule

module counter_6_bit (input clk, rst,output reg[5:0] par_out , output co);
    always @(posedge clk ,posedge rst) begin
        if  (rst) begin
            par_out <= 6'b0;
        end 
        else begin
                par_out <= par_out + 1;
        end
    end
    assign co = (par_out == 6'd63);
endmodule


module counter_9_bit (input clk, rst , ld , input[8:0] par_in ,output reg[8:0] par_out , output co);
    always @(posedge clk ,posedge rst) begin
        if  (rst) 
            par_out <= 9'b0;
        else if(ld)
            par_out <= par_in;
        else begin
                par_out <= par_out + 1;
        end
    end
    assign co = (par_out == 9'b1);
endmodule

module generator(input[7:0] cnter_in , input[7:0] sin_in , clk , output reg[7:0] squared_out,triangle_out,ex_out , trap_out , full_sin , half_sin);
    //Square
    always @(posedge clk) begin
        if(cnter_in < 128)
            squared_out = 1;
        else
            squared_out = 0;
    end
    //Triangle
    always @(posedge clk) begin
        if(cnter_in < 128)
            triangle_out = cnter_in << 1;
        else
            triangle_out = 511 - (cnter_in <<1);
    end
    //Trapezius
    always @(posedge clk) begin
        if(cnter_in < 85)
            trap_out = (cnter_in << 1) + cnter_in;
        else if 
            (cnter_in< 171) trap_out = 255;
        else
            trap_out = 766 - ((cnter_in <<1) + cnter_in);
    end

    //exponential
    assign ex_out = 255/(255-cnter_in);

    //full sine
    always @(posedge clk) begin
        if(cnter_in < 128)
            full_sin = sin_in;
        else
            full_sin = (~(sin_in) + 8'd1) + 8'd255;
    end

    //half sine
    always @(posedge clk) begin
        if(cnter_in < 128)
            half_sin = sin_in;
        else
            half_sin = 8'd127;
    end
endmodule

module wave_form_generator(input clk ,rst , input[7:0] sin_in , output [7:0 ]sq_wave_form , tri_wave_form , exp_wave_form , trap_wave_form ,
full_sin , half_sin);

    wire [7:0] generator_counter_parout;
    wire generator_counter_co;
    counter_8_bit generator_counter(clk , rst , generator_counter_parout , generator_counter_co);
    generator wave_form(generator_counter_parout , sin_in , clk , sq_wave_form , tri_wave_form , exp_wave_form , trap_wave_form , full_sin , half_sin);
endmodule

module freq_selector(input clk , rst , ld , input[4:0] msb_in, output clk_div);
    wire co;
    wire[8:0] par_in , par_out;
    assign par_in = {msb_in , 4'b0000};
    counter_9_bit counter(clk , rst , ld|co , par_in , par_out , co);
    assign clk_div = co;
endmodule

module amp_selector(input[7:0] wave_in , input[1:0] sel , output reg[7:0] wave_out);
    always @(sel , wave_in) begin
        case (sel)
            2'b00 : wave_out = wave_in;
            2'b01 : wave_out = wave_in/2;
            2'b10 : wave_out = wave_in/4;
            2'b11 : wave_out = wave_in/8;
            default: wave_out = 8'b0;
        endcase
    end

endmodule

module mux_7_to_1 (input[7:0] sq_in ,trap_in, trgl_in, ex_in, sine_in, full_sine, half_sine ,input[2:0] sel, output reg[7:0] out);
    always @(*) begin
        case (sel)
            3'd0 : out = ex_in;
            3'd1 : out = trgl_in;
            3'd2 : out = sq_in;
            3'd3 : out = trap_in;
            3'd4 : out = sine_in;
            3'd5 : out = full_sine;
            3'd6 : out = half_sine;
            default: out = 8'b0;
        endcase
    end
endmodule

module DDS_Unit(input[5:0] addr , input sign_bit , phase_pos , output[8:0] Q);
    parameter WIDTH = 8;
    parameter DEPTH = 64;
    reg [WIDTH-1:0] ROM [0:DEPTH-1];

    wire [5:0] addr_2s_comp ;
    assign addr_2s_comp = (~(addr) + 8'd1);

    initial begin
    $readmemb("sine.mem", ROM);
    end

    parameter MAX_BITS = 8'b11111111;
    wire[5:0] ROM_in;
    wire[7:0] ROM_out , data;
    wire max_sel;

    assign ROM_in = (phase_pos) ? addr_2s_comp : addr;
    assign max_sel = (~(|addr)) & phase_pos;
    assign data = (max_sel) ? MAX_BITS : ROM[ROM_in];
    assign Q = (sign_bit) ? (~(data) + 8'd1) + 9'd255 : {sign_bit , data};
endmodule

module DDS_controller(input clk , rst , output reg sign_bit , phase_pos , output[5:0] addr);
    wire co;
    counter_6_bit counter(clk , rst , addr , co);

    parameter S1 = 2'b00 , S2 = 2'b01 , S3 = 2'b10 , S4 = 2'b11;
    reg[1:0] ps , ns;
    always @(co) begin
        case (ps)
            S1 : ns = co ? S2:S1;
            S2 : ns = co ? S3:S2;
            S3 : ns = co ? S4:S3;
            S4 : ns = co ? S1:S4;
            default: ns = S1;
        endcase
    end

    always @(posedge clk , posedge rst) begin
        if (rst) ps <= S1;
        else
        ps <= ns;
    end 

    always @(ps) begin
        {sign_bit , phase_pos} = 2'b0;
        case (ps)
            S1 : begin sign_bit = 1'b0 ; phase_pos = 1'b0; end
            S2 : begin sign_bit = 1'b0 ; phase_pos = 1'b1; end
            S3 : begin sign_bit = 1'b1 ; phase_pos = 1'b0; end
            S4 : begin sign_bit = 1'b1 ; phase_pos = 1'b1; end
            default: {sign_bit , phase_pos} = 2'b0;
        endcase
    end
endmodule


module DDS (input clk , rst , output[7:0] Q);
    wire [8:0] dds_out;
    wire sign_bit , phase_pos;
    wire [5:0] addr;
    DDS_controller controller(clk , rst , sign_bit , phase_pos , addr);
    DDS_Unit unit(addr , sign_bit , phase_pos , dds_out);
    assign Q = dds_out[7:0];
endmodule

module PWM(input clk,input rst,input [7:0] in,output out);
    wire [7:0] count;
    wire carry;
    counter_8_bit counter (clk,rst,count,carry);
    assign out = in > count;
endmodule
