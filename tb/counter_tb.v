module counter_tb;

  reg clk;
  reg reset;
  reg ctrl;
  wire [7:0] count;


  counter dut (
    .clk(clk),
    .reset(reset),
    .ctrl(ctrl),
    .count(count)
  );

  // Clock generation (10 ns period)
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Initialize signals
    clk   = 0;
    reset = 1;
    ctrl  = 0;

    // Apply asynchronous reset
    #10;
    reset = 0;

    // Enable counting
    #10;
    ctrl = 1;

    // Let counter run for some cycles
    #300;

    // Disable counting
    ctrl = 0;
    #50;

    // Enable again
    ctrl = 1;
    #100;

    // Apply reset again
    reset = 1;
    #10;
    reset = 0;

    #50;
    $finish;
  end

  // Monitor values
  initial begin
    $monitor("Time=%0t | reset=%b | ctrl=%b | count=%d",
              $time, reset, ctrl, count);
  end

endmodule

  
