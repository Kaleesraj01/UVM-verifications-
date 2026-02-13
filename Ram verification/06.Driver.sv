class my_driver extends uvm_driver #(my_seq_item);
  `uvm_component_utils (my_driver)
  
  virtual intf vintf;
  
  function new (string name = "my_driver ", uvm_component parent);
    super.new(name , parent);
  endfunction 
  
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
   
    
    if (!uvm_config_db #(virtual intf)::get(this , "", "vintf", vintf))
      `uvm_fatal ("NO_VINTF", "virtual interface not found")
      
      endfunction 
      
      task run_phase(uvm_phase phase);
        my_seq_item trans ;
       
    forever
      begin 
    seq_item_port.get_next_item(trans);
       
    
     
    @(vintf.drv_cb);
     vintf.w_a <= trans.w_a;
    vintf.r_b <= trans.r_b;
    vintf.w_data <= trans.w_data;
    vintf.w_addr <= trans.w_addr;
    vintf.r_addr <= trans.r_addr;
      
     `uvm_info("DRV", $sformatf("Driving: w_a=%0d, r_b=%0d, w_addr=%0d, r_addr=%0d, w_data=%0h", trans.w_a, trans.r_b, trans.w_addr, trans.r_addr, trans.w_data), UVM_HIGH)
     seq_item_port.item_done();
    end 
    endtask 
    
    endclass 
    
      
      
