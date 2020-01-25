module Clock_divider(
	input inClock,
	output reg outClock,
	input reset
);
	
	parameter IN_CLOCK  = 50000000; // 50 MHz
	parameter OUT_CLOCK = 4; 		// 4 Hz; to have 0.25s pulses

	parameter COUNT_MAX   = (IN_CLOCK / OUT_CLOCK)/2;  // Half period
	parameter CLOCK_WIDTH = $clog2(IN_CLOCK / OUT_CLOCK); 
	
	
	reg [CLOCK_WIDTH:0] counter;
	
	
	always @(posedge inClock, posedge reset)
		if(reset) begin
			counter <= 0;
			outClock <= 0;
		end
		else begin
			if(counter == COUNT_MAX) begin
				outClock = ~outClock;
				counter <= 0;
			end
			else 
				counter <= counter + 1;
		end

endmodule
