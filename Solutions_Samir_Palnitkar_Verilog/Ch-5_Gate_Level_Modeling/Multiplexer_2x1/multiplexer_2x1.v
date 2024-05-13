/*

Design a 2 to 1 Multiplexer using bufif0 & bufif1 gates

the delay specifications for the two gates are:

		|	Min		|	Typ		|	Max
Rise	|	 1		|	 2		|	 3
Fall	|	 3		|	 4		|	 5
Turnoff	|	 5		|	 6		|	 7

Apply the stimulus and test the output values.

*/

module multiplexer_2x1(in0,in1,s,out);

input in0,in1,s;

output out;

bufif1 #(1:2:3,3:4:5,5:6:7)(out,in1,s); // Min, Typ and Max Delays Associated with Gates in their
										// Rise Delay, Fall Delay & Turnoff Delay
bufif0 #(1:2:3,3:4:5,5:6:7)(out,in0,s);

endmodule