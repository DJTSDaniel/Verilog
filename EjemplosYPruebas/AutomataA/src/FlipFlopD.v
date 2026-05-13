module FlipFlopD(
    input clk,
    input clr,
    input D,
    output reg q
);

always @(posedge clk or negedge clr)
begin
    if (!clr)
        q <= 1'b0;
    else
        q <= D;
end


endmodule