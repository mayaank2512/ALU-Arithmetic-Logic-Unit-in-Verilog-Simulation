`timescale 1ns/1ps

module alu_tb;

    reg [7:0] A, B;
    reg [3:0] opcode;
    wire [7:0] result;
    wire zero, carry;

    ALU uut (.A(A), .B(B), .opcode(opcode), .result(result), .zero(zero), .carry(carry));

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, alu_tb);

        // Test ADD
        A = 8'd10; B = 8'd5; opcode = 4'b0000; #10;
        // Test SUB
        A = 8'd15; B = 8'd5; opcode = 4'b0001; #10;
        // Test AND
        A = 8'b1100; B = 8'b1010; opcode = 4'b0010; #10;
        // Test OR
        A = 8'b1100; B = 8'b1010; opcode = 4'b0011; #10;
        // Test XOR
        opcode = 4'b0100; #10;
        // Test Shift Left
        A = 8'b00001111; opcode = 4'b0110; #10;
        // Test Greater
        A = 8'd20; B = 8'd10; opcode = 4'b1000; #10;
        // Test Equal
        A = 8'd7; B = 8'd7; opcode = 4'b1001; #10;

        $finish;
    end
endmodule
