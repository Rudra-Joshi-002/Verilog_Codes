/*

reate your own 2-input Verilog gate called my-not from 2-input
nand gates. Check the functionality of these gates with a stimulus module.

*/

module my_not(in,out);

input in;

output out;

nand (out,in);

endmodule
