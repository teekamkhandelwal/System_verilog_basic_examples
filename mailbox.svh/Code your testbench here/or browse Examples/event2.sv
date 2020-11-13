// Code your testbench here
// or browse Examples
//TEEKAM CHAND KHANDELWAL
/////////Transaction common to Generator , Driver, Monitor and Scoreboard
 
class transaction;
  rand bit [3:0] data;
  
endclass 
////////////////////End of Transaction //////////////////////  
 
//////////////////////Generator Class///////////////////
class generator;
  int loop =0;
  transaction trans;
  mailbox mbx;
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    for(int loop = 0; loop< 10;loop++) begin
    trans = new();
    trans.randomize();
    mbx.put(trans);
    $display("---------------------------------");  
    $display("Stimulus Generation Successfully");
    $display("Data inserted into Mailbox %0d",trans.data);
    #5;
    end
  endtask
 
endclass  
////////////////////////////////////////////////////////////
///////////////Driver Class ///////////////////////////////
class driver;
  transaction trans = new();
  mailbox mbx;
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    repeat(10) begin
    trans = new();
    mbx.get(trans);
    $display("Reception Successful");
    $display("Value received : %0d", trans.data);
      $display("---------------------------------");
    end
  endtask
endclass 
 
/////////////////////////////////////////////////////////////
////////////////////// Testbench/////////////////////////////
 
 
 
module tb;
  mailbox mbx = new();
  generator gen = new(mbx);
  driver drv = new(mbx);
  
  initial begin 
    fork
    gen.run();
    drv.run(); 
    join
 
    end
 
endmodule
 
////////////End of Testbench ////////////////////
