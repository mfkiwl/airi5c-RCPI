`define N_EXT_INTS 24

`define ADDR_DEBUG_ROM 		1'b0
`define ADDR_IMEM		1'b1
`define ADDR_HART0_STATUS	`XPR_LEN'h00000144
`define ADDR_HART0_STACK	`XPR_LEN'h00000140
`define ADDR_HART0_POSTEXEC `XPR_LEN'h00000148




`define START_ADDRESS `XPR_LEN'h80000000
`define DEBUG_ADDRESS `XPR_LEN'h00000000

// Periphery Adress mappings
// 0xC0000000 - 0xCfffffff

`define PER_MASK	`HASTI_BUS_WIDTH'h40000000
