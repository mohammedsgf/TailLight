module TailLight(
input Clk_2Hz,
input reset,
input LEFT,RIGHT,HAZ,
output LC,LB,LA,RA,RB,RC
);

reg [8:0] LED= 9'b000111000;

assign {LC,LB,LA}=LED[8:6];
assign {RA,RB,RC}=LED[2:0];


always @(posedge Clk_2Hz, posedge reset)
begin

	if(reset)
		LED<=9'b000111000;
	else
		begin//begin else
			if(HAZ)
				if(LED==9'b111111111)
					LED<=9'b000111000;
				else
					LED<=9'b111111111;
			else
				begin//haz else begin
				if(LEFT)
					if(LC&LB&LA)
						LED<=9'b000111000;
					else
						LED<=LED<<1;
				else if(RIGHT)
					if(RA&RB&RC)
							LED<=9'b000111000;
						else
							LED<=LED>>1;
							
				end//haz else end
				
		end//end else

end


endmodule 