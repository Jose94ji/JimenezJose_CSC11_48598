.text
.global main
main:
	
	mov r0, #101    /* a=101*/
	mov r1, #5      /* b=5 */
	mov r2, r0
	mov r3, #0
	
	cmp r2, r1
	
	blt
	subtract:
	add r2, #1
	sub r2, r2, r1
	cmp r2, r1
	
	bge subtract
	
	end:
	bx lr
	