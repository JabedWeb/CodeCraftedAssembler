; Md Jabed Hossen
; ID 213902046
; Project 1: Sudoku
; Program to print sudoku board, ask for input, and print new board until user quits the program

;.model small         
;.stack 100h     

.model tiny
   org 100h
.data
border_9 db '+---+---+---+---+---+---+---+---+---+$'

row_9_1a db '5 | 3 |   $'
row_9_1b db '  | 7 |   $'
row_9_1c db '  |   |  $'

row_9_2a db '6 |   |   $'
row_9_2b db '1 | 9 | 5 $'
row_9_2c db '  |   |  $'

row_9_3a db '  | 9 | 8 $'
row_9_3b db '  |   |   $'
row_9_3c db '  | 6 |  $'

row_9_4a db '8 |   |   $'
row_9_4b db '  | 6 |   $'
row_9_4c db '  |   | 3$'

row_9_5a db '4 |   |   $'
row_9_5b db '8 |   | 3 $'
row_9_5c db '  |   | 1$'

row_9_6a db '7 |   |   $'
row_9_6b db '  | 2 |   $'
row_9_6c db '  |   | 6$'

row_9_7a db '  | 6 |   $'
row_9_7b db '  |   |   $'
row_9_7c db '2 | 8 |  $'

row_9_8a db '  |   |   $'
row_9_8b db '4 | 1 | 9 $'
row_9_8c db '  |   | 5$'

row_9_9a db '  |   |   $'
row_9_9b db '  | 8 |   $'
row_9_9c db '  | 7 | 9$'

sol_9_1a db '5 | 3 | 4 $'
sol_9_1b db '6 | 7 | 8 $'
sol_9_1c db '9 | 1 | 2$'

sol_9_2a db '6 | 7 | 2 $'
sol_9_2b db '1 | 9 | 5 $'
sol_9_2c db '3 | 4 | 8$'

sol_9_3a db '1 | 9 | 8 $'
sol_9_3b db '3 | 4 | 2 $'
sol_9_3c db '5 | 6 | 7$'

sol_9_4a db '8 | 5 | 9 $'
sol_9_4b db '7 | 6 | 1 $'
sol_9_4c db '4 | 2 | 3$'

sol_9_5a db '4 | 2 | 6 $'
sol_9_5b db '8 | 5 | 3 $'
sol_9_5c db '7 | 9 | 1$'

sol_9_6a db '7 | 1 | 3 $'
sol_9_6b db '9 | 2 | 4 $'
sol_9_6c db '8 | 5 | 6$'

sol_9_7a db '9 | 6 | 1 $'
sol_9_7b db '5 | 3 | 7 $'
sol_9_7c db '2 | 8 | 4$'

sol_9_8a db '2 | 8 | 7 $'
sol_9_8b db '4 | 1 | 9 $'
sol_9_8c db '6 | 3 | 5$'

sol_9_9a db '3 | 4 | 5 $'
sol_9_9b db '2 | 8 | 6 $'
sol_9_9c db '1 | 7 | 9$'

bwrow_9__9 db '+-----------------------------------+$'
border_9line db '| $'
border_9line2 db ' | $'

again db 'Press any key to try again or press enter to see sol_9_ution and quit: $'
welcome db '                       W E L C O M E  T O  S U D O K U                         $'
count db 1
one db 1
row_9_count db 1
instructions db 'Enter a number at the location of the cursor. Press space for blank.$'
toquit db 'The sol_9_ution is above. Press any key to quit: $'
space db '                                                                     $'

.code


start:
call printboard_9 
call enterkey_9 
call enterkey_9

mov ah, 09h
mov bl, 10
mov cx, 68			    
int 10h

mov dx, offset instructions
mov ah, 9
int 21h

ask1_9:
mov ah, 3 
mov bh, 0
int 10h
mov ah, 2 
mov bh, 0 
mov dl, 10 
mov dh, 3 
int 10h
mov row_9_count, 3

a1:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask2_9
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp row_9_count, 5
je next1
add dl, 3
mov dh, 3
int 10h
jmp a1

next1:
add dl, 7
mov dh, 3
int 10h
add row_9_count, 1
jmp a1

ask2_9:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 6
mov dh, 5
int 10h
mov row_9_count, 2

a2:
mov ah, 1
int 21h

add row_9_count, 1
cmp row_9_count, 9
jg ask3_9
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp row_9_count, 4
je next2
add dl, 4
mov dh, 5
int 10h
jmp a2

next2:
add dl, 16
mov dh, 5
int 10h
mov row_9_count, 7
jmp a2

ask3_9:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 7
int 10h
mov row_9_count, 1

a3:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask4
mov ah, 2
mov bh, 0
cmp row_9_count, 2
je next3
cmp row_9_count, 8
je next4
add dl, 4
mov dh, 7
int 10h
jmp a3

next3:
add dl, 12
mov dh, 7
int 10h
mov row_9_count, 4
jmp a3

next4:
add dl, 8
mov dh, 7
int 10h
mov row_9_count, 9
jmp a3


ask4:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 6
mov dh, 9
int 10h
mov row_9_count, 2

a4:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask5
mov ah, 2
mov bh, 0
cmp row_9_count, 5
je next5
cmp row_9_count, 9
je next6
add dl, 4
mov dh, 9
int 10h
jmp a4

next5:
add dl, 8
mov dh, 9
int 10h
mov row_9_count, 6
jmp a4

next6:
jmp ask5


ask5:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 6
mov dh, 11
int 10h
mov row_9_count, 2

a5:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask6
mov ah, 2
mov bh, 0
cmp row_9_count, 4
je next7
cmp row_9_count, 6
je next8
cmp row_9_count, 9
je next9
add dl, 4
mov dh, 11
int 10h
jmp a5

next7:
add dl, 8
mov dh, 11
int 10h
mov row_9_count, 5
jmp a5

next8:
add dl, 8
mov dh, 11
int 10h
mov row_9_count, 7
jmp a5

next9:
jmp ask6


ask6:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 6
mov dh, 13
int 10h
mov row_9_count, 2

a6:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask7
mov ah, 2
mov bh, 0
cmp row_9_count, 5
je next10
cmp row_9_count, 9
je next11
add dl, 4
mov dh, 13
int 10h
jmp a6

next10:
add dl, 8
mov dh, 13
int 10h
mov row_9_count, 6
jmp a6

next11:
jmp ask7


ask7:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 15
int 10h
mov row_9_count, 1

a7:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask8
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp row_9_count, 2
je next12
cmp row_9_count, 7
je next13
add dl, 4
mov dh, 15
int 10h
jmp a7

next12:
add dl, 8
mov dh, 15
int 10h
mov row_9_count, 3
jmp a7

next13:
add dl, 12
mov dh, 15
int 10h
mov row_9_count, 9
jmp a7

ask8:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 17
int 10h
mov row_9_count, 1

a8:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg ask9
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp row_9_count, 4
je next14
cmp row_9_count, 9
je next15
add dl, 4
mov dh, 17
int 10h
jmp a8

next14:
add dl, 16
mov dh, 17
int 10h
mov row_9_count, 7
jmp a8

next15:
jmp ask9


ask9:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 19
int 10h
mov row_9_count, 1

a9:
mov ah, 1
int 21h
add row_9_count, 1
cmp row_9_count, 9
jg more_9
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp row_9_count, 5
je next16
cmp row_9_count, 8
je next17
add dl, 4
mov dh, 19
int 10h
jmp a9

next16:
add dl, 8
mov dh, 19
int 10h
mov row_9_count, 6
jmp a9

next17:
jmp more_9


more_9:
call enterkey_9
call enterkey_9
call enterkey_9
call enterkey_9
mov ah, 09h
mov bl, 10
mov cx, 67			        ; set color
int 10h
mov dx, offset again
mov ah, 9
int 21h
mov ah, 1
int 21h
cmp al, 13
je sol_9_quit
mov ah, 2
mov bh, 0
mov dl, 0
mov dh, 23
int 10h
mov dx, offset space
mov ah, 9
int 21h
jmp ask1_9

sol_9_quit:
call printsol_9_board
call enterkey_9
call enterkey_9
mov ah, 09h
mov bl, 10
mov cx, 45				; set color 
int 10h
mov dx, offset toquit
mov ah, 9
int 21h
mov ah, 1
int 21h
mov ax, 0003h
int 10h
mov ah, 4ch
int 21h

pwelcome_9 proc
mov ah, 09h
mov bl, 10
mov cx, 75
int 10h
mov dx, offset welcome
mov ah, 9
int 21h
ret
pwelcome_9 endp


enterkey_9 proc
mov dx, 10
mov ah, 2
int 21h
mov dx, 13
mov ah, 2
int 21h
ret					                ; start new line
enterkey_9 endp


printborline_9 proc
mov ah,09h
mov bl,9
mov cx, 1				; set color
int 10h
mov dx, offset border_9line		; prepare to print
mov ah, 9
int 21h
ret
printborline_9 endp


printborline_92_9 proc
mov ah,09h
mov bl,9
mov cx, 2				; set color
int 10h
mov dx, offset border_9line2		; prepare to print
mov ah, 9
int 21h
ret
printborline_92_9 endp


printborder_9 proc
mov ah,09h
mov bl,9
mov cx, 37				; set color
int 10h
mov dx, offset border_9			; prepare to print
mov ah, 9
int 21h
ret
printborder_9 endp


printbwrow_9__9 proc
mov ah,09h
mov bl,4
mov cx, 37			        ; set color
int 10h
mov dx, offset bwrow_9__9			; prepare to print
mov ah, 9
int 21h
ret
printbwrow_9__9 endp

printboard_9 proc
mov ax, 0003h 
int 10h

call enterkey_9 ; 544 line
call pwelcome_9
call enterkey_9

call printborder_9 ;578 line
call enterkey_9
call printborline_9

mov dx, offset row_9_1a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_1b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_1c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_2a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_2b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_2c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_3a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_3b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_3c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9
call enterkey_9
call printborline_9

mov dx, offset row_9_4a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_4b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_4c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_5a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_5b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_5c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_6a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_6b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_6c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9
call enterkey_9
call printborline_9

mov dx, offset row_9_7a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_7b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_7c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_8a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_8b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_8c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset row_9_9a
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_9b
mov ah, 9
int 21h

call printborline_9

mov dx, offset row_9_9c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9

ret
printboard_9 endp

printsol_9_board proc
mov ax, 0003h
int 10h

call enterkey_9
call pwelcome_9

call enterkey_9
call printborder_9
call enterkey_9
call printborline_9

mov dx, offset sol_9_1a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_1b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_1c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_2a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_2b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_2c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_3a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_3b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_3c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9
call enterkey_9
call printborline_9

mov dx, offset sol_9_4a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_4b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_4c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_5a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_5b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_5c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_6a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_6b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_6c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9
call enterkey_9
call printborline_9

mov dx, offset sol_9_7a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_7b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_7c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_8a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_8b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_8c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printbwrow_9__9
call enterkey_9
call printborline_9

mov dx, offset sol_9_9a
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_9b
mov ah, 9
int 21h

call printborline_9

mov dx, offset sol_9_9c
mov ah, 9
int 21h

call printborline_92_9
call enterkey_9
call printborder_9

ret
printsol_9_board endp

end start