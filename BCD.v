module BCD(clk, rst_syn, Q, Q_out, Din, load);
input clk;
input rst_syn;
input load;
input Din[3:0];
  output [3:0]  Q; 
  output [7:0]  Q_out; 
  reg [3:0]  Q; 
  reg [7:0]  Q_out; 
always@ (posedge clk )
begin
  if (!rst_syn)
     Q=0;
  else if ( Q == 9)
     Q=0;
  else if (load) 
     Q = Din;
  else 
     Q+=1;
end
  
always@ (*)
 case (Q) 
    4'b0000: Q_out=8'hc0;
    4'b0001: Q_out=8'hf9;
    4'b0010: Q_out=8'ha4;
    4'b0011: Q_out=8'hb0;
    4'b0100: Q_out=8'h99;
    4'b0101: Q_out=8'h92;
    4'b0110: Q_out=8'h82;
    4'b0111: Q_out=8'hf8;
    4'b1000: Q_out=8'h80;
    4'b1001: Q_out=8'h90;
    4'b1010: Q_out=8'ha0;
    4'b1011: Q_out=8'h83;
    4'b1100: Q_out=8'ha7;
    4'b1101: Q_out=8'h91;
    4'b1110: Q_out=8'h84;
    4'b1111: Q_out=8'hf1;
  endcase 
  
 endmodule