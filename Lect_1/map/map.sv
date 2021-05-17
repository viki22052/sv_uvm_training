class map;
  
  int a_array[string];
  
  
  
  function bit put(input string key, input int value);
    
    a_array[key] = value;
    
  endfunction
  
  function int get(input string key);
    
    int flag = 0;
    
    foreach(a_array[el]) begin
      
      if(key == el) begin
        
        $display("key %s have value %d", el, a_array[key]);
        flag = 1;
        
      end
      
    end
    
    
     if(!flag) begin
        
       $display("Error");
        
        
     end
    
    
  endfunction
  
  function bit delete(input string key);
  
    a_array.delete(key);
    
    
  endfunction
  
  
endclass
  
  
  