; Md Jabed Hossen
; ID 213902046
; Project 1: Sudoku
; Program to print sudoku board, ask for input, and print new board until user quits the program

;.model small         
;.stack 100h     

.model tiny
   org 100h
.data
border db '+---+---+---+$'

row1a db '5 | 3 |   $'
row2a db '6 |   |   $'
row3a db '  | 9 | 8 $'



sol1a db '5 | 3 | 4 $'
sol2a db '6 | 7 | 2 $'
sol3a db '1 | 9 | 8 $'



bwrow db '+-------------+$'
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
cmp rowcount, 3
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