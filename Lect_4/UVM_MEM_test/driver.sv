`include "uvm_macros.svh"
import uvm_pkg::*;

class simple_driver extends uvm_driver #(seq_item);
  `uvm_component_utils(simple_driver)
  
  virtual iface viface;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual iface)::get(this,"","viface", viface)) begin
      `uvm_error(get_type_name(), "Couldn't retrieve driver virtual interface from config db")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(item)
      run();
      seq_item_port.item_done();
    end
    
  endtask
  
  virtual task run();
    viface.valid = 0;
    
    @(posedge viface.clk)
    	viface.valid = item.valid;
    	
  endtask
  
endclass