`timescale 1ns/1ps
module BCD_tb;
  reg clk;
  reg rst_syn;
  reg Din;
  reg load;
  wire [3:0]  Q; 
  wire [7:0]  Q_out; 
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;

initial
    begin
    #OFFSET;
    forever
        begin
        clk = 1'b1;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b0;
        #(PERIOD*DUTY_CYCLE);
        end
    end
initial begin
    rst_syn = 1'b0;
    #5 rst_syn = 1'b1;
    #195 rst_syn =1'b0;
    #5 rst_syn = 1'b1;
    #55 $finish;
end
initial begin
    load= 1'b0;
    #200 load = 1'b1;
    #10 load = 1'b0;
    #500 $finish;
end
initial begin
    Din= 4'b0001;
    #500 $finish;
end
initial begin
$dumpfile("BCD.vcd");
  $dumpvars(0, BCD_2);
end
  BCD BCD_2 (.clk(clk), .rst_syn(rst_syn), .Din(Din), .Q(Q), .Q_out(Q_out), .load(load));
endmodule