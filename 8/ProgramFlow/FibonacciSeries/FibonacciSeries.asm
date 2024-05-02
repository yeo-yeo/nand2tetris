// C_PUSH argument 1
@ARG
D=M
@1
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP that 0
@THAT
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
// C_PUSH constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP that 1
@THAT
D=M
@1
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
// C_PUSH constant 2
@2
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
// C_IF COMPUTE_ELEMENT
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JGT
// C_GOTO END
@END
0;JMP
// C_LABEL COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// C_PUSH that 0
@THAT
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH that 1
@THAT
D=M
@1
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
// C_POP that 2
@THAT
D=M
@2
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
// C_PUSH pointer 1
@THAT
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
// C_POP pointer 1
@SP
M=M-1
A=M
D=M
@THAT
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
// C_GOTO LOOP
@LOOP
0;JMP
// C_LABEL END
(END)
