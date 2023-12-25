; Md Jabed Hossen
; ID 213902046
; Project 1: Sudoku
; Program to print sudoku board, ask for input, and print new board until user quits the program

;.model small         
;.stack 100h     

.model tiny
   org 100h
.data
border db '+---+---+---+---+---+---+---+---+---+$'

row1a db '5 | 3 |   $'
row2a db '6 |   |   $'
row3a db '  | 9 | 8 $'



sol1a db '5 | 3 | 4 $'
sol2a db '6 | 7 | 2 $'
sol3a db '1 | 9 | 8 $'



bwrow db '+-----------------------------------+$'
borderline db '| $'
borderline2 db ' | $'

again db 'Press any key to try again or press enter to see solution and quit: $'
welcome db '                       W E L C O M E  T O  S U D O K U                         $'
count db 1
one db 1
rowcount db 1
instructions db 'Enter a number at the location of the cursor. Press space for blank.$'
toquit db 'The solution is above. Press any key to quit: $'
space db '                                                                     $'

.code


start:
call printboard ;603 line
call enterkey ;543 line
call enterkey

mov ah, 09h
mov bl, 10
mov cx, 68			        ; set color
int 10h

mov dx, offset instructions
mov ah, 9
int 21h

ask1:
mov ah, 3 
mov bh, 0
int 10h
mov ah, 2 
mov bh, 0 
mov dl, 10 ;here dl is the column
mov dh, 3 ;here dh is the row
int 10h
mov rowcount, 3

a1:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask2
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next1
add dl, 3
mov dh, 3
int 10h
jmp a1

next1:
add dl, 7
mov dh, 3
int 10h
add rowcount, 1
jmp a1

ask2:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 6
mov dh, 5
int 10h
mov rowcount, 2

a2:
mov ah, 1
int 21h

add rowcount, 1
cmp rowcount, 9
jg ask3
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 4
je next2
add dl, 4
mov dh, 5
int 10h
jmp a2

next2:
add dl, 16
mov dh, 5
int 10h
mov rowcount, 7
jmp a2

ask3:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 7
int 10h
mov rowcount, 1

a3:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask4
mov ah, 2
mov bh, 0
cmp rowcount, 2
je next3
cmp rowcount, 8
je next4
add dl, 4
mov dh, 7
int 10h
jmp a3

next3:
add dl, 12
mov dh, 7
int 10h
mov rowcount, 4
jmp a3

next4:
add dl, 8
mov dh, 7
int 10h
mov rowcount, 9
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
mov rowcount, 2

a4:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask5
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next5
cmp rowcount, 9
je next6
add dl, 4
mov dh, 9
int 10h
jmp a4

next5:
add dl, 8
mov dh, 9
int 10h
mov rowcount, 6
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
mov rowcount, 2

a5:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask6
mov ah, 2
mov bh, 0
cmp rowcount, 4
je next7
cmp rowcount, 6
je next8
cmp rowcount, 9
je next9
add dl, 4
mov dh, 11
int 10h
jmp a5

next7:
add dl, 8
mov dh, 11
int 10h
mov rowcount, 5
jmp a5

next8:
add dl, 8
mov dh, 11
int 10h
mov rowcount, 7
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
mov rowcount, 2

a6:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask7
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next10
cmp rowcount, 9
je next11
add dl, 4
mov dh, 13
int 10h
jmp a6

next10:
add dl, 8
mov dh, 13
int 10h
mov rowcount, 6
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
mov rowcount, 1

a7:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask8
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 2
je next12
cmp rowcount, 7
je next13
add dl, 4
mov dh, 15
int 10h
jmp a7

next12:
add dl, 8
mov dh, 15
int 10h
mov rowcount, 3
jmp a7

next13:
add dl, 12
mov dh, 15
int 10h
mov rowcount, 9
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
mov rowcount, 1

a8:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg ask9
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 4
je next14
cmp rowcount, 9
je next15
add dl, 4
mov dh, 17
int 10h
jmp a8

next14:
add dl, 16
mov dh, 17
int 10h
mov rowcount, 7
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
mov rowcount, 1

a9:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 9
jg more
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next16
cmp rowcount, 8
je next17
add dl, 4
mov dh, 19
int 10h
jmp a9

next16:
add dl, 8
mov dh, 19
int 10h
mov rowcount, 6
jmp a9

next17:
jmp more


more:
call enterkey
call enterkey
call enterkey
call enterkey
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
je solquit
mov ah, 2
mov bh, 0
mov dl, 0
mov dh, 23
int 10h
mov dx, offset space
mov ah, 9
int 21h
jmp ask1

solquit:
call printsolboard
call enterkey
call enterkey
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

pwelcome proc
mov ah, 09h
mov bl, 10
mov cx, 75
int 10h
mov dx, offset welcome
mov ah, 9
int 21h
ret
pwelcome endp


enterkey proc
mov dx, 10
mov ah, 2
int 21h
mov dx, 13
mov ah, 2
int 21h
ret					                ; start new line
enterkey endp


printborline proc
mov ah,09h
mov bl,9
mov cx, 1				; set color
int 10h
mov dx, offset borderline		; prepare to print
mov ah, 9
int 21h
ret
printborline endp


printborline2 proc
mov ah,09h
mov bl,9
mov cx, 2				; set color
int 10h
mov dx, offset borderline2		; prepare to print
mov ah, 9
int 21h
ret
printborline2 endp


printborder proc
mov ah,09h
mov bl,9
mov cx, 37				; set color
int 10h
mov dx, offset border			; prepare to print
mov ah, 9
int 21h
ret
printborder endp


printbwrow proc
mov ah,09h
mov bl,4
mov cx, 37			        ; set color
int 10h
mov dx, offset bwrow			; prepare to print
mov ah, 9
int 21h
ret
printbwrow endp

printboard proc
mov ax, 0003h 
int 10h

call enterkey ; 544 line
call pwelcome
call enterkey

call printborder ;578 line
call enterkey
call printborline

mov dx, offset row1a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline


mov dx, offset row2a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline


mov dx, offset row3a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

ret
printboard endp

printsolboard proc
mov ax, 0003h
int 10h

call enterkey
call pwelcome

call enterkey
call printborder
call enterkey
call printborline

mov dx, offset sol1a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol2a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol3a
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

ret
printsolboard endp

end start