// Code your testbench here
// or browse Examples
//Designer name : TEEKAM CHAND KHANDELWAL
//---------------------------------------------------------------------
module tb();
  mailbox mbox = new(2);
  //generator
  initial begin
    bit [7:0] data;
    bit [7:0] datab;
    data = $random;
    datab = $random;
    mbox.put(data);
    mbox.put(datab);
    $display("---------------------------");
    $display("Data we inserted into mailbox is %0d",data);
    $display("Data we inserted into mailbox is %0d",datab);
    $display("---------------------------");
    
  end
  
  //driver
  initial begin
   bit [7:0] data;
    bit [7:0] datab;
    bit [8:0] sum;
    mbox.get(data);
    mbox.get(datab);
    sum=data + datab;
    
        $display("---------------------------");
    $display("The Data received from mailbox is %0d",sum);
        $display("---------------------------");
  end  
endmodule
