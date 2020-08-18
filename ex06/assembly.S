	.globl assembly
assembly: // counts number of vowels on a string, X0 = string address
	MOV   X9, X0
	MOV   X18, XZR		// using X11 as vowel count, X11 = 0
loop:
	LDURB W10, [X9, #0] // Loads a char to register 10
	CMP   W10, #65
	B.EQ  vowel			// Branch if char is 'A'
	CMP   W10, #69
	B.EQ  vowel			// Branch if char is 'E'
	CMP   W10, #73
	B.EQ  vowel			// Branch if char is 'I'
	CMP   W10, #79
	B.EQ  vowel			// Branch if char is 'O'
	CMP   W10, #85
	B.EQ  vowel			// Branch if char is 'U'
	CMP   W10, #0
	B.EQ  exit			// Branch if char is 'null'
	B     notvowel
vowel:
	ADD   X18, X18, #1	// add 1 to vowel count
notvowel:
	ADD   X9, X9, #1	// change memory address to next char
	B     loop
exit:
	MOV X0, X18			// return vowel count
	BR  X30
