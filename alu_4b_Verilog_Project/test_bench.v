module test_bench;

reg [3:0]x,y;

reg z,p1,p2;

wire [7:0]m;

wire [3:0]e;

wire c;

wire [6:0] disp1op, disp2op;

alu_4b a(x,y,z,p1,p2,m,e,c,disp1op,disp2op);

initial
begin

#5 p1=1'b0; p2=1'b0;

x=4'd0;

y=4'd0;

z=1'b0;

#5

x=4'd1;

y=4'd0;

z=1'b0;

#5

x=4'd1;

y=4'd1;

z=1'b0;

#5

x=4'd5;

y=4'd5;

z=1'b0;

#5

x=4'd10;

y=4'd5;

z=1'b0;

#5

x=4'd3;

y=4'd6;

z=1'b0;

#5

x=4'd4;

y=4'd3;

z=1'b0;

#10 p1=1'b0; p2=1'b1;

#5

x=4'd0;

y=4'd0;

z=1'b0;

#5

x=4'd1;

y=4'd0;

z=1'b0;

#5

x=4'd1;

y=4'd1;

z=1'b0;

#5

x=4'd6;

y=4'd5;

z=1'b0;

#5

x=4'd10;

y=4'd5;

z=1'b0;

#5

x=4'd3;

y=4'd6;

z=1'b0;

#5

x=4'd4;

y=4'd3;

z=1'b0;

#5

x=4'd7;

y=4'd9;

z=1'b0;

#10 p1=1'b1; p2=1'b0; z=1'b0;

#5 x=4'd0; y=4'd0;

#5 x=4'd1; y=4'd0;

#5 x=4'd1; y=4'd1;

#5 x=4'd2; y=4'd1;

#5 x=4'd2; y=4'd2;

#5 x=4'd4; y=4'd5;

#5 x=4'd10; y=4'd11;

#5 x=4'd12; y=4'd13;

#5 x=4'd14; y=4'd9;

#5 x=4'd15; y=4'd15;

#10 p1=1'b1; p2=1'b1; z=1'b0;

#5 x=4'd0; y=4'd0;

#5 x=4'd1; y=4'd1;

#5 x=4'd1; y=4'd2;

#5 x=4'd2; y=4'd1;

#5 x=4'd4; y=4'd2;

#5 x=4'd15; y=4'd5;

#5 x=4'd10; y=4'd4;

#5 x=4'd12; y=4'd13;

#5 x=4'd14; y=4'd9;

#5 x=4'd15; y=4'd15;

$finish;
end

endmodule

