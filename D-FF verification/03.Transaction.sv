class d_transaction  extends uvm_sequence_item ;
  
  `uvm_object_utils(d_transaction)
  
  rand bit d;
  rand bit rst;
  bit q;
  
  function new (string name = "d_transaction");
    super.new(name);
  endfunction
  
  function string show ();
    return $sformatf ( "input =>  rst=%0d , d=%0d output=> q=%0d " rst , d , q );
  endfunction 
  
endclass 
