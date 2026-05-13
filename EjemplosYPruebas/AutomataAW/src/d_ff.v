module d_ff(
     input clk,
    input clr,
    input d,
    output reg q
);

always @(posedge clk or negedge clr)
begin
    if (!clr)
        q <= 1'b0;
    else
        q <= d;
end


endmodule