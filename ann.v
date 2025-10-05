module ann(
    input signed [2:0] a1, a2, a3, a4, a5, a6,  // 3-bit signed decimal inputs
    output reg [7:0] fop
);
    reg signed [7:0] y1, y2, y3, ay1, ay2, ay3, z1, z2, az1, az2, op;
    reg signed [3:0] w1, w2, w3, w4, w5, w6, w7, w8, w9;
    reg signed [2:0] b1, b2, b3, b4, b5, b6;

    initial begin
        // Initialize weights and biases as positive integers
        w1 = 4'd4;   
        w2 = -4'd3;   
        w3 = 4'd1;   
        w4 = 4'd2;   
        w5 = -4'd2;   
        w6 = 4'd4;   
        w7 = 4'd1;   
        w8 = -4'd3;   
        w9 = 4'd2;   
        b1 = 3'd2;   
        b2 = -3'd2;   
        b3 = 3'd1;  
        b4 = -3'd1;   
        b5 = 3'd2;   
        b6 = -3'd3;  
    end

    always @(*) begin
        // First layer calculations
        y1 = (a1 * w1) + (a2 * w2) + b1;
        y2 = (a3 * w3) + (a4 * w4) + b2;
        y3 = (a5 * w5) + (a6 * w6) + b3;

        // ReLU activation function using if-else
        if (y1 > 0)
            ay1 = y1;
        else
            ay1 = 8'b0;  

        if (y2 > 0)
            ay2 = y2;
        else
            ay2 = 8'b0; 

        if (y3 > 0)
            ay3 = y3;
        else
            ay3 = 8'b0; 

        // Second layer calculations
        z1 = (ay1 * w7) + (ay2 * w7) + (ay3 * w7) + b4;
        z2 = (ay1 * w8) + (ay2 * w8) + (ay3 * w8) + b5;

        // ReLU activation for second layer using if-else
        if (z1 > 0)
            az1 = z1;
        else
            az1 = 8'b0;   
        if (z2 > 0)
            az2 = z2;
        else
            az2 = 8'b0;   

        // Final output layer
        op = (az1 * w9) + (az2 * w9) + b6;
        if (op > 0)
            fop = op;
        else
            fop = 8'b0;   
    end
endmodule

