/*
    Action:
    1) Declares variable for storing randomized stimuli;
*/
class transaction;
    rand bit[7:0] A;
    rand bit[7:0] B;
    rand bit C_in;
    bit[7:0] Sum;
    bit C_out;
  	// to be used for displaying generator's or driver's transaction
	function void show_stats(string name);
      $display(" %s", name);
      $display(" A := %0d, B := %0d, C_in := %0d ",A,B,C_in);
      $display("  Sum : = %0d, C_out := %0d ",Sum,C_out);
    endfunction
endclass