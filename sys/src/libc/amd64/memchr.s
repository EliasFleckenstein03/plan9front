TEXT	memchr(SB),$0

	MOVQ	n+16(FP), CX
	CMPQ	CX, $0
	JEQ	none
	MOVQ	RARG, DI
	MOVBLZX	c+8(FP), AX
	CLD
/*
 * SCASB is memchr instruction
 */

	REPN;	SCASB
	JEQ	found

none:
	MOVL	$0, AX
	RET

found:
	MOVQ	DI, AX
	SUBQ	$1, AX
	RET
