`include "map.sv"

module sv_map();
  
  initial begin

    map map = new;

    //prints array before editing
    map.print();

    //test
    map.put("truck", 11);
    map.get("apple");
    map.delete("train");

    //prints array after editing  
    map.print();
    
  end

endmodule
