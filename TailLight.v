//--------------------------------------------------------
//--------------Thunderbird Tail Light--------------------
//Date:2020-Jan-25----------------------------------------
//Version 1.0---------------------------------------------
//Author: Mohammed A. Alsaggaf----------------------------

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
			
			isHAZ <= 1;
			LEDR <= 6'b000111;
			LEDL <= 6'b111000;
				
		end//end HAZ
	else
		if(LEFT & ~RIGHT)
			begin//begin LEFT
				LEDR <= 6'b111000;
				if(LC & LB & LA)
					LEDL <= 6'b000111;
				else
					LEDL <= LEDL << 1;
			end//end LEFT	
		else if(RIGHT & ~LEFT)
			begin//begin RIGHT
				LEDL <= 6'b000111;
				if(RA & RB & RC)
					LEDR <= 6'b111000;
				else
					LEDR <= LEDR >> 1;
			end//end RIGHT	
			
		//-------------------------------------------------	
				
			if(isHAZ) //HAZ OFF statment whenever HAZ is 0
				begin	//THis statment will force the LEDs to be off in the next cycle because of the non blocking assignmnet which cause the flashing state
				LEDL<=6'b000111;
				LEDR<=6'b111000;
				isHAZ<=0;
				end
			if(~RIGHT&~HAZ | RIGHT&LEFT)//RIGHT OFF statment whenever RIGHT is 0
				LEDR<=6'b111000;
			if(~LEFT&~HAZ | RIGHT&LEFT)//LEFT OFF statment whenever LEFT is 0
				LEDL<=6'b000111;

end


endmodule 
