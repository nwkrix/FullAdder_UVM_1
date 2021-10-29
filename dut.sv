interface dut_if;
  /* Since the FA is a combinational circuit, the clk interface 
  	is only used in the driver class to time the reception of the 
    transaction packets, calculation of sums and carries
  */
    logic       clk; 
    logic       reset;
    logic [7:0] A;
    logic [7:0] B;
    logic  		C_in;
    logic [7:0] Sum;
    logic 		C_out;
endinterface

module FullAdder(
    dut_if dif
);
  always @(dif.A,dif.B,dif.C_in) begin
        if(dif.reset) begin
            dif.Sum <= 8'b00000000;
            dif.C_out <= 1'b0;
        end else begin
          {dif.C_out,dif.Sum} <= dif.A + dif.B + dif.C_in;
        end
    end
endmodule