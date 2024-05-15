/*
Que-1: A full subtractor has three 1-bit inputs X, Y and Z (previous borrow) and two 1-bit
outputs D (difference) and B (borrow). The logic equations for D and B are as
follows:

D= x'.y'.z + x'.y.z' + x.y'.z' + x.y.z

B= x'.y + x'.z + y.z

Write the full Verilog description for the full subtractor module, including I/O ports
(remember that + in logic equations corresponds to a logical or operator (||) in
dataflow). Instantiate the subtractor inside a stimulus block and test all eight
possible combinations of X, y and Z given in the following truth table.

 x | y | z | D | B
---|---|---|---|---
 0 | 0 | 0 | 0 | 0
 0 | 0 | 1 | 1 | 1
 0 | 1 | 0 | 1 | 1
 0 | 1 | 1 | 0 | 1
 1 | 0 | 0 | 1 | 0
 1 | 0 | 1 | 0 | 0
 1 | 1 | 0 | 0 | 0
 1 | 1 | 1 | 1 | 1

*/

module Que_1(x,y,z,D,B);

input x,y,z;

output D,B;

assign D=(((~x)&(~y)&(z))||((~x)&(y)&(~z))||((x)&(~y)&(~z))||((x)&(y)&(z)));

assign B=(((~x)&(y))||((~x)&(z))||((y)&(z)));

endmodule
