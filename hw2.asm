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
	li $v0, -200
	li $v1, -200

	jr $ra


### Part III ###
memcpy:
	li $v0, -200
	li $v1, -200

	jr $ra


### Part IV ###
insert_car:
	li $v0, -200
	li $v1, -200


	jr $ra


### Part V ###
most_damaged:
	li $v0, -200
	li $v1, -200

	jr $ra


### Part VI ###
sort:
	li $v0, -200
	li $v1, -200

	jr $ra


### Part VII ###
most_popular_feature:
	li $v0, -200
	li $v1, -200

	jr $ra


### Optional function: not required for the assignment ###
transliterate:
	li $v0, -200
	li $v1, -200

	jr $ra


### Optional function: not required for the assignment ###
char_at:
	li $v0, -200
	li $v1, -200

	jr $ra


### Optional function: not required for the assignment ###
index_of:
	li $v0, -200
	li $v1, -200

	jr $ra


### Part VIII ###
compute_check_digit:
	li $v0, -200
	li $v1, -200

	jr $ra

	.include "./part_1/test.asm"

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################
