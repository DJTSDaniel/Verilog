module divisor_frecuencia(
   input clk,
input clr,
output reg enable
);

reg [25:0] contador;

always @(posedge clk or negedge clr)
begin

    if(!clr)
    begin
        contador <= 0;
        enable <= 0;
    end
    else
    begin

        if(contador == 26_999_999)
        begin
            contador <= 0;
            enable <= 1;
        end
        else
        begin
            contador <= contador + 1;
            enable <= 0;
        end

    end

end



endmodule