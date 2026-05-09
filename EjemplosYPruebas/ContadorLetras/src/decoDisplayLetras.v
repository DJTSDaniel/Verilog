module decoDisplayLetras (
    input [4:0] entrada, //Recibe 5 bits para representar las letras (0 - 23)
    output reg [6:0] display
);
/*
Teniendo en cuenta que por las pruebas el orden del vector del display queda como:  
orden de bits: 7'gfedcba
*/


    always @(*) begin
        case (entrada)
                                 //gfedcba 
            5'b00000: display = 7'b1110111; // A 0
            5'b00001: display = 7'b1111100; // b 1
            5'b00010: display = 7'b0111001; // C 2
            5'b00011: display = 7'b1011110; // d 3
            5'b00100: display = 7'b1111001; // E 4
            5'b00101: display = 7'b1110001; // F 5
            5'b00110: display = 7'b1101111; // g 6
            5'b00111: display = 7'b1110100; // h 7
            5'b01000: display = 7'b0110000; // I 8
            5'b01001: display = 7'b0001110; // J 9
            5'b01010: display = 7'b0111000; // L 10
            5'b01011: display = 7'b1010100; // n 11
            5'b01100: display = 7'b1010101; // ñ 12
            5'b01101: display = 7'b0111111; // 0 13
            5'b01110: display = 7'b1110011; // P 14
            5'b01111: display = 7'b1100111; // q 15
            5'b10000: display = 7'b1010000; // r 16 
            5'b10001: display = 7'b1101101; // s 17
            5'b10010: display = 7'b1111000; // t 18
            5'b10011: display = 7'b0111110; // U 19
            5'b10100: display = 7'b0011100; // v 20
            5'b10101: display = 7'b1110110; // X 21
            5'b10110: display = 7'b1101110; // Y 22
            5'b10111: display = 7'b1011011; // Z 23
        default: display = 7'b1001001;
        
        endcase //Fin case
    end //Fin always


/*
//Codigo de depuracion de letras

wire [4:0] valor;
assign valor = 5'b11111;
always @(*) begin
     case (valor)
                              //gfedcba 
        5'b00000: display = 7'b1110111; // A
        5'b00001: display = 7'b1111100; // b
        5'b00010: display = 7'b0111001; // C
        5'b00011: display = 7'b1011110; // d
        5'b00100: display = 7'b1111001; // E
        5'b00101: display = 7'b1110001; // F
        5'b00110: display = 7'b1101111; // g
        5'b00111: display = 7'b1110100; // h
        5'b01000: display = 7'b0110000; // I
        5'b01001: display = 7'b0001110; // J
        5'b01010: display = 7'b0111000; // L
        5'b01011: display = 7'b1010100; // n
        5'b01100: display = 7'b1010101; // ñ
        5'b01101: display = 7'b0111111; // 0
        5'b01110: display = 7'b1110011; // P
        5'b01111: display = 7'b1100111; // q
        5'b10000: display = 7'b1010000; // r
        5'b10001: display = 7'b1101101; // s
        5'b10010: display = 7'b1111000; // t
        5'b10011: display = 7'b0111110; // U
        5'b10100: display = 7'b0011100; // v
        5'b10101: display = 7'b1110110; // X
        5'b10110: display = 7'b1101110; // Y
        5'b10111: display = 7'b1011011; // Z

        default: display = 7'b1001001;
    endcase// Fin case
end
*/

endmodule