// TRABALHO 01 //
//DIEGO EZEQUIEL WICKERT//
//MARCO 2017//
//trabalho para placa FPGA, fazer piscar led a cada 1 s//

module Leds(input CLOCK_50,output [0:0]LEDG);
	reg [32:0]cont = 0;
	reg h_reg = 0;
	assign LEDG[0] = ~h_reg;
	always@(posedge CLOCK_50)
			begin
			  if(cont == 50000000)
					begin
						h_reg <= ~h_reg;
						cont <= 0;
					 end
				else
					 begin
						cont = cont + 1;
					 end
			end          
endmodule
