	.globl assembly
assembly: // X0 = player1 string address, X1 = player2 string address
	MOV   X9, XZR		// player index = 0
	MOV   X10, XZR      // player score = 0
	MOV   X11, X0		// X11 = player1 string address
	B     loopinit
loop:
	ADD   X11, X11, #1
loopinit:
	LDURB W12, [X11, #0]// Loads a char to register 12
	CMP   W12, #65		// char == 'A'
	B.EQ  group1
	CMP   W12, #66		// char == 'B'
	B.EQ  group3
	CMP   W12, #67		// char == 'C'
	B.EQ  group3
	CMP   W12, #68		// char == 'D'
	B.EQ  group2
	CMP   W12, #69		// char == 'E'
	B.EQ  group1
	CMP   W12, #70		// char == 'F'
	B.EQ  group4
	CMP   W12, #71		// char == 'G'
	B.EQ  group2
	CMP   W12, #72		// char == 'H'
	B.EQ  group4
	CMP   W12, #73		// char == 'I'
	B.EQ  group1
	CMP   W12, #74		// char == 'J'
	B.EQ  group8
	CMP   W12, #75		// char == 'K'
	B.EQ  group5
	CMP   W12, #76		// char == 'L'
	B.EQ  group8
	CMP   W12, #77		// char == 'M'
	B.EQ  group3
	CMP   W12, #78		// char == 'N'
	B.EQ  group1
	CMP   W12, #79		// char == 'O'
	B.EQ  group1
	CMP   W12, #80		// char == 'P'
	B.EQ  group3
	CMP   W12, #81		// char == 'Q'
	B.EQ  group10
	CMP   W12, #82		// char == 'R'
	B.EQ  group1
	CMP   W12, #83		// char == 'S'
	B.EQ  group1
	CMP   W12, #84		// char == 'T'
	B.EQ  group2
	CMP   W12, #85		// char == 'U'
	B.EQ  group1
	CMP   W12, #86		// char == 'V'
	B.EQ  group4
	CMP   W12, #87		// char == 'W'
	B.EQ  group4
	CMP   W12, #88		// char == 'X'
	B.EQ  group8
	CMP   W12, #89		// char == 'Y'
	B.EQ  group4
	CMP   W12, #90		// char == 'Z'
	B.EQ  group10
	CMP   W12, #0		// char == 'null'
	B     end			// non conditional here to handle (badly) out o range chars
group1:
	ADD   X10, X10, #1
	B     loop
group2:
	ADD   X10, X10, #2
	B     loop
group3:
	ADD   X10, X10, #3
	B     loop
group4:
	ADD   X10, X10, #4
	B     loop
group5:
	ADD   X10, X10, #5
	B     loop
group8:
	ADD   X10, X10, #8
	B     loop
group10:
	ADD   X10, X10, #10
	B     loop
end:
	CMP   X9, #1		// player index == 1 (player2)
	B.EQ  exit
	MOV   X13, X10		// move player1 score to X13
	ADD   X9, X9, #1	// player index = 1
	MOV   X10, XZR		// player2 score = 0
	MOV   X11, X1		// X11 = player2 string address
	B     loopinit
exit:
	CMP   X13, X10
	MOV   X0, #69		// return 'E' if draw
	B.GT  p1win
	B.LT  p2win
	B     return
p1win:
	MOV   X0, #65
	B     return
p2win:
	MOV   X0, #66
return:
	BR    X30


