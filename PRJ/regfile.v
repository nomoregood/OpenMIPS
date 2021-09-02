`include "defines.v"
//寄存器堆模块定义
//可以同时进行两个寄存器的读操作和一个寄存器的写操作
module regfile (
    input wire clk,
    input wire rst,

    input wire                  we,
    input wire [`RegAddrBus]    waddr,
    input wire [`RegBus]        wdata,

    input wire                  re1,
    input wire [`RegAddrBus]    raddr1,
    output reg [`RegBus]        rdata1,

    input wire                  re2,
    input wire [`RegAddrBus]    raddr2,
    output wire [`RegBus]       rdata2
);

reg [`RegBus]   regs[0:`RegNum-1];
//写操作
    always @(posedge clk) begin
        if (rst == `RstDisable) begin
            if ((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) begin
                regs[waddr] <= wdata;
            end
        end
    end

//读操作
    always @(*) begin
        if (rst == `RstEnable) begin
            rdata1 <= `ZeroWord;
        end
        else if (raddr1 == `RegNumLog2'h0) begin
            rdata1 <= `ZeroWord;                    //读寄存器$0，直接给0
        end
        else if ((raddr1 == waddr) && (we == `WriteEnable) && (re1 == `ReadEnable)) begin
            rdata1 <= wdata;                         //读写同地址，直接给写数据
        end
        else if (re1 == `ReadEnable) begin
            rdata1 <= regs[raddr1];       
        end
        else begin
            rdata1 <= `ZeroWord;
        end
    end

    always @(*) begin
        if (rst == `RstEnable) begin
            rdata2 <= `ZeroWord;
        end
        else if (raddr2 == `RegNumLog2'h0) begin
            rdata2 <= `ZeroWord;
        end
        else if ((raddr2 == waddr) && (we == `WriteEnable) && (re2 == `ReadEnable)) begin
            rdata2 <= wdata;
        end
        else if (re2 == `ReadEnable) begin
            rdata2 <= regs[raddr2];
        end
        else begin
            rdata2 <= `ZeroWord;
        end
    end
endmodule