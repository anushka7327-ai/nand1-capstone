// Box.asm - Nand to Tetris Capstone, Part C
// Student: Sanchita Saroj
// Roll no: 2501730425
// K = 25

// Box starts at row 25
// Height = 20 rows
// Width = 32 pixels (2 words)
// Starting address = SCREEN + (32 * 25)

(LOOP)
    @KBD
    D=M
    @PRESSED
    D;JNE

    @color
    M=0

    @DRAW
    0;JMP

(PRESSED)
    @color
    M=-1

(DRAW)
    // Calculate starting address using SCREEN
    @SCREEN
    D=A
    @800
    D=D+A
    @addr
    M=D

    // Initialize row counter
    @20
    D=A
    @count
    M=D

(ROW)
    // Get drawing colour
    @color
    D=M

    // Draw first word
    @addr
    A=M
    M=D

    // Draw second word
    A=A+1
    M=D

    // Move to next screen row (32 words)
    @32
    D=A
    @addr
    M=D+M

    // Decrease row counter
    @count
    M=M-1
    D=M

    @ROW
    D;JGT

    @LOOP
    0;JMP
