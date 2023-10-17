.macro read_array(%x1, %x2)
    mv t0 %x1 # Store the number of elements in the array in t0
    mv t1 %x2 # Store the address of the first element in t1

    print_arrayB:
        lw t2 (t1) # Read the element in the stack at address t1

        mv a0 t2 
        li a7 1 # Output to the screen
        ecall

        addi t1 t1 -4 # Move down one cell

        print_text(text_space)

        addi t0 t0 -1 # Counter
        bgtz t0 print_arrayB
.end_macro