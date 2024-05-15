module Test_Bench;
  
  reg [3:0]A,B;
  
  wire A_gt_B,A_lt_B,A_eq_B;
  
  Que_2 parity_checker(A,B,A_gt_B,A_lt_B,A_eq_B);
  
  initial
  begin
    
    #10
    
    A=4'd0; B=4'd0;
    
    #10
    
    A=4'd10; B=4'd9;
    
    #10
    
    A=4'd4; B=4'd9;
    
    #10
    
    A=4'd10; B=4'd10;
    
    #10
    
    $finish;
    
  end
  
endmodule    