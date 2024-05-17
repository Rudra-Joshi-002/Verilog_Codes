module Test_Bench;
  
  reg [3:0]a,b;
  
  reg b_in;
  
  wire [3:0] diff;
  
  wire bout;
  
  Full_Subtractor_4B_Alternate_Approach fa(a,b,b_in,diff,bout);
  
  initial
  begin
    
    #10
    
    a=4'd0; b=4'd0; b_in=1'b0;
    
    #10
    
    a=4'd1; b=4'd0; b_in=1'b0;
    
    #10
    
    a=4'd2; b=4'd2; b_in=1'b0;
    
    #10
    
    a=4'd2; b=4'd2; b_in=1'b1;
    
    #10
    
    a=4'd5; b=4'd7; b_in=1'b0;
    
    #10
    
    a=4'd7; b=4'd7; b_in=1'b0;
    
    #10
    
    a=4'd7; b=4'd7; b_in=1'b1;
    
    #10
    
    a=4'd8; b=4'd7; b_in=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule
