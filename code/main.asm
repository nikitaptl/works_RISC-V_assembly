.global main
.include "../macros_library/factorial.asm"
.include "../macros_library/pow.asm"
.include "../macros_library/find_res.asm"
.include "../macros_library/other_macros.asm"

.data
	a: .double 0.0005 # = 0.05%
	text_separation: .asciz "------------------------------------------"
	text_greeting: .asciz "Enter a number x to calculate 1/e^x: "
	text_end: .asciz "Calculation result: "
	lb: .asciz "\n"

.text
main:
	# Formatting
	print_text(text_separation)
	print_text(lb)
	print_text(text_greeting)

	# No parameters
	input_n() # Input x from the console - the exponent e
	# The return value is stored in fa0

	# Parameter fa0 - the exponent e in the calculation of 1/e^x
	find_res(fa0)
	# The return value is stored in fa0 - the result of the calculation 1/e^x

	print_text(text_end) # Formatting
	li a7 3 # Display the result on the screen
	ecall

	print_text(lb) # Formatting
	print_text(text_separation) # Formatting

	li a7 10 # Exit the program
	ecall
