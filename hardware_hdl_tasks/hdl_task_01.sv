module QuantumQubitControl (
    input wire clock,
    input wire reset,
    input wire apply_X_gate,
    input wire apply_Hadamard_gate,
    output wire qubit_state
);

reg [1:0] qubit_state; // Represents qubit state (00, 01, 10, 11)

always @(posedge clock or posedge reset) begin
    if (reset) begin
        qubit_state <= 2'b00; // Reset qubit state to |0>
    end else begin
        // Apply X gate if apply_X_gate is asserted
        if (apply_X_gate) begin
            qubit_state <= ~qubit_state;
        end
        // Apply Hadamard gate if apply_Hadamard_gate is asserted
        else if (apply_Hadamard_gate) begin
            qubit_state <= qubit_state ^ 2'b01; // Apply Hadamard gate to qubit state
        end
    end
end

assign qubit_state = qubit_state; // Output qubit state

endmodule
