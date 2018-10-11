.include "sort_data.asm"
.include "hw2.asm"

.data
nl: .asciiz "\n"
sort_output: .asciiz  "sort output: "

.text
.globl main
main:
  la $a0, sort_output
  li $v0, 4
  syscall

  la $a0, all_cars
  li $a1, 1
  li $s0, 0

  addiu $sp, $sp, -8
  sw $a0, 0($sp)
  sw $a1, 4($sp)


  #jal print_cars

  lw $a0, 0($sp)
  lw $a1, 4($sp)
  jal sort

  lw $a0, 0($sp)
  lw $a1, 4($sp)
  #jal print_cars


  addiu $sp, $sp, 8




  move $a0, $v0
  li $v0, 1
syscall
la $a0, nl
li $v0, 4
syscall
li $v0, 10
syscall



print_cars:
  addiu $sp, $sp, -8
  sw $s0, 0($sp)
  sw $s1, 4($sp)


  addiu $sp, $sp, -8
  sw $a0, 0($sp)
  sw $a1, 4($sp)

  la $a0, nl
  li $v0, 4
  syscall

  lw $a0, 0($sp)
  lw $a1, 4($sp)


  li $s0, 0


  loop_print_cars:

  lw $a0, 0($sp)
  lw $a1, 4($sp)

  li $s1, 0x10
  mul $s1, $s1, $s0
  addu $s1, $s1, $a0


  la $a0, nl
  li $v0, 4
  syscall

  lw $a0, 0($sp)
  lw $a1, 4($sp)

  lh $a0, 12($s1)
  li $v0, 1
  syscall

  lw $a0, 0($sp)
  lw $a1, 4($sp)




  addiu $s0, $s0, 1
  beq $s0, $a1, loop_print_cars_over
  b loop_print_cars
  loop_print_cars_over:

  lw $a0, 0($sp)
  lw $a1, 4($sp)
  addiu $sp, $sp, 8


  lw $s0, 0($sp)
  lw $s1, 4($sp)
  addiu $sp, $sp, -8

  jr $ra
