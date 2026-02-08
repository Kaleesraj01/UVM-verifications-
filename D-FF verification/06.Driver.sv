class d_driver extends uvm_driver #(d_transaction);
  `uvm_component_utils(d_driver)
  
  virtual intf vintf;
  
  function new(string name = "d_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this, "","vintf",vintf ))
      `uvm_fatal("NO_vintf","virtual interface not found in driver")
      endfunction 
      
      task run_phase(uvm_phase phase);
         d_transaction trans ;
    repeat (5) begin 
      seq_item_port.get_next_item(trans);
      @(vintf.drv);
         vintf.rst <= trans.rst;
         vintf.d <= trans.d;
      
      `uvm_info("DRIVER", $sformatf("Driving: INPUT Reset = %0b | D = %0b", trans.rst, trans.d), UVM_LOW)
 
      seq_item_port.item_done();
    end 
    endtask 
    
    endclass 
