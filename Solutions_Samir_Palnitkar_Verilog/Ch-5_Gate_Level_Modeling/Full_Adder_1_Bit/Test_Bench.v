module Test_Bench;
  
  reg a,b,c_in;
  
  wire sum,c_out;
  
  Full_Adder_1_Bit fa(a,b,c_in,sum,c_out);
  
  initial
  begin
    
    #10
    
    a=1'b0; b=1'b0; c_in=1'b0;
    
    #10
    
    a=1'b0; b=1'b0; c_in=1'b1;
    
    #10
    
    a=1'b0; b=1'b1; c_in=1'b0;
    
    #10
    
    a=1'b0; b=1'b1; c_in=1'b1;
    
    #10
    
    a=1'b1; b=1'b0; c_in=1'b0;
    
    #10
    
    a=1'b1; b=1'b0; c_in=1'b1;
    
    #10
    
    a=1'b1; b=1'b1; c_in=1'b0;
    
    #10
    
    a=1'b1; b=1'b1; c_in=1'b1;
    
    #10
    
    $finish;
    
  end
  
endmodule

