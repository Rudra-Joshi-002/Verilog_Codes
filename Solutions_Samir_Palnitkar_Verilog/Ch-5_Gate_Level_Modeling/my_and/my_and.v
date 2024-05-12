/* 

Create your own 2-input Verilog gates called my-and
from 2-input nand gates. Check the functionality of these gates with 
a stimulus module.

*/

module my_and(in1,in2,out);

input in1,in2;

output out;

wire w1;

nand (w1,in1,in2);

nand (out,w1);

endmodule
