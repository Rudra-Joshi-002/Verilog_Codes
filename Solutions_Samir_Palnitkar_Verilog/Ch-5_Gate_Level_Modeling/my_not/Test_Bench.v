module Test_Bench;
  
  reg in;
  
  wire out;
  
  my_not mnot(in,out);
  
  initial
  begin
    
    #10
    
    in=1'b0;
    
    #10
    
    in=1'b1;
    
    #10
    
    in=1'b0;
    
    #10
    
    $finish;
    
  end
  
endmodule