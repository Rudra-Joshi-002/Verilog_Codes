module Test_Bench;
  
  reg [3:0]a,b;
  
  reg c_in;
  
  wire [3:0] sum;
  
  wire cout;
  
  Full_Adder_4B_Alternate_Approach fa(a,b,c_in,sum,cout);
  
  initial
  begin
    
    #10
    
    a=4'd0; b=4'd0; c_in=1'b0;
    
    #10
    
    a=4'd1; b=4'd0; c_in=1'b0;
    
    #10
    
    a=4'd2; b=4'd2; c_in=1'b0;
    
    #10
    
    a=4'd2; b=4'd2; c_in=1'b1;
    
    #10
    
    a=4'd5; b=4'd7; c_in=1'b0;
    
    #10
    
    a=4'd7; b=4'd7; c_in=1'b0;
    
    #10
    
    a=4'd7; b=4'd7; c_in=1'b1;
    
    #10
    
    a=4'd8; b=4'd7; c_in=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule