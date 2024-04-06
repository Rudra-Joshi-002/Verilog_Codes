module test_bench;
  
  reg d,r,clk,rst,lf;
  
  reg [3:0]l;
  
  wire [3:0]q;
  
  shift_reg_4b sreg(d,q,lf,l,r,clk,rs);
  
  initial
  begin
    
  clk=1'b0;
  
  forever #5 clk=~clk;
  
  end
  
  initial
  begin
    
    rst=1'b0;
    
    lf=1'b0; r=1'b0;
    
    #5
    
    l=4'd0;
    
    d=1'b1;
    
    lf=1'b0; r=1'b1;
    
    #45
    
    rst=1'b1;
    
    lf=1'b1; r=1'b0;
    
    #10
    
    rst=1'b0;
    
    d=1'b0;
    
    #45
    
    rst=1'b1;
    
    #5
    
    rst=1'b0;
    
    $finish;
    
  end
  
endmodule

    
    


  
