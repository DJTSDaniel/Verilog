module top (
    // Para divisor de frecuencia
    input clk,
    input clr,
    output led,

    //Para decodificador letras
    output [6:0] display
);
reg [4:0] entrada; // Entrada para decodificador de letras

pReloj divisor(
    .clk(clk),
    .clr(clr),
    .led(led)
);

decoDisplayLetras letras(
    .entrada(entrada),
    .display(display)
);

always @(posedge led or negedge clr) begin
    if (!clr) begin // Si se aprieta clr en contador se reinicia en 0 y muestra la A
        entrada <= 0;
    end else begin 
        if (entrada == 23) begin // Evita que el conteo salga del numero de letras disponibles y muestre el default
            entrada <= 0;
        end else begin
            entrada <= entrada +1; // El contador aumenta en 1
        end
    end
end //Fin always
    
endmodule