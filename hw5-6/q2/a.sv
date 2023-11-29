module adder_a (input a , b , cin , output sum , cout);
    assign {cout , sum} = a + b + cin;
endmodule