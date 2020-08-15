	.globl assembly
assembly:
	LDUR X10, [X0, #0]	// load X10 value
	LDUR X11, [X1, #0]	// load X11 value
	ADD X12, XZR, XZR	// X12 = 0
	MOV X12, #63		// X12 as a 1 value 6 bit mask
	LSL X13, X12, #11	// X13 = 6 bit mask at bits 11-16
	AND X13, X13, X10	// X13 = bits 11-16 of X10
	LSL X12, X12, #26	// X12 = 6 bit mask at bits 26-31
	EOR X11, X11, X12	// set X11 bits 26-31 to value 0
	LSL X13, X13, #15	// move bits from positions 11-16 to 26-31
	ORR X11, X11, X13	// substitutes X11 bits 26-31 with X10 bits 11-16
	BR  X30
