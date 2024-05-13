module Test_Bench;
  
  reg in0,in1,s;
  
  wire out;
  
  multiplexer_2x1 m(in0,in1,s,out);
  
  initial
  begin
    
    in0=1'b0; in1=1'b1;
    
    #10
    
    s=1'b0;
    
    #10
    
    s=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule