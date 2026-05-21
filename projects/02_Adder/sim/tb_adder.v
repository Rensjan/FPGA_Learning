`timescale 1ns/1ps

module tb_adder;

reg clk;
reg [7:0] a, b;
wire [8:0] sum;

adder dut (.a(a), .b(b), .sum(sum));

always #5 clk = ~clk;

initial begin
    clk = 0;
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_adder);   // IMPORTANT: full hierarchy

    a = 0; b = 0; #10

    $display("%d + %d = %d", a, b, sum);

    a = 10; b = 5; #10
    $display("%d + %d = %d", a, b, sum);

    a = 100; b = 200; #10
    $display("%d + %d = %d", a, b, sum);
  #100
    $finish;
end

endmodule