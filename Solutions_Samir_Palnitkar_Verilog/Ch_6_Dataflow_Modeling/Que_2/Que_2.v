/*

Que-2: A magnitude comparator checks if one number is 1S greater than or equal to or less than
another number. A 4-bit magnitude comparator takes two 4-bit numbers, A and B, as
input. We write the bits in A and B as follows. The leftmost bit is the most
significant bit.

A= A(3) a(2)a(1) A(0)

B = B(3) B(2) B(1) B(O)

The maginitude can be compared by comparing the numbers bit by bit, starting with most significant bit.
If any bit mismatches, the number with bit zero is lower number. To realize this functionality in logic equations
let us define an intermediate variable. Notice that the function below is xnor function.

x(i)=A(i).B(i) + A(i)'.B(i)'

The three outputs of the magnitude comparator are A_gt_B, A_It_B, A_eq_B. They are defined with the following logic 
equations:

A_eq_B = x(3).x(2).x(1).x(0)

A_gt_B = (a(3).b(3)') + (x(3).a(2).b(2)') + (x(3).x(2).a(1).b(1)') + (x(3).x(2).x(1).a(0).b(0)')

A_lt_B = (a(3)'.b(3)) + (x(3).a(2)'.b(2)) + (x(3).x(2).a(1)'.b(1)) + (x(3).x(2).x(1).a(0)'.b(0))



Write the Verilog description of the module magnitude_comparator. Instantiate the
A and B.
magnitude comparator inside the stimulus module and try out a few combinations of
Ent
rts


*/

module Que_2(A,B,A_gt_B,A_lt_B,A_eq_B);

input [3:0] A,B;

output A_gt_B,A_lt_B,A_eq_B;

wire [3:0]x; // extra variables that uses Input variable combinations can be declared as wires

assign x=A~^B;

assign A_eq_B = ((x[3])&(x[2])&(x[1])&(x[0]));

assign A_gt_B = ((A[3] & (~B[3])) || (x[3] & A[2] & (~B[2])) || (x[3] & x[2] & A[1] & (~B[1])) || (x[3] & x[2] & x[1] & A[0] & (~B[0])));

assign A_lt_B = (((~A[3]) & B[3]) || (x[3] & (~A[2]) & B[2]) || (x[3] & x[2] & (~A[1]) & B[1]) || (x[3] & x[2] & x[1] & (~A[0]) & B[0]));

endmodule
