module Test_Bench;
  
  reg x,y;
  
  wire z;
  
  xor_gate xorg(x,y,z);
  
  initial
  begin
    
    #10
    
    x=1'b0; y=1'b0;
    
    #10
    
    x=1'b0; y=1'b1;
    
    #10
    
    x=1'b1; y=1'b0;
    
    #10
    
    x=1'b1; y=1'b1;
    
    #10
    
    x=1'b0; y=1'b0;
    
    #10
    
    $finish;
    
  end
  
endmodule




