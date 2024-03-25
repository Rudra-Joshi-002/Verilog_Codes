module shift_reg_4b(
    input [3:0] l,      // Input data to be loaded into the shift register
    input d,            // Serial input data
    input r,            // Shift right control signal
    input clk,          // Clock signal
    input rst,          // Reset control signal
    input lf,           // Shift left control signal
    output reg [3:0] q  // Output of the shift register
);

always @(posedge clk, posedge rst) // Sensitivity list for the always block
begin
    if (rst)  // Reset condition
    begin
        q <= 0;  // Reset the output to all zeros
    end

    else if (r == 0 && lf == 0) // If shift right and left both are zero
    begin
        q <= l;  // Load the input 'l' into the output register 'q'
    end

    else if (r == 1 && lf == 0) // If shift right is high and shift left is low
    begin
        // Shift right operation
        q[0] <= q[1];  // Move each bit to the right by one position
        q[1] <= q[2];
        q[2] <= q[3];
        q[3] <= d;     // Load serial input 'd' into the most significant bit
    end

    else if (r == 0 && lf == 1) // If shift right is low and shift left is high
    begin
        // Shift left operation
        q[0] <= d;     // Load serial input 'd' into the least significant bit
        q[1] <= q[0];  // Move each bit to the left by one position
        q[2] <= q[1];
        q[3] <= q[2];
    end
end

endmodule
