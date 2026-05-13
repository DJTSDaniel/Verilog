module testbench;
    reg X, clk, clr;
    wire led;
    wire [6:0] display;
    
    AutomataA uut(
        .X(X),
        .clk(clk),
        .clr(clr),
        .led(led),
        .salida1(),  // Si no usas salida1, déjala vacía
        .display(display)
    );
    
    // Generador de reloj
    always #10 clk = ~clk;  // 50MHz
    
    initial begin
        // Inicialización
        clr = 1;
        X = 0;
        clk = 0;
        
        // Reset
        #20 clr = 0;
        #20 clr = 1;
        
        // Secuencia de prueba
        #200 X = 1;  
        #200 X = 0;
        #200 X = 1;  
        #200 X = 1;
        #200 X = 0;  
        #200 X = 0;
        #200 X = 1;  
        #200 X = 1;
        
        #1000 $finish;
    end
    
    // Monitorear - AHORA usando señales que existen
    initial begin
        $monitor("Tiempo=%t, X=%b, Q2=%b, Q1=%b, Q0=%b, Display=%b", 
                  $time, X, uut.FFD2.Q, uut.FFD1.Q, uut.FFD0.Q, display);
    end
endmodule