module ps(input wire[7:0] a,
	  input wire  sync,
	  input wire  clk,
	  output wire as);

   reg [7:0] 	      ra;

   always @(posedge clk)
     if (sync)
       ra <= a;
     else
       ra <= {1'b0, ra[7:1]};

   assign as = ra[0];

endmodule
