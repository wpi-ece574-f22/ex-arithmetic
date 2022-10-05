module sp(input wire as,
	  input wire 	    sync,
	  input wire 	    clk,
	  output wire [7:0] a);
  
   reg 	              [7:0] ra;
   
   always  @(posedge clk)
     ra <= {as, ra[7:1]};

   assign a  = sync ? ra : 8'b0;
     
  endmodule
