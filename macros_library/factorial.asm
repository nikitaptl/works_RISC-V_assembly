.macro factorial(%x)
	li t0 1 # Initial value of the factorial
	add t1 %x zero # Counter as an integer (for convenience)
	
	fcvt.d.w ft0 t0 # 1 to subtract from ft2
	fcvt.d.w ft1 t0 # Register for the result of n!
	fcvt.d.w ft2 t1 # Copy of n
	
	bgt t1 t0 find_factorial
	j factorial_end
	
	find_factorial:
		fmul.d ft1 ft1 ft2 # res *= n
		fsub.d ft2 ft2 ft0 # n -= 1
		addi t1 t1 -1 # Decrement the counter
		bgt t1 t0 find_factorial
	
	factorial_end:
		fmv.d fa0 ft1 # Return value fa0 - the result of the factorial calculation
		addi sp sp -8
		fsd ft1 (sp) # Local variable - saving the factorial calculation result on the stack (one of the criteria)
.end_macro