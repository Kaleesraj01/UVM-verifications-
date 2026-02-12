// Code your design here


module dual_port_ram 
  #(parameter data_width = 8 , depth =16 , addr=$clog2(depth ) )
  (input clk , rst , w_a , r_b , 
   input [data_width-1:0] w_data ,
   input [addr-1:0] w_addr ,
   input [addr-1:0] r_addr ,
   output logic [ data_width-1:0] r_data) ;
  
  logic [data_width-1:0] mem [0:depth-1];
  
  always_ff @(posedge clk or posedge rst) begin
     if (rst) begin
    for(int i =0 ; i<16 ;i++)begin 
      mem[i] <= 8'h00;
    end 
      r_data <= 0 ;
    end 
    
   else begin
     if (w_a) 
       mem[w_addr] <= w_data ;
      
     if (r_b) 
       r_data <= mem[r_addr];
   end 
 end 
    endmodule 
       
       
