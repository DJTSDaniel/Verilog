module FlipFlopD(
    input D,
    input clk,
    input clr,
    output Q,
    output Qn
);

//Cables
wire q1, q2, q3, q4;

// Ecuaciones de FFD
// clk se sustituye por la salida del divisor de frecuencia (tanknano 9k es la variable led)

assign q4 = ~(D & q3);
assign q1 = ~(q4 & q2);
assign q2 = ~(q1 & clk);
assign q3 = ~(q2 & clk & q4);
assign Q = ~(Qn & q2);
assign Qn = ~(Q & q3);

// Fin Ecuaciones FDD

endmodule