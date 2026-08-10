```verilog
`timescale 1ns/1ps

module down_counter_tb;

    parameter WIDTH = 4;

    reg clk;
    reg reset;
    reg enable;
    wire [WIDTH-1:0] count;

    // Instantiate the down counter
    down_counter #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk = 0;
        reset = 1;
        enable = 0;

        // Apply reset
        #10;
        reset = 0;
        enable = 1;

        // Allow counter to run
        #180;

        // Stop counter
        enable = 0;

        #20;
        $finish;
    end

    // Display counter value
    always @(posedge clk) begin
        $display(
            "Time = %0t | Reset = %b | Enable = %b | Count = %d",
            $time,
            reset,
            enable,
            count
        );
    end

endmodule
```
