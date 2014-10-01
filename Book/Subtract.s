.text
.global main
main:
	mov r2, #101    /* a=101*/
	mov r1, #5      /* b=5 */
	mov r3, #0
	mov r0, r2
	cmp r0, r1
	blt end
	subtract:
	add r3, #1
	sub r0, r2, r1
	cmp r0, r1
	bge subtract
	end:
	bx lr