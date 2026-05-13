module moore_fsm_structural(
   input clk,
    input reset,
    input x,
    output z,
    output q2,
    output q1,
    output q0
);

// Señales de próximo estado
wire d2;
wire d1;
wire d0;


// ECUACIONES 


assign d2 = (~x & ~q2 & q1 & q0) |
            (~x & q2 & ~q1 & ~q0) |
            ( x & ~q2 & q1 & q0) |
            ( x & q2 & ~q1 & q0);

assign d1 = (q2 & q1 & ~q0) |
            (x & ~q2 & ~q1 & q0) |
            (x & q2 & ~q1 & ~q0);

assign d0 = (~x & ~q2 & ~q1 & q0) |
            (~x & ~q2 & q1 & ~q0) |
            (~x & q2 & ~q1 & ~q0) |
            ( x & ~q2 & ~q1 & ~q0);


// INSTANCIACIÓN DE FLIP-FLOPS


// FF para Q2
 d_ff ff2(
    .clk(clk),
    .reset(reset),
    .d(d2),
    .q(q2)
 );

// FF para Q1
 d_ff ff1(
    .clk(clk),
    .reset(reset),
    .d(d1),
    .q(q1)
 );

// FF para Q0
 d_ff ff0(
    .clk(clk),
    .reset(reset),
    .d(d0),
    .q(q0)
 );





assign z = (~q2 & q1 & q0) |
           (q2 & ~q1 & ~q0);

endmodule