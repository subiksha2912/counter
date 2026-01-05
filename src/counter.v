module counter( input wire clk,
               input wire reset,
               input wire ctrl,
               output reg [7:0]count);
  always@(posedge clk or posedge reset) begin
    if(reset) begin
      count <= 8'd0;
    end
    else if(ctrl) begin
      if(count == 8'd255) begin
        count <= 8'd0;
      end
      else
        count <= count + 1;
    end
  end
endmodule

  
