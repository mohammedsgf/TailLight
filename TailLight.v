module TailLight(
input Clk_2Hz,
input LEFT,RIGHT,HAZ,
output LC,LB,LA,RA,RB,RC
);

reg [5:0] LEDR= 6'b111000;
reg [5:0] LEDL= 6'b000111;
reg isHAZ=0;

assign {LC,LB,LA}=LEDL[5:3];
assign {RA,RB,RC}=LEDR[2:0];


always @(posedge Clk_2Hz)
begin

	if(HAZ)
		begin//begin HAZ
			if(LEDL[5:3]&LEDR[2:0])
				begin
					LEDR <=6'b111000;
					LEDL <=6'b000111;
				end
			else
				begin
					isHAZ <= 1;
					LEDR <= 6'b000111;
					LEDL <= 6'b111000;
				end
		end//end HAZ
	else
		if(LEFT)
			begin//begin LEFT
				LEDR <= 6'b111000;
				if(LC & LB & LA)
					LEDL <= 6'b000111;
				else
					LEDL <= LEDL << 1;
			end//end LEFT	
		else if(RIGHT)
			begin//begin RIGHT
				LEDL <= 6'b000111;
				if(RA & RB & RC)
					LEDR <= 6'b111000;
				else
					LEDR <= LEDR >> 1;
			end//end RIGHT	
			
		//-------------------------------------------------	
				
			if(isHAZ) //HAZ OFF statment
				begin
				LEDL<=6'b000111;
				LEDR<=6'b111000;
				isHAZ<=0;
				end
			if(~RIGHT&~HAZ)//RIGHT OFF statment
				LEDR<=6'b111000;
			if(~LEFT&~HAZ)//LEFT OFF statment
				LEDL<=6'b000111;

end


endmodule 
