.macro pow(%x1, %x2)
	li t6 0
	fcvt.d.w ft0 t6
	fadd.d ft0 %x1 ft0 # Store in register %x - the base of the exponent
	
	addi t1 %x2 -1 # Counter down to 0, subtracting 1 from it
	fmv.d ft2 ft0 # Copy of the base for convenient multiplication
	
	bgt t1 zero find_pow 
	j end
	
	find_pow:
		fmul.d ft0 ft0 ft2
		addi t1 t1 -1
		bgt t1 zero find_pow

	end:
		fmv.d fa0 ft0 # Return value fa0 - the result of exponentiation
		addi sp sp -8
		fsd ft0 (sp) # Save the return value on the stack (one of the criteria)
.end_macro