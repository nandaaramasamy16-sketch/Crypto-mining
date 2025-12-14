module dff_async_clear (
    input clk,
    input clr,
    input D,
    output reg Q
);

    always @(posedge clk or posedge clr) begin
        if (clr)
            Q <= 1'b0;   // asynchronous clear
        else
            Q <= D;
    end

endmodule