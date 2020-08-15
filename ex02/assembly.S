	.globl assembly
assembly:
	// X0 = &a, X1 = &b, X2 = &c, X3 = &x
	LDUR X9,  [X0,#0] 	// LOAD a VALUE TO X9
	LDUR X10, [X1,#0]	// LOAD b VALUE TO X10
	LDUR X11, [X2,#0]	// LOAD c VALUE TO X11
	LDUR X12, [X3,#0]	// LOAD x VALUE TO X12
	ADD  X12, XZR, XZR	// x = 0
	SUBS XZR, X9, XZR
	B.LT L1				// a >= 0
	SUBS XZR, X10, #64
	B.GT L1				// b <= 64
	SUBS XZR, X11, #24
	B.LE L1 			// c > 24
	ADD X12, X12, #1
L1:
	STUR X12, [X3,#0]	// STORE x VALUE
	BR X30
