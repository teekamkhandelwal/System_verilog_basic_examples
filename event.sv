// Code your testbench here
// or browse Examples
module tb;
  initial begin
    event eventa;
    fork
      begin
      #5 $display("Waiting for event to trigger");
      -> eventa; // This is how you trigger event
      end
      
      begin
        @(eventa) // This is how you wait for event to happen
        $display("--------------------------------");
        $display("Event A triggered at %0t",$time);
        $display("--------------------------------");     
        end  
    join
    
  end
  endmodule
