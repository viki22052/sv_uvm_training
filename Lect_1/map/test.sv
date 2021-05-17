`include "map.sv"

module sv_map();
  
  
  initial begin

    map map = new;

    map.a_array = '{"apple" : 4,
                   "car" : 9,
                   "train" : 10};

    //prints array before editing
    foreach(map.a_array[key]) begin

      $display("key: %s      value: %d", key, map.a_array[key]);

    end

    map.put("truck", 11);

    map.get("apple");

    map.delete("train");


    //prints array after editing  
    foreach(map.a_array[key]) begin

      $display("key: %s      value: %d", key, map.a_array[key]);

    end


  end

endmodule