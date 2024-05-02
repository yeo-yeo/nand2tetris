// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP local 0
@LCL
D=M
@0
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// C_LABEL LOOP
(LOOP)
// C_PUSH argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH local 0
@LCL
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@SP
A=M
A=A-1
M=M+D
// C_POP local 0	
@LCL
D=M
@0	
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// C_PUSH argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@SP
A=M-1
M=M-D
// C_POP argument 0
@ARG
D=M
@0
D=A+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// C_PUSH argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_IF LOOP
@SP
M=M-1
A=M
D=M
@LOOP
D;JGT
// C_PUSH local 0
@LCL
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
