`include "defines.v"
//pc指针模块
module pc_reg (
    input wire clk,
    input wire rst,
    output reg [`InstAddrBus] pc,       //要读取的指令地址
    output reg ce                        //指令存储器使能信号
);

always @(posedge clk) begin
    if (rst == `RstEnable) begin
        ce <= `ChipDisable;
    end
    else begin
        ce <= `ChipEnable;
    end
end

always @(posedge clk) begin
    if (ce == `ChipDisable) begin
        pc <= 32'h00000000;
    end
    else begin
        pc <= pc + 4'h4;               //字节寻址，每时钟周期加4，4字节32位，对应每条指令32位
    end
    
end
    
endmodule