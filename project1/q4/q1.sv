`timescale 1ns/1ns
module OC_3_TL(input a,b,c , output y1,y0);
    supply0 gnd;
    supply1 vdd;

    wire i1, i2, i3, i4, i5, i6, i8, i9, i10;

    pmos #(5,6,7) p1(i1 , vdd , ~a);
    pmos #(5,6,7) p2(y1 , i1 , ~b);
    pmos #(5,6,7) p3(y1 , i1 , ~c);
    pmos #(5,6,7) p4(i2 , vdd , ~b);
    pmos #(5,6,7) p5(y1 , i2 , ~c);
    pmos #(5,6,7) p6(i5 , vdd , y1);
    pmos #(5,6,7) p7(y0 , i5 , ~a);
    pmos #(5,6,7) p8(y0 , i5 , ~b);
    pmos #(5,6,7) p9(y0 , i5 , ~c);
    pmos #(5,6,7) p10(i6 , vdd , ~a);
    pmos #(5,6,7) p11(i7 , i6 , ~b);
    pmos #(5,6,7) p12(y0 , i7 , ~c);

    nmos #(3,4,5) n1(y1 , i4 , ~a);
    nmos #(3,4,5) n2(y1 , i3 , ~b);
    nmos #(3,4,5) n3(i3 , i4 , ~c);
    nmos #(3,4,5) n4(i4 , gnd , ~b);
    nmos #(3,4,5) n5(i4 , gnd , ~c);
    nmos #(3,4,5) n6(y0 , i10 , y1);
    nmos #(3,4,5) n7(y0 , i8 , ~a);
    nmos #(3,4,5) n8(i8 , i9 , ~b);
    nmos #(3,4,5) n9(i9 , i10 , ~c);
    nmos #(3,4,5) n10(i10 , gnd , ~a);
    nmos #(3,4,5) n11(i10 , gnd , ~b);
    nmos #(3,4,5) n12(i10 , gnd , ~c);

endmodule
