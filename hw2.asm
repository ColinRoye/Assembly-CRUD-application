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

	li $v0, -200
	li $v1, -200

################save s registers

	jr $ra


### Part V ###
most_damaged:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra


### Part VI ###
sort:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra


### Part VII ###
most_popular_feature:
################save s registers

	li $v0, -200
	li $v1, -200
################save s registers

	jr $ra


### Optional function: not required for the assignment ###
transliterate:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra


### Optional function: not required for the assignment ###
char_at:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra


### Optional function: not required for the assignment ###
index_of:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra


### Part VIII ###
compute_check_digit:
################save s registers

	li $v0, -200
	li $v1, -200
	################save s registers

	jr $ra

	.include "./part_1/test.asm"

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################
