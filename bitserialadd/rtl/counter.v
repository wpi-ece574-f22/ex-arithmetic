module counter(
	       input wire 	  clk,
	       input wire 	  reset, 
	       output wire [31:0] q);
   
   reg [31:0] 			  areg;
   reg [31:0] 			  areg_next;
   
   always @(posedge clk, posedge reset)
     if (reset)
          areg  <= 32'b0;
     else
          areg  <= areg_next;
   
   always @(*)
     areg_next = areg + 32'b1;
   
   assign q = areg;
   
endmodule
