/*

Write the Verilog description for the nor based RS latch.
Include delays of 1 unit when instantiating the nor gate.
Write the stimulus module for RS Latch using the follwing table
and verify the outputs.

set | reset | q(n+1)
 0  |   0   |  q(n)
 0  |   1   |   0
 1  |   0   |   1
 1  |   1   |   ?
 
*/

module RS_Latch(set,reset,q,q_bar);

input set,reset;

output q,q_bar;

nor #1 (q,q_bar,reset); // #1 defines the value of delay associated
					    // with gates this 1 implies that all the delays
nor #1 (q_bar,q,set);   // i.e. Rise delay, Fall delay and Turn-off Delays are same

endmodule
