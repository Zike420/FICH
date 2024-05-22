`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns //Define la unidad de tiempo

module Clk_D_tb();
    
    parameter DURATION = 10;

    reg clk, d;
    wire q;

    Clk_D UUT(
        .clk(clk),
        .d(d),
        .q(q)
        
    );

    always #5 clk = !clk;
    always #3 d = d + 1;


    initial begin
        
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, Clk_D_tb);

        #(DURATION) $display("Fin de la simulación.");  
        clk = 0;
        d=0;
        #100;      
        $finish;

    end

endmodule