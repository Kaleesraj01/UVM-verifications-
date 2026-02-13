class my_monitor extends uvm_monitor;
  `uvm_component_utils (my_monitor)
  
  virtual intf vintf;
  
  uvm_analysis_port #(my_seq_item) ap;
  
  
  function new (string name = "my_monitor ", uvm_component parent);
    super.new(name , parent);
  endfunction 
  
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
   
    if (!uvm_config_db #(virtual intf)::get(this , "", "vintf", vintf))
      `uvm_fatal ("NO_VINTF", "virtual interface not found")
      
      ap = new("ap", this);
   
      
      endfunction 
      
      
  task run_phase  (uvm_phase phase);
//     super.run_phase(phase);
    my_seq_item trans ;
    
    forever begin 
      trans = my_seq_item::type_id::create ("trans");
      
      @(vintf.mon_cb )
            trans.w_a     = vintf.mon_cb.w_a;
            trans.r_b     = vintf.mon_cb.r_b;
            trans.w_data  = vintf.mon_cb.w_data;
            trans.w_addr  = vintf.mon_cb.w_addr;
            trans.r_addr  = vintf.mon_cb.r_addr;
            trans.r_data  = vintf.mon_cb.r_data;   
            ap.write(trans);
      `uvm_info("MONITOR", $sformatf("Monitored: %s", trans.show()), UVM_LOW)
    end 
  endtask 
  
endclass 
