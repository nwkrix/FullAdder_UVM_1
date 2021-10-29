`include "environment.svh"
program test(dut_if vif); 
    /*
    0) rececives the DUT interface & pass it to env
    1) Creates the environment, env
    2) Injects the stimuli
    3) Configure the TB
    */
    environment env;
    initial begin
        env = new(vif); 
        env.gen.n_times = 25; // number of transactions
        env.run();
    end
endprogram