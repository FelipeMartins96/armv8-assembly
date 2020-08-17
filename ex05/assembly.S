	.globl assembly
assembly: // Implement instruction RPT X12, loop [CB format]
loop:
	CMP  X12, XZR
	B.LE exit			// if NOT (X12 > 0) exit
	SUB  X12, X12, #1	// if (X12 > 0) X12-- and loop
	B    loop
exit:
	BR  X30
