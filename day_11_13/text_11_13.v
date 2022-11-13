module flow_led(
	input 					sys_clk , 	//系统时钟
	input 					sys_rst_n, 	//系统复位，低电平有效

	output 	reg 	[3:0] 	led 		//4个LED灯
	);
	
//parameter define
parameter WIDTH = 25 ;
parameter COUNT_MAX = 25_000_000; //板载50M时钟=20ns，0.5s/20ns=25000000，需要25bit
//位宽

//reg define
reg [WIDTH-1:0] counter ;
reg [1:0] led_ctrl_cnt;

//wire define
wire counter_en ;

//***********************************************************************************
//** main code
//***********************************************************************************

//计数到最大值时产生高电平使能信号
assign counter_en = (counter == (COUNT_MAX - 1'b1)) ? 1'b1 : 1'b0;

//用于产生0.5秒使能信号的计数器
always @(posedge sys_clk or negedge sys_rst_n) begin
	if (sys_rst_n == 1'b0)
		counter <= 1'b0;
	else if (counter_en)
		counter <= 1'b0;
	else
		counter <= counter + 1'b1;
end


//led流水控制计数器
always @(posedge sys_clk or negedge sys_rst_n) begin
	if (sys_rst_n == 1'b0)
		led_ctrl_cnt <= 2'b0;
	else if (counter_en)
		led_ctrl_cnt <= led_ctrl_cnt + 2'b1;
end

//通过控制IO口的高低电平实现发光二极管的亮灭
always @(posedge sys_clk or negedge sys_rst_n) begin
	if (sys_rst_n == 1'b0)
		led <= 4'b0;
	else begin
		case (led_ctrl_cnt)
			2'd0 : led <= 4'b0001;
			2'd1 : led <= 4'b0010;
			2'd2 : led <= 4'b0100;
			2'd3 : led <= 4'b1000;
			default : ;
		endcase
	end
end

endmodule
