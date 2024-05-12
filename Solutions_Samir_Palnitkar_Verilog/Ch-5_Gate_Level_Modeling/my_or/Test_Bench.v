module Test_Bench;
  
  reg in1,in2;
  
  wire out;
  
  my_or myor(in1,in2,out);
  
  initial
  begin
    
    #10
    
    in1=1'b0; in2=1'b0;
    
    #10
    
    in1=1'b0; in2=1'b1;
    
    #10
    
    in1=1'b1; in2=1'b0;
    
    #10
    
    in1=1'b1; in2=1'b1;
    
    #10
    
    in1=1'b0; in2=1'b0;
    
    #10
    
    $finish;
    
  end
  
endmodule



