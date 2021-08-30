`include "defines.v"
//function:暂存取址阶段得到的指令和指令地址并且下一个时钟传递到译码部分
module if_id (
    input wire clk,
    input wire rst,
    input wire [`InstAddrBus] if_pc,
    input wire [`InstBus] if_inst,

    output reg [`InstAddrBus]   id_pc,
    output reg [`InstBus]   id_inst
);

always @(posedge clk) begin
    if (rst == `RstEnable) begin
        id_pc <= `ZeroWord;
        id_inst <= `ZeroWord;
    end
    else begin
        id_pc <= if_pc;
        id_inst <= if_inst;
    end
end
     
endmodule