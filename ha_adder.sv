class inputdata;
  rand bit a,b;
  bit s;
  bit c;
  
  function void post_randomize();
    this.s = this.a ^ this.b;
    this.c = this.a & this.b;
    $display("---------------------------------------------");
    $display("a = %0b  b = %0b  s = %0b   c =  %0b",a,b,s,c);
    $display("---------------------------------------------");
  endfunction
endclass


module tb();
  inputdata i1 = new();
  initial begin
    for(int i =0;i < 10;i++) begin
    i1.randomize();
    end
  end
endmodule
