module Test_Bench;
  
  reg x,y,z;
  
  wire D,B;
  
  Que_1 FS(x,y,z,D,B);
  
  initial
  begin
    
    #10
    
    x=1'b0; y=1'b0; z=1'b0;
    
    #10
    
    x=1'b0; y=1'b0; z=1'b1;
    
    #10
    
    x=1'b0; y=1'b1; z=1'b0;
    
    #10
    
    x=1'b0; y=1'b1; z=1'b1;
    
    #10
    
    x=1'b1; y=1'b0; z=1'b0;
    
    #10
    
    x=1'b1; y=1'b0; z=1'b1;
    
    #10
    
    x=1'b1; y=1'b1; z=1'b0;
    
    #10
    
    x=1'b1; y=1'b1; z=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule