/*
	Monitor & scoreboard in another directory  
*/
`include "test.svh"
module testbench();
  	dut_if vif(); // instantiate the design interface
    /*
        1) Connects to the DUT
    */  	
  	initial begin
      vif.clk <= 0;
      vif.reset <= 1;
      #5 vif.reset <= 0;
    end
    always #5 begin
      vif.clk <= ~vif.clk;
      //uvm_top.finish_on_completion = 1;
    end
  
  	FullAdder DUT(.dif(vif)); // instantiate the F. adder
  	test t(vif); // call the test program
  	initial begin
      $dumpfile("dump.vcd"); $dumpvars; // Wave form visualization
	end
endmodule