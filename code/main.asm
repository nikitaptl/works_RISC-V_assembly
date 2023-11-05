.data
	a: .double 0.05
	
.macro input_n()
li a7 5
ecall
.end_macro 

.macro factorial(%x)
li t0 1
add t1 %x zero

fcvt.d.w ft0 t0 # Для вычитания
fcvt.d.w ft1 t0 # Результат n!
fcvt.d.w ft2 t1 # Сам n

bgt t1 t0 find_factorial
j factorial_end

find_factorial:
	fmul.d ft1 ft1 ft2
	fsub.d ft2 ft2 ft0
	addi t1 t1 -1 
	bgt t1 t0 find_factorial
j factorial_end

factorial_end:
	fmv.d fa0 ft1
.end_macro

.macro pow(%x1, %x2)
addi t0 %x1 0 # Число
addi t1 %x2 -1 # Степень
addi t2 t0 0 # Копия числа

bgt t1 zero find_pow
j end

find_pow:
	mul t0 t0 t2
	addi t1 t1 -1
	bgt t1 zero find_pow
j end

end:
	mv a0 t0
.end_macro
###
.macro find_res(%x)
add a0 %x zero
li t0 1
li t6 -1
mul t1 a0 t6

fcvt.d.w fa0 a0 # Наш x
fcvt.d.w ft0 t0 # Старое число
fcvt.d.w ft1 t2 # Новое число
fadd.d ft1 ft1 ft0

la a0 a
fld ft3 (a) # 0.05

check_occuracy:

.end_macro 
###

.text
	input_n()
	
	li a7 10
	ecall
