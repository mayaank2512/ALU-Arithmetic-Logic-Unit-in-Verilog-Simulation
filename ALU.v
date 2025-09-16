module ALU (
    input [7:0] A, B,
    input [3:0] opcode,
    output reg [7:0] result,
    output reg zero, carry
);

always @(*) begin
    case(opcode)
        4'b0000: {carry, result} = A + B;        // ADD
        4'b0001: {carry, result} = A - B;        // SUB
        4'b0010: result = A & B;                 // AND
        4'b0011: result = A | B;                 // OR
        4'b0100: result = A ^ B;                 // XOR
        4'b0101: result = ~A;                    // NOT
        4'b0110: result = A << 1;                // Shift Left
        4'b0111: result = A >> 1;                // Shift Right
        4'b1000: result = (A > B) ? 8'd1 : 8'd0; // Greater
        4'b1001: result = (A == B) ? 8'd1 : 8'd0;// Equal
        default: result = 8'd0;
    endcase

    zero = (result == 0);
end

endmodule
