 
interface intf #(parameter data_width = 8,
  parameter depth = 16,parameter addr=$clog2(depth))
   (input logic clk);
  
  
  logic rst;
  logic w_a;
  logic r_b;
  logic [data_width-1:0] w_data;
  logic [addr-1:0] w_addr;
  logic [addr-1:0] r_addr;
  logic [data_width-1:0] r_data;
  
  // Modports 
  modport DUT (
    input  clk, rst, w_a, r_b, w_data, w_addr, r_addr,
    output r_data
  );
  
  // Clocking block for synchronization 
  clocking drv_cb @(posedge clk);
    default input #1 output #1;
    output rst, w_a, r_b, w_data, w_addr, r_addr;
    input  r_data;
  endclocking
  
   clocking mon_cb @(negedge clk);
    default input #1 output#1;
    input rst, w_a, r_b, w_data, w_addr, r_addr, r_data;
  endclocking
  
endinterface
