.data:
	text_1: .asciz "Enter the number of elements in array A (from 2 to 10)"
	text_2_1: .asciz "Enter "
	text_2_2: .asciz " numbers:"
	text_space: .asciz " "
	lb: .asciz "\n"
	
	.macro print_text(%x)
		la a0 %x
		li a7 4
		ecall
	.end_macro 
	
.text:
	# ���������� ���
	jal find_n
	# ������������ ������������ � a0, � ����� ������ ����� � sp 
	
	# ��������� - a0, ���������� ��������� � ������� (� ����� �� ������  � ������ sp)
	# ������ ������� ������� ������������ � ��������� ������ ����� sp
	jal input_array_A
	# ������������ �������� a0 - ���������� ��������� � ������� A (�� ����� ������� � ����� � 4(sp)) 
	# ������������ �������� a1 - ����� ������� �������� ������� A (�� ����� ������� � ����� � sp �� ����� ���������� ������������)

	# �������� a0 - ���������� ��������� � ������� A (�� ����� ������ � ����� � 4(sp)) 
	# �������� a1 - ����� ������� �������� ������� A (�� ����� ������ � ����� � sp)
	jal input_array_B
	# ������������ �������� a0 - ���������� ��������� � ������� B (�� ����� ������� � ����� � 4(sp)) 
	# ������������ �������� a1 - ����� ������� �������� ������� B (�� ����� ������� � ����� � sp �� ����� ���������� ������������)
	
	# �������� a0 - ���������� ��������� � ������� B (�� ����� ������ � ����� � 4(sp)) 
	# �������� a1 - ����� ������� �������� ������� B (�� ����� ������ � ����� � sp)
	jal read_array_B
	# ������������ �������� - a1 � a2 �� ����������
	
	li a7 10
	ecall
		
	find_n:
		print_text(text_1)
			
		li a7 5
		ecall
		
		addi sp sp -4
		sw a0 (sp)
		
		ret
			
	input_array_A:
		mv t0 a0 # Number of elements
		
		addi t1 sp -4 #  ��������� �� ������ ������� (�� �� ���� ����� ������� 4)
		addi t2 t0 0
		j reading_array		
		
		
		reading_array:
			addi sp sp -4
			
			li a7 5
			ecall
			
			sw a0 (sp)
			addi t0 t0 -1
			
			bgtz t0 reading_array
		
		addi sp sp -4 
		sw t2 (sp) # ��������� ���������� ���������
		mv a0 t2 # ������������ �������� ���������� ����� � a0
		
		addi sp sp -4
		sw t1 (sp) # ��������� ����� ���������� �������� ����� �� ������ ������� 
		mv a1 t1 # ������������ �������� ���������� ����� � a1
		
		addi sp sp -4 # Saving return address (just for fulfilling the convention)
		sw ra (sp)
			
		lw ra (sp)
		addi sp sp 4 # Poping return address
			
		ret
			
	input_array_B:
		mv t0 a1 # Address of the first element in array
		mv t2 a0 # Number of elements
		
		addi t1 t0 -4 # Address of the second element in array

		addi sp sp 8 # Poping t0, because in future we won't need it anymore
		
		addi t6 sp -4
		addi a6 t2 -1
				
		filling_array_B:
			addi sp sp -4 # Place for array B
			
			lw t3 (t0)
			lw t4 (t1)
			add t5 t3 t4
			
			addi t0 t0 -4
			addi t1 t1 -4
			
			sw t5 (sp)
			
			addi t2 t2 -1
			bgtz t2 filling_array_B
			

		addi sp sp -8
		sw a6 4(sp)
		sw t6 (sp)
		
		mv a0 a6
		mv a1 t6 
		
		ret
		
	
	read_array_B:
		mv t0 a0 # Number of numbers
		mv t1 a1 # Start of array_b
		
		print_array_B:
			lw t2 (t1)
			
			mv a0 t2
			li a7 1
			ecall
			
			addi t1 t1 -4
			
			print_text(text_space)
			
			addi t0 t0 -1
			bgtz t0 print_array_B
		ret	