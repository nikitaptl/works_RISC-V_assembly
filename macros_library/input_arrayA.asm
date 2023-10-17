.macro input_arrayA(%x)
	    mv t0 %x # Number of elements
	    
	    addi t1 sp -4 # Save the address of the first cell of array A in the stack to return it later and store it in the stack
	    addi t2 t0 0 # Copy the number of elements to register t2 to return and store it in the stack later
	    j reading_array # Start reading the array
	    
	    reading_array:
	        addi sp sp -4 # Allocate memory for a cell in the array
	        
	        li a7 5 # Input an array element from the console
	        ecall
	        
	        sw a0 (sp) # Save the array element in the stack
	        addi t0 t0 -1 # Counter
	        
	        bgtz t0 reading_array 
	        
	    addi sp sp -4 
	    sw t2 (sp) # Save the number of elements in array A in the stack
	    mv a0 t2 # Save the number of elements in array A in a0; this is the first return value
	    
	    addi sp sp -4
	    sw t1 (sp) # Save the address of the first cell of array A in the stack
	    mv a1 t1 # Save the address of the first cell of array A in a1; this is the second return value
.end_macro