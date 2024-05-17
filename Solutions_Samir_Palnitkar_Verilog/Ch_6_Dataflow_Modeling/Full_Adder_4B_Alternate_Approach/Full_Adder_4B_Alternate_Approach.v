/* This one of the approaches to code a 4-Bit Full Adder

using dataflow modeling

*/

module Full_Adder_4B_Alternate_Approach(a,b,c_in,sum,cout);

input [3:0]a,b;

input c_in;

output [3:0] sum;

output cout;

assign {cout,sum}=a+b+c_in;

endmodule
