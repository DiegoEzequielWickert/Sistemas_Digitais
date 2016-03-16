// TRABALHO 02 //
//DIEGO EZEQUIEL WICKERT//
//MARCO 2016//
//trabalho para placa FPGA, fazer piscar led a cada 1 s//

module contador (input [7:0]CLOCK_50,output [7:0]h);
            reg [32:0]cont;
            reg h_reg = 0;
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

            assign h = h_reg;
endmodule

 module reset(input [7:0]rst_in, output [7:0]LEDG);
        reg [7:0]sinal;
        always@(rst_in)
               begin
    	        sinal = ~sinal;
               end
               assign LEDG = sinal;

endmodule


module test();
            reg [7:0]clk;

    	wire [7:0]linha1; // liga h -> reset
	contador P(clk, linha1);
	reset R(linha1,led);

            initial
                    begin
                        clk <= 1'b1;
                	$dumpvars(0, P,R);
                        $finish;
                   end

endmodule
