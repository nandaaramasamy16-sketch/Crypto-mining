module pattern_101_fsm (
    input clk,
    input rst,
    input x,
    output reg y
);

    typedef enum reg [1:0] {S0, S1, S2, S3} state_t;
    state_t state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0: next_state = (x) ? S1 : S0;
            S1: next_state = (x) ? S1 : S2;
            S2: next_state = (x) ? S3 : S0;
            S3: next_state = (x) ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        y = (state == S3);
    end

endmodule