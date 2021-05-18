class map;
  
  local int a_array[string] = '{"apple" : 4,
                   				"car" : 9,
                   				"train" : 10};
  
  //For all functions
  //Successful operation - return 1
  //Failed operation - return 0
  
  //Create new element in the array
  function bit put(input string key, input int value);
    
    a_array[key] = value;
    
    if(a_array.exists(key)) begin
      return 1;
    end
    
    else return 0;
    
  endfunction
  
  //Print value from the array
  function int get(input string key);
    
    int flag = 0;
    
    foreach(a_array[el]) begin
      if(key == el) begin
        $display("key %s have value %d", el, a_array[key]);
        flag = 1;
        return a_array[key];
      end
    end
    
     if(!flag) begin  
       $display("Error");   
     end
    
  endfunction
  
  //Delete an element from the array 
  function bit delete(input string key);
  
    if(a_array.exists(key)) begin
    	a_array.delete(key);
      	return 1;
    end
    
    else return 0;
    
  endfunction
      
  //Prints values of the array    
  function print();
  
    foreach(a_array[key]) begin
      $display("key: %s      value: %d", key, a_array[key]);
    end
    
  endfunction
   
endclass
