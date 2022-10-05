module sp(input wire as,
	  input wire 	    sync,
	  input wire 	    clk,
	  output wire [15:0] a);
  
   reg 	              [15:0] ra;
   
   always  @(posedge clk)
     ra <= {as, ra[15:1]};

   assign a  = sync ? ra : 8'b0;
     
  endmodule
