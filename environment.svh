`include "transaction.svh"
`include "generator.svh"
`include "driver.svh"
class environment;
    generator gen;
    driver drive;
    mailbox mbx;
    virtual dut_if vif;
  
    function new (virtual dut_if vif);
      this.vif = vif;
      mbx = new();
      gen = new(mbx);
      drive = new(this.vif,mbx);
    endfunction
  
    task initialize_driver();
        drive.initialize_interface();
    endtask
  
    task main();
        fork
            gen.randomizeTrans();
            drive.transPkt_to_duf_if();
        join_any // NOTE: using only 'join' causes the clk to outrun the transactions packets
    endtask
  
    task done();
        wait(gen.ends_here.triggered);
        wait(gen.n_times == drive.pktCounts);
    endtask
    task run(); // to be called from test program
        initialize_driver();
        main();
        done();
        $finish;
    endtask
endclass