	.globl assembly
assembly: // X0 = letter set as string X1 = word (all lower)
	// part 1 -> store in stack each letter count
	// enlarge stack for set letters count
	SUB SP, SP, #26		// 26 * 8 bits
	MOV X9, SP			// set letters count address
	// enlarge stack for word letters count
	SUB SP, SP, #26		// 26 * 8 bits
	MOV X10, SP			// word letters count address
	// move addresses to registers for sum_letters format
	MOV X11, X0
	MOV X12, X9
// sum letters from address X11 to stack at address X12
sum_letters:
	LDURB W13, [X11, #0]// load char at X11
	// if char == nul exit
	CMP   X13, XZR
	B.EQ  exit
	// convert from ASCII
	SUB   X13, X13, #97
	// get letter count stack position
	SUB   X15, X12, X13
	LDURB W14, [X15, #0] // count at stack
	ADD   X14, X14, #1
	STURB W14, [X15, #0]
	ADD   X11, X11, #1
	B     sum_letters
// move addresses to registers for sum_letters format
	MOV X11, X1		// count word letters
	MOV X12, X10
	B   sum_letters
exit:
	BR X30


