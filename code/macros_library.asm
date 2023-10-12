# Inputs: %x1 - start label of the array, %x2 - end label of the array
# Return value: the number of elements is stored in a1
.macro fill_array(%x1, %x2)
	mv t0 %x1 # Start label of the array
	mv t1 %x2 # End label of the array
	print_text(txt1)
	
	li t3 0 # For counting the number of entered elements
	
	fill:
		li a7 5
		ecall
		mv t2 a0
		beqz t2 fill_stoped # If the entered element is 0, stop input and go straight to summation
	
		sw t2 (t0) # Put the entered element into the array
		addi t0 t0 4
		addi t3 t3 1 # Increase the counter by 1 for the number of elements
		bltu t0 t1 fill
		j fill_stoped
	fill_stoped:
		mv a1 t3
.end_macro
	
# Inputs: %x1 - start label of the array, %x2 - number of elements
# No return value
.macro find_sum_and_print(%x1, %x2)
	mv t0 %x1 # Start label of the array
	mv t3 %x2 # Number of elements
			
	li t4 4
	mul t1 t3 t4 # Find out how many bytes are left until the end of the array
	add t1 t0 t1 # End label of the array, equal to the amount of memory occupied by the entered elements
	
	li t3 0 # For counting the summed elements in case of overflow
	li t4 0 # To store the sum
	
	li s1 2147483647 # Upper boundary value
	li s2 -2147483648 # Lower boundary value
	
	find_sum:
		lw t2 (t0)
	
		bgez t4 sum_more_than_zero
		bltz t4 sum_less_than_zero
	
		sum_more_than_zero:
			sub s3 s1 t4 # What is the remaining value before overflow?
			blt s3 t2 overflow_branch # If this value is smaller than the element, overflow will occur
	
			j everything_is_fine
		sum_less_than_zero:
			sub s3 s2 t4 # What is the remaining value before overflow?
			bgt s3 t2 overflow_branch # If this value is larger than the element, overflow will occur
	
			j everything_is_fine
	
		everything_is_fine:
			addi t3 t3 1
			add t4 t4 t2
			addi t0 t0 4
			bltu t0 t1 find_sum
	
	j good_branch
	
	good_branch:
		print_text(txt_good_branch)
	
		li a7 1
		mv a0 t4
		ecall
	
		j end
	overflow_branch:
		print_text(txt_overflow_error1)
	
		li a7 1
		mv a0 t4
		ecall
	
		print_text(txt_overflow_error2)
	
		li a7 1
		mv a0 t3
		ecall
	
		j end
	end:
.end_macro
	
.macro print_text(%x)
	la a0 %x
	li a7 4
	ecall
.end_macro