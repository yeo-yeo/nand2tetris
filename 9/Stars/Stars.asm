@256
D=A
@SP
M=D
// C_CALL Sys.init 0
@return-1
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(return-1)
// C_FUNCTION StarGame.new 0
(StarGame.new)
// C_PUSH constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL Memory.alloc 1
@return-2
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.alloc
0;JMP
(return-2)
// C_POP pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP this 0
@THIS
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
// C_PUSH pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_RETURN
@LCL
D=M
@R13
M=D
@5
D=A
@R13
D=M-D
A=D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A+1
@SP
M=D
@R13
A=M-1
D=M
@THAT
M=D
@2
D=A
@R13
D=M-D
A=D
D=M
@THIS
M=D
@3
D=A
@R13
D=M-D
A=D
D=M
@ARG
M=D
@4
D=A
@R13
D=M-D
A=D
D=M
@LCL
M=D
@R14
A=M
0;JMP
// C_FUNCTION StarGame.dispose 0
(StarGame.dispose)
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
// C_POP pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// C_PUSH pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_CALL Memory.deAlloc 1
@return-3
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.deAlloc
0;JMP
(return-3)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_RETURN
@LCL
D=M
@R13
M=D
@5
D=A
@R13
D=M-D
A=D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A+1
@SP
M=D
@R13
A=M-1
D=M
@THAT
M=D
@2
D=A
@R13
D=M-D
A=D
D=M
@THIS
M=D
@3
D=A
@R13
D=M-D
A=D
D=M
@ARG
M=D
@4
D=A
@R13
D=M-D
A=D
D=M
@LCL
M=D
@R14
A=M
0;JMP
// C_FUNCTION StarGame.run 0
(StarGame.run)
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
// C_POP pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D
// C_PUSH constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.new 1
@return-4
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.new
0;JMP
(return-4)
// C_PUSH constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-5
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-5)
// C_PUSH constant 117
@117
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-6
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-6)
// C_PUSH constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-7
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-7)
// C_PUSH constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-8
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-8)
// C_PUSH constant 105
@105
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-9
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-9)
// C_PUSH constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-10
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-10)
// C_PUSH constant 103
@103
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-11
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-11)
// C_PUSH constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-12
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-12)
// C_PUSH constant 103
@103
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-13
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-13)
// C_PUSH constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-14
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-14)
// C_PUSH constant 109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-15
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-15)
// C_PUSH constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-16
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-16)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-17
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-17)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-18
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-18)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-19
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-19)
// C_CALL Output.printString 1
@return-20
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.printString
0;JMP
(return-20)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_RETURN
@LCL
D=M
@R13
M=D
@5
D=A
@R13
D=M-D
A=D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A+1
@SP
M=D
@R13
A=M-1
D=M
@THAT
M=D
@2
D=A
@R13
D=M-D
A=D
D=M
@THIS
M=D
@3
D=A
@R13
D=M-D
A=D
D=M
@ARG
M=D
@4
D=A
@R13
D=M-D
A=D
D=M
@LCL
M=D
@R14
A=M
0;JMP
// C_FUNCTION Main.main 1
(Main.main)
@SP
A=M
M=0
@SP
M=M+1
// C_PUSH constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.new 1
@return-21
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.new
0;JMP
(return-21)
// C_PUSH constant 83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-22
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-22)
// C_PUSH constant 116
@116
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-23
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-23)
// C_PUSH constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-24
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-24)
// C_PUSH constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-25
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-25)
// C_PUSH constant 116
@116
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-26
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-26)
// C_PUSH constant 105
@105
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-27
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-27)
// C_PUSH constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-28
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-28)
// C_PUSH constant 103
@103
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-29
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-29)
// C_PUSH constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-30
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-30)
// C_PUSH constant 117
@117
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-31
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-31)
// C_PUSH constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-32
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-32)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-33
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-33)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-34
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-34)
// C_PUSH constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_CALL String.appendChar 2
@return-35
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@7
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(return-35)
// C_CALL Output.printString 1
@return-36
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.printString
0;JMP
(return-36)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// C_CALL Output.println 0
@return-37
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.println
0;JMP
(return-37)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// C_CALL StarGame.new 0
@return-38
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@StarGame.new
0;JMP
(return-38)
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
// C_CALL StarGame.run 1
@return-39
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@StarGame.run
0;JMP
(return-39)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
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
// C_CALL StarGame.dispose 1
@return-40
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@6
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@StarGame.dispose
0;JMP
(return-40)
// C_POP temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// C_PUSH constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_RETURN
@LCL
D=M
@R13
M=D
@5
D=A
@R13
D=M-D
A=D
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
D=A+1
@SP
M=D
@R13
A=M-1
D=M
@THAT
M=D
@2
D=A
@R13
D=M-D
A=D
D=M
@THIS
M=D
@3
D=A
@R13
D=M-D
A=D
D=M
@ARG
M=D
@4
D=A
@R13
D=M-D
A=D
D=M
@LCL
M=D
@R14
A=M
0;JMP
