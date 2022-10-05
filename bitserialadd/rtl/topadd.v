module topadd(input wire [7:0] a,
	      input wire [7:0] 	b,
	      input wire [7:0] 	c,
	      input wire [7:0] 	d,
	      output wire [7:0] q,
	      input wire 	clk,
	      input wire 	rst);

   reg [7:0] 			ctl;

   wire 			ctl0, ctl1, ctl2, ctl3;
   
   always @(posedge clk)
     if (rst)
       ctl <= 8'b1;
     else
       ctl <= {ctl[6:0], ctl[7]};

   assign ctl0 = ctl[0];
   assign ctl1 = ctl[1];
   assign ctl2 = ctl[2];
   assign ctl3 = ctl[3];
   
   wire 			as, bs, cs, ds, abs, cds, sums;
   
   ps ps1(a, ctl0, clk, as);
   ps ps2(b, ctl0, clk, bs);
   ps ps3(c, ctl0, clk, cs);
   ps ps4(d, ctl0, clk, ds);

   serialadd a1(as, bs, abs, ctl1, clk);
   serialadd a2(cs, ds, cds, ctl1, clk);

   serialadd a3(abs, cds, sums, ctl2, clk);
   
   sp sp1(sums, ctl3, clk, q);
   
endmodule
