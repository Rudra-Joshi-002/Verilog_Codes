/*

The 1-bit full adder described in the chapter can be expressed in a sum of products
form.

sum= a.b.c_in + a'.b.c_in'+ a'.b'.c_in + a.b'.c_in

c_out = a.b+ b.c_in + a.c_in

Assuming a, b, c_in are the inputs and sum and c_out are the outputs, design a logic
circuit to implement the 1-bit full adder, using only and, not, and or gates. Write
the Verilog description for the circuit. You may use up to 4-input Verilog primitive
and & or gates. Write the stimulus for the full adder and check the functionality
for all input combinations

*/


module Full_Adder_1_Bit(a,b,c_in,sum,c_out);

input a,b,c_in;

output sum,c_out;

wire [9:0]w;

not (w[0],a);

not (w[1],b);

not (w[2],c_in);

and (w[3],a,b,c_in);

and (w[4],w[0],b,w[2]);

and (w[5],w[0],w[1],c_in);

and (w[6],a,w[1],w[2]);

and (w[7],a,b);

and (w[8],b,c_in);

and (w[9],a,c_in);

or (sum,w[3],w[4],w[5],w[6]);

or (c_out,w[7],w[8],w[9]);

endmodule
