module pReloj(
    input clk,        //Reloj de 27 MHZ
    input clr,        //Reset
    output reg led    //salida al LED (Es la variable salida en el codigo del profe)
);

// Divisor de Frecuencia

/* Codigo corregido, principal problema es que en la tanknano 9k el boton de reset estaba activo
dado que el boton de reset tenia estos estados:
- Sin presionar = 1
- Presionado = 0
Se cambio de posedge a negedge ya que el reset se activa cuando clr pasa de 1 -> 0
Se esta usando el flanco de bajada negedge = flanco de bajada
*/
reg[25:0] contador; 
always @(posedge clk or negedge clr) begin 
    if (!clr) begin // botón presionado = reset
        contador <= 0; 
        led <= 0; // apagado (activo en bajo)
    end 
    else begin 
        if(contador == 26_999_999) begin  
            contador <= 0;
            led <= ~led;
        end 
        else begin 
            contador <= contador + 1;
        end 
    end 
end


// Codigo de pruba, tiene errores pero 
/*
reg[25:0] contador; 
	 always @(posedge clk or posedge clr) begin 
	    if (clr) begin //Reset asíncrono 
	        contador<=0; 
	        led<=0; 
	    end 
	 
	    else begin 
	        if(contador==26_999_999)begin  
	            contador<=0; //Reinicio del contador 
                led<=~led; //Computación de la señal (Toggle)
	        end 
	        else begin 
	            contador<=contador +1; 
	        end 
	    end 
	 end
*/

/*
//Codigo de prueba para la tangnano 9k
reg[25:0] contador; 
	always @(posedge clk) begin
    if (contador == 26_999_999) begin
        contador <= 0;
        led <= ~led;
    end else begin
        contador <= contador + 1;
    end
end
*/

// Fin Divisor de Frecuencia

endmodule