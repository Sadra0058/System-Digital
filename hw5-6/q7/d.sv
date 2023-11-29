module comprator_8_bit (input[7:0] a , b ,input l , g , q , output lt , eq , gt);
    wire [8:0] GT , EQ , LT;

    assign {GT[8] , EQ[8] , LT[8]} = {g , q , l};
    genvar i;
    generate
        for(i = 0 ; i < 8 ; i = i + 1)begin
            comprator comp(a[i] , b[i] , LT[i+1] , GT[i+1] , EQ[i+1] , LT[i] , EQ[i] , GT[i]);
        end
    endgenerate
    assign {lt , eq , gt} = {LT[0] , EQ[0] , GT[0]}; 
endmodule
