`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(seq_item)
  
  function new(string name = "seq_item");
  	super.new(name);
  endfunction: new

  
  rand bit valid;
  bit full;
  
endclass