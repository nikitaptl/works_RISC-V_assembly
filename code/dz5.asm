.include "macros_library.asm"
.data
	txt1: .asciz "Enter up to 10 numbers. Enter 0 to stop inputting:\n"
	txt2: .asciz "The number of entered elements is "
	txt_overflow_error1: .asciz "Overflow occurred. The sum is "
	txt_overflow_error2: .asciz ". The number of summed elements is "
	txt_good_branch: .asciz "The sum is "
	lb: .asciz "\n"
	.align 2
	arr: .space 40
	arrend:
.text
	la a0 arr # Start label of the array
	la a1 arrend # End label of the array
		
	fill_array(a0, a1) # Fill the array using a macro. The number of elements is stored in a1
	
	la a0 arr # Save the start label of the array to a0 again
	
	find_sum_and_print(a0, a1) # Find the sum and print it using the corresponding macro
	
	li a7 10
	ecall