	.globl assembly
assembly:
	// X0 = &a, X1 = &b, X2 = &m
	LDUR X9,  [X0,#0] 	// LOAD a VALUE TO X9
	LDUR X10, [X1,#0]	// LOAD b VALUE TO X10
	LDUR X11, [X2,#0]	// LOAD m VALUE TO X11
	ADD  X11, X9, XZR	// m = a
	SUB  X12, X11,X10
	CBNZ X12, L1		// if b != 0 go to L1
	SUB  X11, X10, X9
	B	 L2				// skip L1
L1:
	SUB X11, X9, X10
L2:
	STUR X9,  [X0,#0]	// STORE a TO MEMORY
	STUR X10, [X1,#0]	// STORE b TO MEMORY
	STUR X11, [X2,#0]	// STORE m TO MEMORY
	BR	 X30
