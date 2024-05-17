/*

The follwoing is an Alternate approach to code 4-Bit Full Subtratctor

using Dataflow Modeling

*/

module Full_Subtractor_4B_Alternate_Approach(a,b,b_in,diff,bout);

input [3:0] a,b;

input b_in;

output [3:0] diff;

output bout;

assign {bout,diff}=a-b-b_in;

endmodule
