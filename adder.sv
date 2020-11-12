// Code your testbench here
// or browse Examples
class adder;
  randc bit [2:0] a;
  randc bit [1:0] b;
  randc bit [2:0] c;
  bit [3:0] s;
  constraint aa { a > 4;};
  constraint bb { b<2;};
  constraint cd {c inside{2,4,8};};
  function add ();
    this.s=this.a+this.b+this.c;
  endfunction
endclass
module tb;
  adder a1=new();
  initial begin
    repeat(5) begin
    a1.randomize();
     a1.add();
      $display("---------------------------------");
      $display("a=%d b=%d c=%d s=%d",a1.a,a1.b,a1.c,a1.s);
      $display("---------------------------------------");
    end
  end
endmodule
  
  
    
