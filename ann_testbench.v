`timescale 1ns / 1ps

module tb_neural_network;

    // Testbench signals
    reg signed [2:0] a1, a2, a3, a4, a5, a6;
    wire [7:0] fop;

    // Instantiate DUT
    ann dut (
        .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6),
        .fop(fop)
    );

    initial begin
     
        // Apply test vectors
        $display("Time\t a1 a2 a3 a4 a5 a6 | fop");
        $monitor("%0t\t %d %d %d %d %d %d | %d", $time, a1,a2,a3,a4,a5,a6,fop);

        // Test 1: all zeros
        a1=0; a2=0; a3=0; a4=0; a5=0; a6=0;
        #10;

        // Test 2: positive inputs
        a1=2; a2=2; a3=1; a4=2; a5=3; a6=1;
        #10;

        // Test 3: mix positive & negative
        a1=-2; a2=2; a3=-1; a4=2; a5=-2; a6=1;
        #10;

        // Test 4: strong negatives
        a1=-2; a2=-2; a3=-2; a4=-1; a5=-2; a6=-2;
        #10;

        // Test 5: random case
        a1=2; a2=-1; a3=2; a4=-2; a5=1; a6=-2;
        #10;

        $finish;
    end
endmodule
