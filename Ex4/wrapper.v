module wrapper (
    input clk, 
    input rst,
    input w_start,
    input [15:0] vi,
    input [1:0] ui,
    output wr_reg,
    output w_done,
    output [20:0] wr_data
);
    //control signals
    wire ldx;
    wire ldu;
    wire shen;
    wire eng_start;
    wire eng_done;
    //wires
    wire [15:0] engx;
    wire [15:0] frac;
    wire [1:0] int;
    wire [1:0] ui_out;

    wrapper_controller controller(
        .clk(clk),
        .rst(rst),
        .start(w_start),
        .engdone(eng_done),
        .w_done(w_done),
        .ldx(ldx),
        .ldu(ldu),
        .shen(shen),
        .write_reg(wr_reg),
        .eng_start(eng_start)
    );

    shift_reg_16_bit shift_reg(
        .clk(clk),
        .rst(rst),
        .ld(ldx),
        .shen(shen),
        .par_in(vi),
        .par_out(engx)
    );

    ui_reg ui_Reg(
        .ui_in(ui),
        .clk(clk),
        .ldu(ldu),
        .rst(rst),
        .ui_out(ui_out)
    );

    comb_shift combinential_shift(
        .in({int , frac}),
        .ui_out(ui_out),
        .wr_data(wr_data)
    );

    exponential acc(
        .clk(clk),
        .rst(rst),
        .start(eng_start),
        .x(engx),
        .done(eng_done),
        .intpart(int),
        .fracpart(frac)
    );
    
endmodule