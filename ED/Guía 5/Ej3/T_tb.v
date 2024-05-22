`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns //Define la unidad de tiempo

module T_tb();
    
    parameter DURATION = 10;

    reg clk, t, rst;
    wire q;

    T UUT(
        .clk(clk),
        .rst(rst),
        .t(t),
        .q(q)
        
    );

    always #5 clk = !clk;
    always #3 t = t + 1;


    initial begin
        
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, T_tb);

        #(DURATION) $display("Fin de la simulación.");  
        clk = 0;
        rst = 1;
        t=0;
        #100;      
        $finish;

    end

endmodule