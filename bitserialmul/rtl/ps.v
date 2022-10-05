module ps(input wire[15:0] a,
	  input wire  sync,
	  input wire  clk,
	  output wire as);

   reg [15:0] 	      ra;

   always @(posedge clk)
     if (sync)
       ra <= a;
     else
       ra <= {1'b0, ra[15:1]};

   assign as = ra[0];

endmodule
