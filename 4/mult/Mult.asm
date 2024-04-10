// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// General plan: write a loop that runs RAM[0] times, adding RAM[1] each time
// to a working sum, which then gets output at RAM[2]
// Potential optimisation: do a comparison to see which is smaller out of RAM[0]
// and RAM[1] and choose that to be i and the other to be the amount to add each 
// time?

(SETUP) // Initialising i and working sum 
    @0 // load constant value 0 into A
    D=A // set D to A (0)
    @workingsum // initialise this variable with 0
    M=D
    @R0 // in case i is 0 to start with, skip loop
    D=M
    @SETOUTPUT
    D;JEQ 

(LOOP)
    @R1 
    D=M // put R1 into D
    @workingsum
    M=D+M // add D (R1) to the current working sum
    @R0
    M=M-1 // dec R[0] which is like our i and save back
    D=M // set D to new i
    @LOOP
    D;JGT // if i is >0, we need to loop again
    // NB you can also do like D-1;JGT which is jump if D-1 is greather than 0 - could have used that instead. would then need to save down D at the beginning of the loop so would need to think about that when setting up initial loop too.

// if we get here it should be because we finished looping
// which means we need to store sum into R2
(SETOUTPUT)
    @workingsum
    D=M
    @R2
    M=D
    @END
    0;JMP

// Funky infinite loop bit to stop someone sneakily exploiting our code
(END)
    @END
    0;JMP

// Things I encountered: new line gaps in labels end them - I did this by accident at first
// when I was just trying to space out my notes
// To make my code pass the clock time constraints of the tests I had to rewrite it to
// modify one of the inputs (instead of declaring a separate variable for i) - this feels
// kind of wrong to me on principle but I guess you want to be as efficient as 
// possible when writing machine code