module comprator(input[1:0] a , b ,input l , g , q , output lt , eq , gt);
    wire lt0 , eq0 , gt0;
    assign lt0 = l | (q & ~a[1] & b[1]);
    assign eq0 = (~a[1] & ~b[1] & q) | (a[1] & b[1] & q);
    assign gt0 = g | (q & a[1] & ~b[1]);

    assign lt = lt0 | (eq0 & ~a[0] & b[0]);
    assign eq = (~a[0] & ~b[0] & eq0) | (a[0] & b[0] & eq0);
    assign gt = gt0 | (eq0 & a[0] & ~b[0]);
endmodule