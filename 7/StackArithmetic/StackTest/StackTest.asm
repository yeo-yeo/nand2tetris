// C_PUSH constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-1
D;JEQ
@SP
A=M-1
M=0
@CONTINUE-2
0;JMP
(SET_TRUE-1)
@SP
A=M-1
M=-1
(CONTINUE-2)
// C_PUSH constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-3
D;JEQ
@SP
A=M-1
M=0
@CONTINUE-4
0;JMP
(SET_TRUE-3)
@SP
A=M-1
M=-1
(CONTINUE-4)
// C_PUSH constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-5
D;JEQ
@SP
A=M-1
M=0
@CONTINUE-6
0;JMP
(SET_TRUE-5)
@SP
A=M-1
M=-1
(CONTINUE-6)
// C_PUSH constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-7
D;JLT
@SP
A=M-1
M=0
@CONTINUE-8
0;JMP
(SET_TRUE-7)
@SP
A=M-1
M=-1
(CONTINUE-8)
// C_PUSH constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-9
D;JLT
@SP
A=M-1
M=0
@CONTINUE-10
0;JMP
(SET_TRUE-9)
@SP
A=M-1
M=-1
(CONTINUE-10)
// C_PUSH constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-11
D;JLT
@SP
A=M-1
M=0
@CONTINUE-12
0;JMP
(SET_TRUE-11)
@SP
A=M-1
M=-1
(CONTINUE-12)
// C_PUSH constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-13
D;JGT
@SP
A=M-1
M=0
@CONTINUE-14
0;JMP
(SET_TRUE-13)
@SP
A=M-1
M=-1
(CONTINUE-14)
// C_PUSH constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-15
D;JGT
@SP
A=M-1
M=0
@CONTINUE-16
0;JMP
(SET_TRUE-15)
@SP
A=M-1
M=-1
(CONTINUE-16)
// C_PUSH constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
A=M-1
D=M-D
@SET_TRUE-17
D;JGT
@SP
A=M-1
M=0
@CONTINUE-18
0;JMP
(SET_TRUE-17)
@SP
A=M-1
M=-1
(CONTINUE-18)
// C_PUSH constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 53
@53
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
// C_PUSH constant 112
@112
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
// neg
@SP
A=M-1
M=-M
// and
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=D&M
// C_PUSH constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
A=M-1
M=D|M
// not
@SP
A=M-1
M=!M