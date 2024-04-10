// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Initial setup: declare and set some pointers to 0
@0
D=A // set D as constant 0
@lastvalue
M=D // set lastvalue variable as 0

(MAINLOOP)
    @KBD
    D=M
    @lastvalue 
    D=D-M // check last keyboard value vs current
    @MAINLOOP 
    D;JEQ // if it's 0 nothing's changed - keep doing this loop 

// could give this section a name too
// we're here if something did change and we need to repaint
@KBD
D=M
@lastvalue 
M=D // update lastvalue to be this one 
(PAINT)
    @8192 // total iterations (32 words per row, 256 rows) (should be 8192)
    D=A
    @wordcountpointer
    M=D
    (PAINTMAGIC)
        @wordcountpointer
        M=M-1
        @SCREEN
        D=A
        @wordcountpointer
        A=D+M // make the current address D (screen base address) plus current wordcountpointer
        M=!M // make it other!
        @wordcountpointer
        D=M
        @PAINTMAGIC
        D;JGT // if wordcount pointer is above 0, keep looping!
@MAINLOOP
0;JMP
