`timescale 1ns/1ns

module tb();
    logic a , b , c , d , e;
    wire out;

    func test(.a(a),.b(b),.c(c),.d(d),.e(e),.w(out));
    initial begin
        a = 0 ; b = 0 ; c = 0 ; d = 0 ; e = 0;
        #200 a = 0 ; b = 0 ; c = 0 ; d = 0 ; e = 1;
        #200 a = 0 ; b = 0 ; c = 0 ; d = 1 ; e = 0;
        #200 $stop;
    end
endmodule