`include "uvm_macros.svh"
import uvm_pkg::*;

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual iface viface;
  
  uvm_analysis_port #(seq_item) icp;
  seq_item trans;
  
   function new (string name, uvm_component parent);
    super.new(name, parent);
    trans = new();
    icp = new("icp", this);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual iface)::get(this,"","viface", viface)) begin
      `uvm_error(get_type_name(), "Couldn't retrieve driver virtual interface from config db")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    icp.write(trans);
  endtask
  
endclass