.macro input_n() # Macro for inputting the initial value x. x is saved in fa0
	li a7 7
	ecall
.end_macro

.macro print_text(%x) # Macro for printing text to the console
	la a0 %x
	li a7 4
	ecall
.end_macro