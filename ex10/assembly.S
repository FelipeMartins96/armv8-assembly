	.globl assembly
assembly: // X0 = number as a string, X1 base as a long long int
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
	B.EQ  check_factorion
// load result from stack and add to final result
	MOV   X14, SP		// SAME AS STUR WITH SP
	LDUR  X9, [X14, #0]
	ADD   X13, X13, X9
	ADD   SP, SP, #8	// shrink 64bit of SP
	B     sum_results
check_factorion:
// Start by converting number as a string to long long int
	MOV   X9, X13		// move factorion result to X9
	MOV   X10, X0		// X10 = number string address
	LDUR  X11, [X1, #0]	// X11 = base
	MOV   X13, XZR		// number = 0
l1:
	LDURB W12, [X10, #0]// load number digit to X12
	ADD   X10, X10, #1	// move memory address to next digit
	// check if char == null
	CMP   X12, XZR
	B.EQ  exit
	SUB   X12, X12, #48 // Convert ASCII value to digit value
	MUL   X13, X13, X11	// mull number * base
	ADD   X13, X13, X12	// add digit to number
	B     l1
// check if factorial of digits is equal number
exit:
	MOV   X0, #1
// check if number == factorion
	CMP   X13, X9
	B.EQ  factorion
	// if not equal return 0
	MOV   X0, XZR
factorion:
	BR    X30
