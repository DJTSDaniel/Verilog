module Contador(
    input clk,        //Reloj de 27 MHZ
    input clr,        //Reset
    output led,    //salida al LED (Es la variable salida en el codigo del profe)

    output [3:0] bitOut, // Vector que muestra la entrada recibida en binario
    output [6:0] display // Vector que muestra el numero en decimal en el display
);
    
reg [3:0] contador;

pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
); 

decodificadorDisplay Ddisplay(
    .bitIn(contador),
    .bitOut(bitOut),
    .display(display)
);

always @(posedge led or negedge clr) begin
    if (!clr) begin
        contador <= 0;
    end else begin 
        if (contador == 9) begin // debido a que un display solo cuenta hasta el nueve, se trunca para resetearlo a cero
            contador <= 0;
        end else begin
            contador <= contador + 1; // Contador sigue aumentando hasta el 9
        end
    end
end



endmodule