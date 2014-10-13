/* Jose Jimenez
Assignmnt 4
ASsembly */

.data

.balign 4				
message1: .asciz "The the answer is: %d"

.balign 4				/*Second Message*/
message2: .asciz "The remainder is: %d"

.balign 4
return: .word 0

.text

.global main
main:

divide:
	mov r2, #253			/*input a*/
	mov r3, #13	 			/*input b*/
	mov r4, #0 				
	mov r5, #0 				
	mov r6, #0 				/*scaler*/
	mov r7, #0 				
	mov r8, #10 			/*shift by 10/
	mov r9, #0 				
	mov r0, #0				
	mov r1, r2 				
	
compare:
	cmp r2, r3				
	bge scale				
	ble move		/*if less than input b branch to check_flag*/
	
scale:
	mov r6, #1 				/*present scale of 10^*/
	mul r7, r3, r6 			
	mul r9, r7, r8 			
	cmp r1, r9 				/*test to shift scale by 10*/
	blt subtract 			
	

subtract:
	add r0, r0, r6			/*Update counter*/
	sub r1, r1, r7			
	cmp r1, r7				
	bge subtract
	cmp r6, #1				/*compare to branch to scale*/
	bgt scale
	
move:  				
	mov r10, r0 			
	mov r11, r1 			
   
output:
	ldr r1, address_of_return 
	str lr, [r1] 			
	
	mov r1, r10 			
	ldr r0, address_of_message1 /*move message into r0*/
	bl printf 				/*call to print*/

	mov r1, r11 			/*move remainder to r1 to display*/
	ldr r0, address_of_message2 /*move message into r0*/
	bl printf 				/*call to print*/
	
	ldr lr, address_of_return
	ldr lr, [lr]
	bx lr

address_of_message1: .word message1
address_of_message2: .word message2
address_of_return: .word return

.global printf
.global scanf