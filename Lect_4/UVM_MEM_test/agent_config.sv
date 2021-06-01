`include "uvm_macros.svh"
import uvm_pkg::*;

class agent_config extends uvm_object;
  `uvm_object_utils(agent_config)
  virtual iface viface;
  
  function new(string name = "agent_config");
    super.new(name);
  endfunction
  
  uvm_active_passive_enum_is_active = UVM_ACTIVE;
  
endclass