	.globl assembly
assembly: // Implement pseudo instruction NOT
	MOV X9, #-1			//X9 = 0xffffffffffffffff
	EOR X10, X11, X9	// X10 = NOT X11
	BR  X30
