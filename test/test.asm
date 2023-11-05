.macro input_arrayB(%x1, %x2)
	    mv t0 %x2 # Address of the first element in array A
	    mv t2 %x1 # Number of elements
	    
	    addi t1 t0 -4 # Address of the second element in array A
	    
	    addi t6 sp -4 # Save the address of the first cell of array B in the stack to return it later
	    addi a6 t2 -1 # Save the number of elements in array B (one less than specified) in a6 to return it later
	    
	    filling_array_B:
	        addi sp sp -4 # Allocate memory for a new element in array B
	        
	        lw t3 (t0) # Load the first element at address t0 (corresponding element in array A)
	        lw t4 (t1) # Load the second element at address t1 (corresponding element in array A)
	        add t5 t3 t4 # Store the value of the sum of neighboring elements in t5
	        
	        addi t0 t0 -4 # Move down 1 cell
	        addi t1 t1 -4
	        
	        sw t5 (sp) # Save the new element in array B in the stack
	        
	        addi t2 t2 -1 # Counter
	        bgtz t2 filling_array_B
	        
	        
	    addi sp sp -8 # Allocate memory for return values
	    sw a6 4(sp) # Save the number of elements in array B in the stack
	    sw t6 (sp) # Save the address of the first element in array B in the stack
	    
	    mv a0 a6 # Store the number of elements in array B in a0; this is the first return value
	    mv a1 t6 # Store the address of the first element in array B in a1; this is the second return value
.end_macro