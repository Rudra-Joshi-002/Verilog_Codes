module alu_4b(
    input [3:0] x, y,   //x,y Are Input Variables which are given from toggle switches of FPGA
    input z, p1, p2,    //p1-p2 Control Switches For Operation To Be Performed and z is for carry in
    output reg [7:0] m, //Variable For Storing Multiplication Output
    output reg [3:0] e, //Variable For Storing Addition, Subtraction and Divsion Output
    output reg c,		//Variable To Store Output Carry
    output wire [6:0] disp1op, disp2op // Variables For 7-Segment LED Display
);

    // Wires for connecting to seven-segment display modules
    wire [6:0] seg_op1, seg_op2;
    // Registers for storing intermediate values
    reg [3:0] e10s, e1s; //For Transfering The Values Of 10's Place And 1's Place To 7-Segment LEDs
    reg [4:0] dummy; //Dummy Variable for Performing Carry 
    
    //The Variables To Follow Are Associated With 4-Bit Multipllication Logic Only...
    
    reg [7:0] s1 = 0, s2 = 0, s3 = 0; //These Varaibles Are Used For The Bit-Wise 4-Bit Multiplication Logic And Acts As Sum Registers
    reg [7:0] b1 = 0, b2 = 0, b3 = 0, b4 = 0;//These Varaiables Are Used To Store Value of Sum Of Different "s" Registers 
    reg [8:0] c1 = 0, c2 = 0, c3 = 0;//These Variables Are Used To Store The Carry Output Of Bit-Wise Summation For Multiplication
    integer i;

    always @* begin
        // ALU operation based on control signals p1 and p2
        if(p1==0 && p2==0) begin //For Producing Sum Of Two 4-Bit Unsigned Numbers
            dummy[0] = z;
            for(i=0; i<4; i=i+1) begin
                e[i] = (x[i])^(y[i])^(dummy[i]);
                dummy[i+1] = (x[i]&y[i]) | (x[i]&dummy[i]) | (y[i]&dummy[i]);
            end
            c = dummy[4];
        end
        else if(p1==0 && p2==1) begin //For Producing Difference Of Two 4-Bit Unsigned Numbers
            dummy[0] = z;
            for(i=0; i<4; i=i+1) begin
                e[i] = (x[i])^(y[i])^(dummy[i]);
                dummy[i+1] = (~x[i]&y[i]) | (~x[i]&dummy[i]) | (y[i]&dummy[i]);
            end
            c = dummy[4];
        end
        else if(p1==1 && p2==0) begin //For Producing Product Of Two 4-Bit Unsigned Numbers
            for(i=0; i<4; i=i+1) begin
                b1[i] = x[i]&y[0];
                b2[i+1] = x[i]&y[1];
                b3[i+2] = x[i]&y[2];
                b4[i+3] = x[i]&y[3];
            end
            for(i=0; i<8; i=i+1) begin
                s1[i] = b1[i]^b2[i]^c1[i];
                c1[i+1] = (b1[i]&b2[i]) | (b1[i]&c1[i]) | (b2[i]&c1[i]);
            end
            c2[0] = c1[8];
            for(i=0; i<8; i=i+1) begin
                s2[i] = s1[i]^b3[i]^c2[i];
                c2[i+1] = (s1[i]&b3[i]) | (s1[i]&c2[i]) | (b3[i]&c2[i]);
            end
            c3[0] = c2[8];
            for(i=0; i<8; i=i+1) begin
                s3[i] = s2[i]^b4[i]^c3[i];
                c3[i+1] = (s2[i]&b4[i]) | (s2[i]&c3[i]) | (b4[i]&c3[i]);
                m[i] = s3[i];
            end
        end
        else if(p1==1 && p2==1) begin //For Producing Division Of Two 4-Bit Unsigned Numbers
            if (y == 4'b0) begin
                e = 4'b0;
                dummy = 5'b0;
                c = 1'b1;
            end
            else begin
                dummy[4] = 0;
                e = x / y;
                dummy = x % y;
                c = 1'b0;
            end
        end
        // Extract tens and ones digits for display
        e10s = e / 10;
        e1s = e % 10;
    end

    // Instantiate seven-segment display modules
    seven_seg seg1(e10s, seg_op2);
    seven_seg seg0(e1s, seg_op1);

    // Assign seven-segment outputs to display output wires
    assign disp1op = seg_op1;
    assign disp2op = seg_op2;

endmodule

module seven_seg(
    input [3:0] ip,
    output reg [6:0] op
);

    always @* begin
        // Display the appropriate segment pattern based on input where the 7-segment code has been modeled for common anode type Segments
        case(ip)
            4'b0000: op = 7'b1000000; // 0
            4'b0001: op = 7'b1111001; // 1
            4'b0010: op = 7'b0100100; // 2
            4'b0011: op = 7'b0110000; // 3
            4'b0100: op = 7'b0011001; // 4
            4'b0101: op = 7'b0010010; // 5
            4'b0110: op = 7'b0000010; // 6
            4'b0111: op = 7'b1111000; // 7
            4'b1000: op = 7'b0000000; // 8
            4'b1001: op = 7'b0010000; // 9
            default: op = 7'b0111111; // Error (display dash)
        endcase
    end

endmodule
