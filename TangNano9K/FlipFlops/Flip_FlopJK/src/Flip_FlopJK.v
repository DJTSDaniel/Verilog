module Flip_FlopJK (
    input J,
    input K,
    input clk, //Reloj de la Nexys 3 (100MHz) 
    input clr, //Reset/Clear asíncrono
    output Q,
    output Qn //negacion de q
);  

// Cables
wire q1, q2, q3, q4;

// Ecuaciones del FFJK 
// CLK se sustituye por salida del divisor
assign q4 = ~(((~Q & J) | (Q & ~K)) & q3);
assign q1 = ~(q4 & q2);
assign q2 = ~(q1 & clk);
assign q3 = ~(q2 & clk & q4);
assign Q = ~(Qn & q2);
assign Qn = ~(Q & q3);
// Fin Ecuaciones FFD

endmodule