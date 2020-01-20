module TailLight_test;

reg LEFT,RIGHT,HAZ;

wire LC,LB,LA,RA,RB,RC;

reg clk;

TailLight UUT(clk,LEFT,RIGHT,HAZ,LC,LB,LA,RA,RB,RC);



always 
begin
    clk = 1'b1; 
    #5; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #5; // low for 20 * timescale = 20 ns
end

initial begin
HAZ=0;


LEFT=1;
RIGHT=0;


#100;

LEFT=0;
RIGHT=1;
HAZ=0;
#100;

LEFT=0;
RIGHT=0;
HAZ=1;
#100;

LEFT=1;
RIGHT=0;
HAZ=1;
#100;



end
endmodule 
