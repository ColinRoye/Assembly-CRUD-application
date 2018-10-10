# Colin Roye
# croye
# 110378271

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################

.text

### Part I ###
index_of_car:
	addiu $sp, $sp, -4
	sw $s0, 0($sp)
	#for i less then num cars
	#save registers

	li $t0, 0x10
	mul $a2, $a2, $t0

	addu $a0, $a0, $a2

	li $s0, 0 #iterator
	loop_ioc:
	beq $s0, $a1, ioc_not_found #branch if equal length

	lh $s1, 12($a0)

	beq $s1, $a3, ioc_found

	addiu $a0, $a0, 0x10
	addiu $s0, $s0, 1


	b loop_ioc
	ioc_found:
	move $v0, $s0

	b ioc_finished
	ioc_not_found:
	li $v0, -1


	ioc_finished:
	lw $s0, 0($sp)
	addiu $sp, $sp, -4
	jr $ra


### Part II ###
strcmp:
	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)

	lbu $s0, 0($a0)
	lbu $s1, 0($a1)

	subu $t0, $s0, $s1
	beqz $t0, loop_p2

	li $t0, -1
	move $t1, $a1
	beqz $s0, len_p2
	li $t0, 1
	move $t1, $a0
	beqz $s1, len_p2


	loop_p2:
	bne $s0, $s1, str_ne_p2
	beqz $s0, str_eq_p2


	addiu $a0, $a0, 1
	addiu $a1, $a1, 1
	lbu $s0, 0($a0)
	lbu $s1, 0($a1)
	b loop_p2

	len_p2:
	li $t3, 0 #count
	loop_len_p2:
	lbu $t4, 0($t1)
	beqz $t4, loop_len_p2_over
	add $t3, $t3, $t0
	addiu $t1, $t1, 1
	b loop_len_p2

	loop_len_p2_over:
	move $v0, $t3
	b strcmp_over

	str_ne_p2:
	sub $v0, $s0, $s1
	b	strcmp_over

	str_eq_p2:
	li $v0, 0
	strcmp_over:

	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addiu $sp, $sp, 8
	jr $ra


### Part III ###
memcpy:
	addiu $sp, $sp, -4
	sw $s0, 0($sp)
	blez $a2, memcpy_err
	li $s0, 0
	loop_memcpy:
	beq $s0, $a2 loop_memcpy_over

	lbu $t1, 0($a0)
	sb $t1, 0($a1)

	addiu $s0, $s0, 1
	addiu $a0, $a0, 1
	addiu $a1, $a1, 1
	b loop_memcpy
	loop_memcpy_over:
	li $v0, 0
	b memcpy_over
	memcpy_err:
	li $v0, -1
	memcpy_over:
	lw $s0, 0($sp)
	addiu $sp, $sp, 4
	jr $ra


### Part IV ###
insert_car:
################save s registers

	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1,4($sp)
	sw $s2, 8($sp)

	bltz $a1, ic_err
	bltz $a3, ic_err
	bgt $a3, $a1 ic_err
	li $s0, 0x10
	move $s2, $a1 #len
	move $s1, $a3 #ind


	mul $a1, $s0, $s2 #len * 0x1 = new final
	addu $a1, $a1, $a0 #add to base addr to get new dest
	sub $a0, $a1, $s0 #subtract 0x1 to get src

	loop_ic:


	addiu $sp, $sp, -32
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $s0, 16($sp)
	sw $s1, 20($sp)
	sw $s2, 20($sp)
	sw $ra, 24($sp)
	li $a2, 0x10
	jal memcpy
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $a3, 12($sp)
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 20($sp)
	lw $ra, 24($sp)
	addiu $sp, $sp, 32

	beq $s2, $s1, loop_ic_over #ind = previously moved ind
	addiu $s2, $s2, -1 #len

	addiu $a1, $a1, -0x10 #dest
	addiu $a0, $a0, -0x10 #src
	b loop_ic
	loop_ic_over:
######insert_car
	move $a1, $a0
	move $a0, $a2
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	li $a2, 0x10
	jal memcpy
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	li $v0, 0
	b ic_over
	ic_err:
	li $v0, -1
	ic_over:


	lw $s0, 0($sp)
	lw $s1,4($sp)
	lw $s2, 8($sp)
	addiu $sp, $sp, 12

	jr $ra


### Part V ###
most_damaged:
	addiu $sp, $sp, 24
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s4, 12($sp)
	sw $s5, 16($sp)
	sw $s6, 20($sp)

	li $s0,  0 # i
	li $s7,  0 #j

	li $s1, -1 # current vin r
	li $s2, -1 # currnet cost r

	li $s5, 0 #running cost

	li $s3, -1 #highest cost
	li $s4, -1 #highest index

	move $s6, $a1

	###check params

	loop_repairs:
	lw $s1, 0($a1) # addr to car
	lw $s1, 0($s1)

	lh $s2, 8($a1)

	bne $s0, $s7, continue_lrp
	#set current vin
	move $t0, $s1
	#addiu $s3, $s3, 1
	continue_lrp:
	bne $t0, $s1, skip_sum_lrp
	addu $s5, $s5, $s2
	skip_sum_lrp:
	addiu $s0, $s0, 1
	addiu $a1, $a1, 0xC
	bne $s0, $a3, loop_repairs
	###### j
	ble $s5, $s3, skip_greatest_lrp
	move $s3, $s5
	move $s4, $t0
	skip_greatest_lrp:
	addiu $s7, $s7, 1
	beq $s7, $a3 loop_repairs_over

	addiu $s6, $s6, 0xC
	move  $a1, $s6

	move $s0, $s7 # i

	li $s1, -1 # current vin r
	li $s2, -1 # currnet cost r
	li $s5, 0 #running cost

	move $a1, $s6


	b loop_repairs
	loop_repairs_over:


	li $s0, 0
	#load vin
	move $s2, $s4
	loop_cars:
	bgt $s0, $a2, md_err
	lw $s4, 0($a0)
 	# addiu $sp, $sp, -20
	# sw $a0, 0($sp)
	# sw $a1, 4($sp)
	# sw $s0, 8($sp)
	# sw $s2, 12($sp)
	# sw $s3, 16($sp)
	# sw $ra, 20($sp)
	# move $a0, $s4
	# move $a1, $s2
	# jal strcmp
	# lw $a0, 0($sp)
	# lw $a1, 4($sp)
	# lw $s0, 8($sp)
	# lw $s2, 12($sp)
	# lw $s3, 16($sp)
	# lw $ra, 20($sp)
	# addiu $sp, $sp, 20
 	# beqz $v0, loop_cars_over
	beq $s2, $s4, loop_cars_over
 	addiu $s0, $s0, 1
	addiu $a0, $a0 0x10
	b loop_cars
	loop_cars_over:


		move $v0, $s3
		move $v1, $s0



	b md_over
	md_err:
	li $v0, -1
	li $v1, -1
	md_over:





	lw $s0, 0($sp)
	lw $s1,4($sp)
	lw $s2, 8($sp)
	lw $s4, 12($sp)
	lw $s5, 16($sp)
	lw $s6, 20($sp)
	addiu $sp, $sp, 24
	jr $ra


### Part VI ###
sort:
################save s registers
addiu $sp, $sp, -24
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s5, 12($sp)
sw $a0, 16($sp)
sw $a1, 20($sp)

	li $s5, 0 #bool

	loop_sort:
	bnez $s5, loop_sort_over
	li $s5, 1 #bool

	li $s0, 1 #iterator

		li $s0, 0 #iterator
		loop_sort_odd:
		bgt $s0, $a1, loop_sort_odd_over
		#load i
		#load i+1
		li $s1, 0x10
		mul $s1, $s1, $s0
		addu $s1, $s1, $a0
		addiu $s2, $s1, 0x10

		#years
		lh $t1, 12($s1)
		lh $t2, 12($s2)

		#check condition
		ble $t1, $t2,	check_gt_odd_over
		## if true swap


		addiu $sp, $sp, -40
		sw $s0, 16($sp)
		sw $s1, 20($sp)
		sw $s2, 24($sp)
		sw $a0, 28($sp)
		sw $a1, 32($sp)
		sw $ra, 36($sp)

		move $a0, $s1
		move $a1, $sp
		li $a2, 0x10

		jal memcpy
		lw $s0, 16($sp)
		lw $s1, 20($sp)
		lw $s2, 24($sp)
		lw $a0, 28($sp)
		lw $a1, 32($sp)
		lw $ra, 36($sp)

		move $a0, $s2
		move $a1, $s1
		li $a2, 0x10

		jal memcpy
		lw $s0, 16($sp)
		lw $s1, 20($sp)
		lw $s2, 24($sp)
		lw $a0, 28($sp)
		lw $a1, 32($sp)
		lw $ra, 36($sp)


		move $a0, $sp
		move $a1, $s2
		li $a2, 0x10

		jal memcpy
		lw $s0, 16($sp)
		lw $s1, 20($sp)
		lw $s2, 24($sp)
		lw $a0, 28($sp)
		lw $a1, 32($sp)
		lw $ra, 36($sp)
		addiu $sp, $sp, 40

		li $s5, 0
		check_gt_odd_over:
		#add 2
		addiu $s0, $s0, 2
		b loop_sort_even
		loop_sort_odd_over:

#############################even

	li $s0, 0 #iterator
	loop_sort_even:
	bgt $s0, $a1, loop_sort_even_over
	#load i
	#load i+1
	li $s1, 0x10
	mul $s1, $s1, $s0
	addu $s1, $s1, $a0
	addiu $s2, $s1, 0x10

	#years
	lh $t1, 12($s1)
	lh $t2, 12($s2)
	nop
	#check condition
	ble $t1, $t2,	check_gt_even_over
	## if true swap


	addiu $sp, $sp, -40
	sw $s0, 16($sp)
	sw $s1, 20($sp)
	sw $s2, 24($sp)
	sw $a0, 28($sp)
	sw $a1, 32($sp)
	sw $ra, 36($sp)

	move $a0, $s1
	move $a1, $sp
	li $a2, 0x10

	jal memcpy
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 24($sp)
	lw $a0, 28($sp)
	lw $a1, 32($sp)
	lw $ra, 36($sp)

	move $a0, $s2
	move $a1, $s1
	li $a2, 0x10

	jal memcpy
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 24($sp)
	lw $a0, 28($sp)
	lw $a1, 32($sp)
	lw $ra, 36($sp)


	move $a0, $sp
	move $a1, $s2
	li $a2, 0x10

	jal memcpy
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 24($sp)
	lw $a0, 28($sp)
	lw $a1, 32($sp)
	lw $ra, 36($sp)
	addiu $sp, $sp, 40

	li $s5, 0
	check_gt_even_over:
	#add 2
	addiu $s0, $s0, 2
	b loop_sort_even
	loop_sort_even_over:

	b loop_sort
	loop_sort_over:
	li $v0, 0
	b sort_over
	sort_err:
	li $v0, -1
	sort_over:

	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s5, 12($sp)
	sw $a0, 16($sp)
	sw $a1, 20($sp)
	addiu $sp, $sp, 24


	jr $ra


### Part VII ###
	most_popular_feature:
	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1,4($sp)

	blez $a1, mp_err
	blez $a2, mp_err
	li $t4, 0xF
	bgt $a2, $t4

	li $s0, 0 #iterator
	li $t3, 0 #largest count
	li $t4, 0
	loop_features:
	li $t9, 4
	beq $s0, $t9, loop_features_over
	move $s1, $a2
	srlv $s1, $s1, $s0
	andi $s1, $s1 0x00000001
	sllv $s1, $s1, $s0

	beqz $s1, continue_loop_features

	li $t0, 0
	li $t5, 0 #running count
	loop_features_cars:
	beq $t0, $a1, loop_features_cars_over

	li $t1, 0x10
	mul $t1, $t1, $t0
	addu $t1, $t1, $a0
	lb $t1, 14($t1)

	and $t1, $t1, $s1

	addiu $t0, $t0, 1
	beqz $t1, loop_features_cars
	addiu $t5, $t5, 1
	b loop_features_cars
	loop_features_cars_over:
	blt $t5, $t3, continue_loop_features
	move $t3, $t5
	move $t4, $s1
	continue_loop_features:
	addiu $s0, $s0, 1
	b loop_features
	loop_features_over:
	move $v0, $t4
	blez $v0, mp_err

	b mp_over
	mp_err:
	li $v0, -1
	mp_over:

	lw $s0, 0($sp)
	lw $s1,4($sp)
	addiu $sp, $sp, 8

	jr $ra


### Optional function: not required for the assignment ###
transliterate:
################save s registers
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	jal index_of
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	li $t0, 10
	div $v0, $t0
	mfhi $v0
	################save s registers

	jr $ra


### Optional function: not required for the assignment ###
char_at:
	################save s registers
	addu $a0, $a0, $a1
	lbu $v0, 0($a0)
	################save s registers

	jr $ra


### Optional function: not required for the assignment ###
index_of:
################save s registers
	li $t1, 0
	loop_ind_of:
	lbu $t0, 0($a1)
	beq $t0, $a0, loop_ind_of_over


	addiu $t1, $t1, 1
	addiu $a1, $a1, 1
	b loop_ind_of
	loop_ind_of_over:
	move $v0, $t1

	################save s registers

	jr $ra


### Part VIII ###
compute_check_digit:
################save s registers
	loop_cds:



	blt $t0, 

	################save s registers

	jr $ra

	.include "./part_1/test.asm"

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################





#TODO on
