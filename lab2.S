.global lab2
.syntax unified

#define DATA0 #4
#define DATA1 #5
#define DATA2 #9
#define DATA3 #5

// (a&b) >> + c!

lab2:
	push {lr}
	mov r0, DATA0
	mov r1, DATA1
	mov r2, DATA2
	mov r3, DATA3
	bl Calc
	pop {pc}

Calc:
	push {r4, r5, lr}
	mov r4, r0 //save DATA0
	rev r0, r0
	and r1, r2
	lsr r1, 1
	adds r0, r1
	//calculate factorial
	mov r5, r0
	mov r0, r4
	bl Factorial
	add r0, r5
	pop {r4, r5,pc}

Factorial:
	push {r4}
	mov r4, 3

	.fact_calc:
		mul r4, r0
		subs r0, #1
		bne .fact_calc
	mov r0, r4
	pop {r4}
	bx lr
