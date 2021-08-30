//***********全局宏定义***********************//
`define RstEnable                   1'b1
`define RstDisable                  1'b0
`define ZeroWord                    32'h00000000
`define WriteEnable                 1'b1              
`define WriteDisable                1'b0
`define ReadEnable                  1'b1
`define ReadDisable                 1'b0
`define AluOpBus                    7:0          //ALUop_o 的宽度
`define AluSelBus                   2:0            
`define InstValid                   1'b0        //指令有效
`define InstInvaild                 1'b1
`define True_v                      1'b1        //逻辑真
`define False_v                     1'b0        //逻辑假
`define ChipEnable                  1'b1
`define ChipDisable                 1'b0


//============具体指令相关宏定义==================//
`define EXE_ORI                     6'b001101
`defien EXE_NOP                     6'b000000

`define EXE_OR_OP                   8'b00100101
`define EXE_NOP_OP                  8'b00000000

`define EXE_RES_LOGIC               3'b001
`define EXE_RES_NOP                 3'b000


//=================指令存储器ROM相关宏定义==============//
`define InstAddrBus                 31:0          //ROM地址总线宽度
`define InstBus                     31:0          //ROM数据总线宽度

`define InstMemNum                  131071         //实际大小128KB
`define InstMemNumLog2              17              




