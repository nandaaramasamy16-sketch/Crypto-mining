// I. Blocking assignment – WITH temporary variable
always @(*) begin
    temp = a;
    a = b;
    b = temp;
end
// I. Blocking assignment – WITHOUT temporary variable (XOR method)
always @(*) begin
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
end
// II. Non-blocking assignment – WITH temporary variable
always @(posedge clk) begin
    temp <= a;
    a    <= b;
    b    <= temp;
end
// II. Non-blocking assignment – WITHOUT temporary variable
always @(posedge clk) begin
    a <= b;
    b <= a;
end