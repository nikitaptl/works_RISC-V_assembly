.include "../macros_library/factorial.asm"
.include "../macros_library/pow.asm"
.include "../macros_library/find_res.asm"
.include "../macros_library/other_macros.asm"

.data:
	text_good: .asciz "Test passed successfully\n"
	text_bad: .asciz "Test not passed\n"
	a: .double 0.0005

	# Test case 1
	input1: .double 0
	output1: .double 1.0

	# Test case 2
	input2: .double 2
	output2: .double 0.13532788199454876

	# Test case 3
	input3: .double 10
	output3: .double 4.540234176893602E-5

	# Test case 4
	input4: .double  -10
	output4: .double 22019.951758120904

	# Test case 5
	input5: .double 7.213
	output5: .double 7.369826199115555E-4

	# Test case 6
	input6: .double -7.213
	output6: .double 1356.7014522458758

	# Test case 7
	input7: .double 0.371
	output7: .double 0.6900405032729512

.macro check_case(%x1, %x2) 
la a0 %x1
la a1 %x2

fld fa5 (a0) 
fld fa6 (a1)

find_res(fa5) # Store the return value in a0
feq.d a0 fa0 fa6

li a7 4
beqz a0 bad
bnez a0 good

good:
	la a0 text_good
	ecall
	j end
bad:
	la a0 text_bad
	ecall
	j end
end:
.end_macro

.text:
main:
	# Parameters: input - input, output - expected output
	# Prints whether the test passed or not on the screen
	check_case(input1, output1)
	check_case(input2, output2)
	check_case(input3, output3)
	check_case(input4, output4)
	check_case(input5, output5)
	check_case(input6, output6)
	check_case(input7, output7)
	li a7 10
	ecall