.data
vin_00: .byte 100,1
vin_01: .asciiz "1"
vin_02: .asciiz "2"
vin_03: .asciiz "3"
vin_04: .asciiz "4"
vin_05: .asciiz "5"
vin_06: .asciiz "6"
vin_07: .asciiz "7"
vin_08: .asciiz "8"
vin_09: .asciiz "9"
vin_10: .asciiz "10"
vin_11: .asciiz "11"

make_A: .asciiz "A"
make_B: .asciiz "B"
make_C: .asciiz "C"
make_D: .asciiz "D"
make_E: .asciiz "E"

model_A: .asciiz "A"
model_B: .asciiz "B"
model_C: .asciiz "C"
model_D: .asciiz "D"
model_E: .asciiz "E"
model_F: .asciiz "F"
model_G: .asciiz "G"
model_H: .asciiz "H"
model_I: .asciiz "I"
model_J: .asciiz "J"
model_K: .asciiz "K"
model_L: .asciiz "L"
model_M: .asciiz "M"
model_N: .asciiz "N"
model_O: .asciiz "O"

repair_desc_A: .asciiz "fix cracked windshield"
repair_desc_B: .asciiz "rotate tires"
repair_desc_C: .asciiz "change oil filter"
repair_desc_D: .asciiz "rebuild engine"
repair_desc_E: .asciiz "remove rocks from grill"
repair_desc_F: .asciiz "touch up paint"
repair_desc_G: .asciiz "replace windshield wipers"
repair_desc_H: .asciiz "top off wiper fluid"
repair_desc_I: .asciiz "replace spare tire"

# Unsorted data
.align 2
all_cars:
# car_00: .word vin_00
# car_00_make_addr: .word make_A
# car_00_model_addr: .word model_A
# car_00_year: .byte , 7
# car_00_features: .byte 8
# .byte 0
#
# car_01: .word vin_01
# car_01_make_addr: .word make_D
# car_01_model_addr: .word model_B
# car_01_year: .byte , 7
# car_01_features: .byte 8
# .byte 0
#
# car_02: .word vin_02
# car_02_make_addr: .word make_A
# car_02_model_addr: .word model_C
# car_02_year: .byte , 7
# car_02_features: .byte 12
# .byte 0
#
# car_03: .word vin_03
# car_03_make_addr: .word make_E
# car_03_model_addr: .word model_D
# car_03_year: .byte , 7
# car_03_features: .byte 10
# .byte 0
#
# car_04: .word vin_04
# car_04_make_addr: .word make_A
# car_04_model_addr: .word model_E
# car_04_year: .byte , 7
# car_04_features: .byte 5
# .byte 0
#
# car_05: .word vin_05
# car_05_make_addr: .word make_C
# car_05_model_addr: .word model_F
# car_05_year: .byte , 7
# car_05_features: .byte 10
# .byte 0
#
# car_06: .word vin_06
# car_06_make_addr: .word make_B
# car_06_model_addr: .word model_G
# car_06_year: .byte , 7
# car_06_features: .byte 0
# .byte 0
#
car_07: .word vin_00
car_07_make_addr: .word make_A
car_07_model_addr: .word model_H
car_07_year: .byte 1, 0
car_07_features: .byte 12
.byte 0

car_08: .word vin_08
car_08_make_addr: .word make_A
car_08_model_addr: .word model_I
car_08_year: .byte 2, 0
car_08_features: .byte 10
.byte 0

car_09: .word vin_09
car_09_make_addr: .word make_A
car_09_model_addr: .word model_J
car_09_year: .byte 1, 0
car_09_features: .byte 1
.byte 0

car_10: .word vin_10
car_10_make_addr: .word make_B
car_10_model_addr: .word model_K
car_10_year: .byte 2, 0
car_10_features: .byte 4
.byte 0

car_11: .word vin_11
car_11_make_addr: .word make_C
car_11_model_addr: .word model_L
car_11_year: .byte 229, 7
car_11_features: .byte 13
.byte 0



# Expected sorted array
.align 2
sorted_all_cars:
.word vin_00
.word make_A
.word model_A
.byte 225, 7
.byte 8
.byte 0

.word vin_02
.word make_A
.word model_C
.byte 225, 7
.byte 12
.byte 0

.word vin_07
.word make_A
.word model_H
.byte 225, 7
.byte 12
.byte 0

.word vin_01
.word make_D
.word model_B
.byte 226, 7
.byte 8
.byte 0

.word vin_03
.word make_E
.word model_D
.byte 226, 7
.byte 10
.byte 0

.word vin_09
.word make_A
.word model_J
.byte 226, 7
.byte 1
.byte 0

.word vin_10
.word make_B
.word model_K
.byte 226, 7
.byte 4
.byte 0

.word vin_04
.word make_A
.word model_E
.byte 227, 7
.byte 5
.byte 0

.word vin_05
.word make_C
.word model_F
.byte 227, 7
.byte 10
.byte 0

.word vin_06
.word make_B
.word model_G
.byte 227, 7
.byte 0
.byte 0

.word vin_08
.word make_A
.word model_I
.byte 227, 7
.byte 10
.byte 0

.word vin_11
.word make_C
.word model_L
.byte 227, 7
.byte 13
.byte 0
