module acende(input clock, output led);
    assign  led  = clock;
endmodule

module teste(output v);
    reg clock;
    always #1 clock <= ~clock;
    wire led;
    acende V(clock,led);

    initial begin
        $dumpvars(0, V);
        #1
        clock <=0;
        #20
        $finish;
    end
endmodule
