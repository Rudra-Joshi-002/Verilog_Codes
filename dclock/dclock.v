module dclock(clk, rst, hrs, min, sec);

  input clk, rst;
  output reg [6:0] hrs, min, sec;

  always @(posedge clk or posedge rst) 
  begin
	if (rst) 
	begin
	  
	  hrs <= 7'b0000000;
	  
	  min <= 7'b0000000;
	  
	  sec <= 7'b0000000;
	  
	end 
	
	else 
	begin
	  
	  sec <= sec + 1'd1;

	  if (sec == 59) 
	  begin
		
		sec <= 7'b0000000;
		
		min <= min + 1'd1;
		
		if (min==59 && sec==59)
	  begin
		
		  hrs <= hrs + 1'd1;
		  
		  min<=7'b0000000;
	  
		  if(hrs==23)
		  begin
		  
			  hrs<=0;
			  
			  min<=0;
			  
			  sec<=0;
		  
		  end
	  
		
	  end
		
	  end
	  
	  
	end
  end

endmodule

