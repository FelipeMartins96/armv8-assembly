	.globl assembly
assembly: // X0 = number as a string
	MOV   X9, X0		// move number address to X9
	MOV   X12, SP		// Save stack pointer start address
	MOV   X13, XZR		// X13 = 0, for final result
load_digit:
	LDURB W10, [X9, #0] // Loads a digit as char to register 10
	ADD   X9, X9, #1    // Move address to next digit
// break if digit == null (end of number)
	CMP   X10, XZR
	B.EQ  sum_results
	SUB   X10, X10, #48 // Convert ASCII value to digit value
	MOV   X11, #1		// factorial result X11 = 1
// X10 = digit, X11 = result
fact:
// if X10 == 0, save result
	CMP   X10, XZR
	B.EQ  add_to_stack
	MUL   X11, X11, X10	// result = digit * result
	SUB   X10, X10, #1	// digit = digit - 1
	B     fact
add_to_stack:
	SUB   SP, SP, #8	// add 64 bits to stack
	MOV   X14, SP		// STUR DIDNT WORK WITH USING SP DONT KNOW WHY
	STUR  X11, [X14, #0]// save digit! result (X11) to stack
	B     load_digit	// load next digit
sum_results:
// exit when SP is back to initial value
	CMP   SP, X12
	B.EQ  exit
// load result from stack and add to final result
	MOV   X14, SP		// SAME AS STUR WITH SP
	LDUR  X9, [X14, #0]
	ADD   X13, X13, X9
	ADD   SP, SP, #8	// shrink 64bit of SP
	B     sum_results
exit:
	MOV   X0, X13
	BR    X30
