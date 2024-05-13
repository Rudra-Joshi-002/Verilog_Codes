module Test_Bench;
  
  reg set,reset;
  
  wire q,q_bar;
  
  RS_Latch rsl(set,reset,q,q_bar);
  
  initial
  begin
    
    #10
    
    set=1'b0; reset=1'b0;
    
    #10
    
    set=1'b0; reset=1'b1;
    
    #10
    
    set=1'b1; reset=1'b0;
    
    #10
    
    set=1'b1; reset=1'b1;
    
    #10
    
    set=1'b0; reset=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule