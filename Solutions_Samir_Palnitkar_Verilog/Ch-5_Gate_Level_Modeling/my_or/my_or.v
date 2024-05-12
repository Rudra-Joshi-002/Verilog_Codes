/* 

Create your own 2-input Verilog gates called my-or
from 2-input nand gates. Check the functionality of these gates with 
a stimulus module.

*/

module my_or(in1,in2,out);

input in1,in2;

output out;

wire w1,w2;

nand (w1,in1);

nand (w2,in2);

nand (out,w1,w2);

endmodule
