.macro input_n # Input number of elements macro
	    li a7 5 # Input the number of elements
	    ecall
	
	    li t0 2
	    blt a0 t0 incorrect_input # If it's less than 2, it's incorrect input (since the minimum number of elements in the array is 2)
	
	    li t0 10
	    bgt a0 t0 incorrect_input # If it's greater than 10, it's incorrect input
	    j correct_input
	
	    incorrect_input: # Incorrect input branch and program exit
	        print_text(text_1_error)
	        li a7 10
	        ecall
	
	    correct_input: # Correct input branch
	        addi sp sp -4 
	        sw a0 (sp) # Save the number of elements in the stack
.end_macro

.macro print_text(%x)
	    la a0 %x
	    li a7 4
	    ecall
.end_macro

.macro print_int(%x)
	    mv a0 %x
	    li a7 1
	    ecall
.end_macro