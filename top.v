module top(
input LEFT,RIGHT,HAZ,
input reset,
input Clk_50MHz,
output [9:0] LED
);

wire Clk_2Hz;

assign LED={4'b0000,LC,LB,LA,RA,RB,RC};

TailLight(Clk_2Hz,LEFT,RIGHT,HAZ,LC,LB,LA,RA,RB,RC);
Clock_divider(Clk_50MHz,Clk_2Hz,~reset);



endmodule 
