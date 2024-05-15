/*

Que-3: A synchronous counter can be designed by using master-slave JK flipflops. 
Design a 4-bit synchronous counter. Circuit diagrams for the synchronous counter and the JK
flipflop are given in Figures 6-5 and 6-6. The clear signal is active low. 
Data gets latched on positive edge of clock, and the output of the flipflop appears on the negative edge of clock. 
Counting is disabled when count_enable signal is low. 
Write dataflow description for the synchronous counter. Write A stimulus file that
exercises clear and count_enable. Display the output count Q[3:0].

The Diagrams For This Question is attached in file as Que_Diagram

*/

module Que_3(clear,clock,count_enable,Q,Qbar);

input clear,clock,count_enable;

output [3:0]Q,Qbar;

wire w1,w2,w3;

assign w1=(count_enable&Q[1]); // o/p of 1st and gate

assign w2=(w1&Q[2]); // o/p of 2nd and gate

assign w3=(w2&Q[3]); // o/p of 3rd and gate

JK_FF FF1(count_enable,count_enable,clear,clock,Q[0],Qbar[0]);

JK_FF FF2(w1,w1,clear,clock,Q[1],Qbar[1]);

JK_FF FF3(w2,w2,clear,clock,Q[2],Qbar[2]);

JK_FF FF4(w3,w3,clear,clock,Q[3],Qbar[3]);

endmodule



module JK_FF(J,K,clear,clock,q,qbar);

input J,K,clear,clock;

output q,qbar;

wire a,b,c,d,y,ybar,cbar;

assign cbar=~clock;

assign a=~(J&clear&clock&qbar);

assign b=~(K&clock&q);

assign y=~(a&ybar);

assign ybar=~(b&y&clear);

assign c=~(y&cbar);

assign d=~(ybar&cbar);

assign q=~(c&qbar);

assign qbar=~(q&d&clear);

endmodule
