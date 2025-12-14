module t_flipflop (
    input clk,
    input T,
    output reg Q
);

    wire mux_out;

    // 2:1 MUX instance
    mux2to1 M1 (
        .a(Q),
        .b(~Q),
        .sel(T),
        .y(mux_out)
    );

    // D Flip-Flop behavior
    always @(posedge clk) begin
        Q <= mux_out;
    end

endmodule