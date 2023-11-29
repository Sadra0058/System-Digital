
module comprator(input a , b , l , g , q , output lt , eq , gt);
    assign lt = l | (q & ~a & b);
    assign eq = (~a & ~b & q) | (a & b & q);
    assign gt = g | (q & a & ~b);
endmodule