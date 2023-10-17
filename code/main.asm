.include "..\macros_library\input_arrayA.asm"
.include "..\macros_library\input_arrayB.asm"
.include "..\macros_library\other_macros.asm"
.include "..\macros_library\read_array.asm"

.data:
	text_separation: .asciz "-----------------------------------------------------------"
	text_1: .asciz "Enter the number of elements in the array A (from 2 to 10):\n"
	text_1_error: .asciz "You have entered an incorrect number of elements!"
	text_2_1: .asciz "Enter "
	text_2_2: .asciz " numbers:\n"
	text_end: .asciz "Your array B: "
	text_space: .asciz " "
	lb: .asciz "\n"

.text:
	main:
		print_text(text_separation) # Program formatting
		print_text(lb)
		print_text(text_1) 
		
		# No parameters
		input_n()
		# The return value is stored in a0, as well as in a stack cell at sp

		mv t0 a0 # Since register a0 is used for formatting macros (print_text and print_int), we save it in t0

		print_text(text_2_1) # Program formatting
		print_int(t0)
		print_text(text_2_2)

		mv a0 t0 # According to convention, register a0 is used as a function parameter (in this case, a macro)
		
		# Parameters - a0, the number of elements in the array (it's reflected in the stack at sp)
		# The first array element is written to the free cell after sp
		input_arrayA(a0)
		# The return value a0 is the number of elements in array A (it's also written in the stack at 4(sp))
		# The return value a1 is the address of the first element of array A (it's also written in the stack at the end of the subroutine execution)

		# Parameter a0 - the number of elements in array A (it's also reflected in the stack at 4(sp))
		# Parameter a1 - the address of the first element of array A (it's also reflected in the stack at sp)
		input_arrayB(a0, a1)
		# The return value a0 is the number of elements in array B (it's also written in the stack at 4(sp))
		# The return value a1 is the address of the first element of array B (it's also written in the stack at the end of the subroutine execution)

		mv t0 a0 # Since register a0 is used for formatting macros (print_text and print_int), we save it in t0
		print_text(text_end)
		mv a0 t0 # According to convention, register a0 is used as a function parameter (in this case, a macro)
		
		# Parameter a0 - the number of elements in array B (it's also reflected in the stack at 4(sp))
		# Parameter a1 - the address of the first element of array B (it's also reflected in the stack at sp)
		read_array(a0, a1)
		# The return value - a0 and a1 remain unchanged

		print_text(lb)
		print_text(text_separation) # Program formatting
		
		li a7 10
		ecall
