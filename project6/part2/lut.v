module LUT(input[3:0] address , output[7:0] data);
    reg [7:0] ddata;
    always@(address) begin
        case(address)
            0:ddata = 8'hFF; //1
            1:ddata = 8'h80 //1/2
            2:ddata = 8'h55 //1/3
            3:ddata = 8'h40 //1/4
            4:ddata = 8'h33  //1/5
            5:ddata = 8'h2A //1/6
            6:ddata = 8'h24 //1/7
            7:ddata = 8'h20 //1/8
            8:ddata = 8'h1c //1/9
            9:ddata = 8'h19 //1/10
            10:ddata = 8'h17 //1/11
            11:ddata = 8'h15 //1/12
            12:ddata = 8'h13 //1/13
            13:ddata = 8'h12 //1/14
            14:ddata = 8'h11 //1/15
            15:ddata = 8'h10 //1/16
        endcase
    end
    
    assign data = ddata;

endmodule