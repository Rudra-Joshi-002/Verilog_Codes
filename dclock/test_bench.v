module test_bench;
  
  reg clk;
  
  reg rst;
  
  wire [6:0] hrs;
  
  wire [6:0] min;
  
  wire [6:0] sec;
  
  dclock dclk(clk, rst, hrs, min, sec);

  initial
  begin
    
    clk=1'b0;
    
    rst=1'b0;
    
    forever #5 clk=~clk;
    
  end
  
  initial 
  begin
    
    #5
    
    rst=1'b1;
    
    #10
    
    rst=1'b0;
    
    #36000
    
    rst=1'b1;
    
    #10
    
    rst=1'b0;
    
    $finish;
    
  end
  
endmodule

  
