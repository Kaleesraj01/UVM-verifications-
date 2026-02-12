

class my_seq_item extends uvm_sequence_item ;
  
   parameter int addr= 4;    // For 16 addresses (2^4 = 16)
  parameter int data_width  = 8;    // 8-bit data width
  
  rand bit w_a , r_b  ;
  rand bit [addr-1:0] w_addr  ;
  bit [addr-1:0] r_addr;
  rand bit [data_width-1:0] w_data;
  bit [data_width-1:0] r_data;
  
  constraint c1 { w_addr<16; r_addr<16 ;}
  
  `uvm_object_utils (my_seq_item)
  function new (string name = "my_seq_item");
    super.new(name);
  endfunction 
      
  function string show ();
    return $sformatf ("w_addr=%0d , r_addr=%0d ,writedata=%0d, readdata=%0d ", w_addr ,r_addr , w_data , r_data);
  endfunction 
  
  
  
  
endclass 
