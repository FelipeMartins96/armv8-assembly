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
	// if char == nul break
	CMP   X13, XZR
	B.EQ  break
	// convert from ASCII
	SUB   X13, X13, #97
	// get letter count stack position
	ADD   X15, X12, X13
	LDURB W14, [X15, #0] // count at stack
	ADD   X14, X14, #1
	STURB W14, [X15, #0]
	ADD   X11, X11, #1
	B     sum_letters
	// move addresses to registers for sum_letters format
break:
	// check if already iterated over word
	CMP X12, X10
	B.EQ next
	MOV X11, X1		// count word letters
	MOV X12, X10
	B   sum_letters
// iterate over word letter count stack comparing with set counts
next:
	MOV X11, X9
	MOV X12, XZR // count max number of words using set letters
l1:
	MOV X15, XZR // count contained = 0
	// if end of stack data is reached exit
	CMP X10, X9
	B.EQ exit
	LDURB W14, [X10, #0] // letter count for word
	ADD   X10, X10, #1
	LDURB W13, [X11, #0] // letter count for set
	ADD   X11, X11, #1
	// if letter count for word is 0 skip letter
	CMP X14, XZR
	B.EQ l1
l2:
	SUB X13, X13, X14 // count set = count set - count word
	// if count subtracted >= 0, count_contained++ go to l3
	CMP X13, XZR
	B.GE l4
	// if count subtracted < 0
	// if count contained == 0, no word can be formed
	CMP X15, XZR
	B.EQ exit_0
	// if count max = 0, init with count contained
	CMP X12, XZR
	B.NE l3
	MOV X12, X15
	B    l1
// count of a letter contained on set greater than count of letter in word X15 times
l3:
	// if count contained > count max go to l1
	CMP X15, X12
	B.GE l1
	MOV X12, X15 // else count max = count contained
	B    l1
// count contained++
l4:
	ADD X15, X15, #1
	B   l2
// zero words can be formed
exit_0:
	MOV X0, XZR
	BR X30
exit:
	MOV X0, X12
	BR X30


