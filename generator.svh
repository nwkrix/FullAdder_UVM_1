/*
    Action:
    1) This class randomizes the transaction class;
    2) It forwards the randomized data to the driver
*/
class generator;
    rand transaction trans;
    mailbox mbx;
    int n_times;
    function new(mailbox mbx);
    /*gets mbx from the environment*/ 
        this.mbx = mbx;
    endfunction
  
    event ends_here; /* for termination of randomization task*/
  
    task randomizeTrans();
        repeat(n_times) begin
          trans = new();
          if(!trans.randomize()) begin
			$fatal("Transaction randomization failed");
          end
          trans.show_stats(" [GENERATOR] ");
          mbx.put(trans);
        end
        ->ends_here;
    endtask
endclass