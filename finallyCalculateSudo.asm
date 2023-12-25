; Md Jabed Hossen
; ID 213902046
; Project 1: Sudoku
; Program to print sudoku board, ask for input, and print new board until user quits the program

;.model small         
;.stack 100h     

.model tiny
   org 100h 
   
CAPTURE_INPUT MACRO index
    mov ah, 01h
    int 21h
    mov userInputs[index], al
ENDM

MOVE_CURSOR MACRO column, row
    mov ah, 02h      ; Function to set cursor position
    mov bh, 0        ; Page number
    mov dl, column   ; Column
    mov dh, row      ; Row
    int 10h          ; BIOS interrupt for video services
ENDM
   
PRINT_COLORED_STRING MACRO msg, color
    mov ah, 09h
    mov bl, color
    mov cx, 1
    int 10h
    mov dx, offset msg
    int 21h
ENDM

   
.data
border db '+---+---+---+$'

row1a db '2 | 1 |   $'
row2a db '1 |   |   $'
row3a db '  | 2 | 1 $'


userInputs db 4 dup(?) ; Array to store 4 user inputs

sol1a db '2 | 1 | 3 $'
sol2a db '1 | 3 | 2 $'
sol3a db '3 | 2 | 1 $'



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


validMsg db 'Congatulations ! Sudoku is valid.$'
invalidMsg db 'Sorry ! Sudoku is invalid.$'
.code


start:
call printboard 
call enterkey 
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
MOVE_CURSOR 10, 3
mov rowcount, 3

CAPTURE_INPUT 0


ask2:
mov ah, 3
mov bh, 0
int 10h
MOVE_CURSOR 6, 5

mov rowcount, 2

CAPTURE_INPUT 1

ask22:
mov ah, 3
mov bh, 0
int 10h
MOVE_CURSOR 10, 5
mov rowcount, 3

CAPTURE_INPUT 2


ask3:
mov ah, 3
mov bh, 0
int 10h
MOVE_CURSOR 2, 7
mov rowcount, 1

CAPTURE_INPUT 3
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


call validateSudoku

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
PRINT_COLORED_STRING borderline,9
ret
printborline endp




printborline2 proc
PRINT_COLORED_STRING borderline2,9
ret
printborline2 endp




printborder proc
PRINT_COLORED_STRING border,9
ret
printborder endp


printbwrow proc

PRINT_COLORED_STRING bwrow,4
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

ret
printsolboard endp


validateSudoku proc

    ; Compare row11
    mov al, userInputs[0]
    cmp al, '3'          
    jne invalidSolution

    ; Compare row22
    mov al, userInputs[1]
    cmp al, '3'         
    jne invalidSolution

    ; Compare row23
    mov al, userInputs[2]
    cmp al, '2'     
    jne invalidSolution

    ; Compare row31
    mov al, userInputs[3]
    cmp al, '3'      
    jne invalidSolution

    mov dx, offset validMsg
    jmp validationEnd

invalidSolution:
    mov dx, offset invalidMsg

validationEnd:
    mov ah, 09h
    int 21h
    ret
validateSudoku endp


end start