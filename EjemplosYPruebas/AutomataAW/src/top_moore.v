module top_moore(
   input clk,
    input clr,
    input X,

    // LED 
    output led_z,

    output [6:0] seg

);

  
    wire enable;

   
    // ESTADOS
   

    wire Q2;
    wire Q1;
    wire Q0;


    // ENTRADAS FF
  

    wire D2;
    wire D1;
    wire D0;


    // DISPLAY

    reg [6:0] segmentos;


    // DIVISOR
   

    divisor_frecuencia divisor(

        .clk(clk),
        .clr(clr),
        .enable(enable)

    );

    wire Xn = ~X;
    // ECUACIONES


    assign D2 = (~Xn & ~Q2 & Q1 & Q0) |
                (~Xn & Q2 & ~Q1 & ~Q0) |
                ( Xn & ~Q2 & Q1 & Q0) |
                ( Xn & Q2 & ~Q1 & Q0);

    assign D1 = (Q2 & Q1 & ~Q0) |
                (Xn & ~Q2 & ~Q1 & Q0) |
                (Xn & Q2 & ~Q1 & ~Q0);

    assign D0 = (~Xn & ~Q2 & ~Q1 & Q0) |
                (~Xn & ~Q2 & Q1 & ~Q0) |
                (~Xn & Q2 & ~Q1 & ~Q0) |
                ( Xn & ~Q2 & ~Q1 & ~Q0);


    // FLIP FLOPS
 

    d_ff FF2(

        .clk(enable),
        .reset(clr),
        .d(D2),
        .q(Q2)

    );

    d_ff FF1(

        .clk(enable),
        .reset(clr),
        .d(D1),
        .q(Q1)

    );

    d_ff FF0(

        .clk(enable),
        .reset(clr),
        .d(D0),
        .q(Q0)

    );

    // SALIDA Z
 

    assign led_z = (~Q2 & Q1 & Q0) |
                   (Q2 & ~Q1 & ~Q0);


    // DISPLAY


    always @(*) begin

        case({Q2,Q1,Q0})

            3'b000: segmentos = 7'b0001000; // A
            3'b001: segmentos = 7'b0000011; // b
            3'b010: segmentos = 7'b1000110; // C
            3'b011: segmentos = 7'b0100001; // d
            3'b100: segmentos = 7'b0000110; // E
            3'b101: segmentos = 7'b0001110; // F

            default: segmentos = 7'b1111111;

        endcase

    end

    assign seg = segmentos;


endmodule