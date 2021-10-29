class driver;
    virtual dut_if vif; // for connecting driver to DUT
    mailbox mbx; // for receiving mbx from generator
    function new (virtual dut_if vif, mailbox mbx);
        this.vif = vif;
        this.mbx = mbx;
    endfunction
    task initialize_interface();
        $display(" --- Resetting --- ");
      	wait(vif.reset); // while reset is high
        vif.A <= 0;
        vif.B <= 0;
        vif.C_in <= 0;
        wait(!vif.reset);
        $display(" --- Reset --- ");
    endtask
  
    int pktCounts = 0;
  
  	// sen
    task transPkt_to_duf_if();
        forever begin
            transaction trans;
            mbx.get(trans);
            @(posedge vif.clk) begin
                vif.A <= trans.A;
                vif.B <= trans.B;
            end
          	@(posedge vif.clk) begin
                trans.Sum = vif.Sum;
                trans.C_out = vif.C_out;
            end
          	@(posedge vif.clk) begin
              trans.show_stats(" [DRIVER] ");
                pktCounts++;
            end
        end
    endtask
endclass