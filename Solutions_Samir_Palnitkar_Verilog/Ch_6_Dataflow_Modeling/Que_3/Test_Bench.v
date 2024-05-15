module Test_Bench;
  
  reg clear, clock, count_enable;
  
  wire [3:0] Q, Qbar;
  
  Que_3 counter(clear, clock, count_enable, Q, Qbar);
  
  initial begin
    // Initial values
    clear = 1'b0;
    clock = 1'b0;
    count_enable = 1'b1;
    
    #5
    clear = 1'b1;
    count_enable = 1'b0;

    // Start clock toggling
    forever #5 clock = ~clock;
  end
  
  initial begin
    // Stimulus
    #15
    count_enable = 1'b1;
    
    #160
    clear = 1'b0;
    
    #20
    clear = 1'b1;
    
    #10
    count_enable = 1'b0;
    
    #30
    $finish;
  end
  
endmodule
