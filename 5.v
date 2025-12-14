module shift_reg_4bit (
    input        clk,
    input        areset,   // asynchronous reset
    input        load,     // synchronous load (higher priority)
    input        ena,      // shift enable
    input  [3:0] data,     // parallel load input
    output reg [3:0] q     // shift register contents
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 4'b0000;              // async reset
        else if (load)
            q <= data;                 // synchronous load
        else if (ena)
            q <= {1'b0, q[3:1]};        // right shift
        else
            q <= q;                    // hold
    end

endmodule
