module data_path(
    input clk,
    input rst, 
    input ld, 
    input[4:0] msb_in,
    input[2:0] wave_form_sel, 
    input[1:0] amp_sel,
    output out
);
    wire clk_div;
    wire [7:0] sin_waveform;
    wire [7:0] half_sin_waveform;
    wire [7:0] full_sin_waveform;
    wire [7:0] exp_waveform;
    wire [7:0] triangle_waveform;
    wire [7:0] square_waveform;
    wire [7:0] trap_waveform;

    wire [7:0] selected_waveform;
    wire [7:0] amp_out;

    freq_selector Freq_Sel(clk , rst , ld , msb_in , clk_div);

    wave_form_generator wave_generator(clk_div ,rst , sin_waveform , square_waveform , triangle_waveform , exp_waveform , trap_waveform ,
    full_sin_waveform , half_sin_waveform);

    DDS dds(clk_div , rst , sin_waveform);

    mux_7_to_1 mux7to1(square_waveform ,trap_waveform, triangle_waveform, exp_waveform, sin_waveform, full_sin_waveform, half_sin_waveform ,
    wave_form_sel , selected_waveform);

    amp_selector amp_select(selected_waveform , amp_sel , amp_out);

    PWM pwm(clk,rst, amp_out , out);
endmodule