module decodificadorDisplay(
    input [3:0] bitIn, //Vector que recibe numero en binario para visualisar en decimal en el display

    output [3:0] bitOut, // Vector que muestra la entrada recibida en binario
    output reg [6:0] display // Vector que muestra el numero en decimal en el display
);

/*
Teniendo en cuenta que por las pruebas el orden del vector del display queda como:  
orden de bits: 7'gfedcba
La representacion de los numeros seria: 
        | Vector Display |  | Vector en binario |
        0: 7'b0111111 <------> 4'b0000
        1: 7'b0000110 <------> 4'b0001
        2: 7'b1011011 <------> 4'b0010
        3: 7'b1001111 <------> 4'b0011
        4: 7'b1100110 <------> 4'b0100
        5: 7'b1101101 <------> 4'b0101
        6: 7'b1111101 <------> 4'b0110
        7: 7'b0000111 <------> 4'b0111
        8: 7'b1111111 <------> 4'b1000
        9: 7'b1101111 <------> 4'b1001

*/


always @(*) begin //Inicio olways
    case (bitIn)
        4'b0000: display = 7'b0111111; // 0
        4'b0001: display = 7'b0000110; // 1
        4'b0010: display = 7'b1011011; // 2
        4'b0011: display = 7'b1001111; // 3
        4'b0100: display = 7'b1100110; // 4
        4'b0101: display = 7'b1101101; // 5
        4'b0110: display = 7'b1111101; // 6
        4'b0111: display = 7'b0000111; // 7
        4'b1000: display = 7'b1111111; // 8
        4'b1001: display = 7'b1101111; // 9

        default: display = 7'b0000000;
    endcase// Fin case
end // Fin always
assign bitOut = bitIn;

/*
//Este codigo es de depuracion. Se insertan los datos de manera de asiganacion directa.
//Con este supe el el arreglo pull-down estaba defectuoso el dipswitch, la logica del programa era correcta

wire [3:0] valor;
assign valor = 4'b0111;
always @(*) begin
     case (valor)
        4'b0000: display = 7'b0111111; // 0
        4'b0001: display = 7'b0000110; // 1
        4'b0010: display = 7'b1011011; // 2
        4'b0011: display = 7'b1001111; // 3
        4'b0100: display = 7'b1100110; // 4
        4'b0101: display = 7'b1101101; // 5
        4'b0110: display = 7'b1111101; // 6
        4'b0111: display = 7'b0000111; // 7
        4'b1000: display = 7'b1111111; // 8
        4'b1001: display = 7'b1101111; // 9

        default: display = 7'b0000000;
    endcase// Fin case
end
 
assign bitOut = valor;

*/


endmodule