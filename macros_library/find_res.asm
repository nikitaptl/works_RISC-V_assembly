.macro find_res(%x)
	# int constants for creating values in double registers:
	li t0 1 # 1 - the first term of the Taylor series
	li t1 0 # 0 - for proper initialization of double variables
	li t6 -1 # -1 - -1 will be raised to a power in this Taylor series
	
	fcvt.d.w ft6 t6 # -1 - this will be raised to a power
	
	fcvt.d.w fa4 t1 # Needed below for correct division
	
	fcvt.d.w fa1 t1
	fadd.d fa1 %x fa1 # x, which will be raised to a power in the calculations
	
	fcvt.d.w fa2 t0 # old sum (i.e., the sum obtained in the previous iteration). Initial value is 1
	fmv.d fa3 fa2 # new sum (i.e., the sum obtained in this iteration). The initial value will be obtained in the first iteration of the loop
	
	# Store the value 0.05 in register ft3 - the maximum allowable error in calculations
	la a2 a
	fld ft3 (a2) # When the new sum differs from the old one by no more than 0.05, the loop will terminate
	
	li t2 1 # Exponent value (increases with each iteration)
	
	finding:
		fmv.d fa2 fa3 
		pow(ft6, t2) # Find the value (-1)^i
		fmv.d ft4 fa0 # Store the value in register ft4
			
		pow(fa1, t2) # Find the value x^i
		fmv.d ft5 fa0 # Store the value in register ft5
		fmul.d ft4 ft4 ft5 # ft4 = (-1)^i * x^i
		
		factorial(t2) # Find i!
		fmv.d ft5 fa0 # Store the value of i! in ft5
		fdiv.d ft4 ft4 ft5 # Store in register ft4 the value (-1)^i * x^i / i! (according to the Taylor series for 1/e^x)
		fadd.d fa3 fa3 ft4 # Transfer the resulting value to the new sum register 
		addi t2 t2 1 
		
		feq.d t0 fa3 fa4
		feq.d t1 fa2 fa4
		bnez t0 finding # If = 0, go to the next iteration (no need to check for error, or it's not convenient)
		bnez t1 finding # If = 0, go to the next iteration (no need to check for error, or it's not convenient)
		
		fsub.d ft2 fa3 fa2 # Store in ft2 the difference between the new and old sums
		fdiv.d ft2 ft2 fa3 # Store in ft2 the value indicating the part by which the new sum differs from the old sum
		fabs.d ft2 ft2 # Take the absolute value for proper comparison
		fle.d t0 ft2 ft3 # Check if it's <? 0.05 
		
		addi sp sp 24 # In the iteration, we called functions 3 times, in each of which we saved values on the stack. However, we do not use these local variables, so we do pop
		beqz t0 finding # If the error is greater than 0.05, go to the next iteration
		j end
	j end
	end:
		fmv.d fa0 fa3 # Return value fa0 - the result of finding 1/e^x
		addi sp sp -8
		fsd fa3 (sp) # Save the resulting value on the stack (one of the criteria)
.end_macro