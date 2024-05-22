module T (
   input clk, t, rst,
   output reg q
);

always @(posedge clk) begin
    case(t)
        1'b1 : q=~q;
        1'b0 : q=q;
    endcase
end

always @(posedge rst) begin
    q=0;
end

endmodule


