/*

A 2-input xor gate can be built from my_and, my_or and my_not gates. Construct
an xor module in Verilog that realizes the logic function, z = xy' + x'y . Inputs are x
and y, and z is the output. Write a stimulus module that exercises all four
combinations of x and y inputs

*/

module xor_gate(x,y,z);

input x,y;

output z;

wire [3:0]w;

my_not n1(x,w[0]);

my_not n2(y,w[1]);

my_and a1(x,w[1],w[2]);

my_and a2(w[0],y,w[3]);

my_or o1(w[2],w[3],z);

endmodule

module my_and(in1,in2,out);

input in1,in2;

output out;

wire w1;

nand (w1,in1,in2);

nand (out,w1);

endmodule

module my_or(in1,in2,out);

input in1,in2;

output out;

wire w1,w2;

nand (w1,in1);

nand (w2,in2);

nand (out,w1,w2);

endmodule

module my_not(in,out);

input in;

output out;

nand (out,in);

endmodule
