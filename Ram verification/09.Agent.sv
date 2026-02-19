 


class my_agent extends uvm_agent ;
  `uvm_component_utils(my_agent)
  
  my_driver driver;
  my_monitor monitor;
  my_sequencer sequencer ;
  
  function new (string name = "my_agent", uvm_component parent);
    super.new(name , parent);
  endfunction 
  
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    driver = my_driver::type_id::create("driver", this );
    
    if(get_is_active() == UVM_ACTIVE)  begin 
      monitor = my_monitor ::type_id ::create ("monitor", this);
      sequencer = my_sequencer :: type_id :: create ("sequencer",this);
    end
  endfunction 
  
  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE ) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end 
  endfunction 
  
endclass 
    
    
  
