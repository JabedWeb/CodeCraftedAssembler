.model tiny
org 100h

.data
border db '+---+---+---+$'
row1a db '5 | 3 |   $'
row1b db '  | 7 |   $'
row1c db '  |   |  $'

sol1a db '5 | 3 | 4 $'
sol1b db '6 | 7 | 8 $'
sol1c db '9 | 1 | 2 $'

bwrow db '+---+---+---+$'
borderline db '| $'
borderline2 db ' | $'

again db 'Press any key to try again or press enter to see the solution and quit: $'
welcome db 'W E L C O M E  T O  S U D O K U$'
rowcount db 1
instructions db 'Enter a number at the location of the cursor. Press space for blank.$'
toquit db 'The solution is above. Press any key to quit: $'
space db '                 $'

.code

start:
    call printboard
    call enterkey
    call enterkey

    mov ah, 09h
    mov bl, 10
    mov cx, 23            ; set color
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
    mov dl, 10
    mov dh, 3
    int 10h
    mov rowcount, 3

a1:
    mov ah, 1
    int 21h
    add rowcount, 1
    cmp rowcount, 4
    jg ask2
    mov ah, 3
    mov bh, 0
    int 10h
    mov ah, 2
    mov bh, 0
    cmp rowcount, 2
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
    cmp rowcount, 4
    jg more
    mov ah, 2
    mov bh, 0
    int 10h
    mov ah, 2
    mov bh, 0
    cmp rowcount, 2
    je next2
    add dl, 4
    mov dh, 5
    int 10h
    jmp a2

next2:
    add dl, 10
    mov dh, 5
    int 10h
    jmp a2

more:
    call enterkey
    call enterkey
    call enterkey
    call enterkey
    mov ah, 09h
    mov bl, 10
    mov cx, 22            ; set color
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
    mov dh, 18
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
    mov cx, 14            ; set color
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
    mov cx, 33
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
    ret                 ; start new line
enterkey endp

printborline proc
    mov ah, 09h
    mov bl, 9
    mov cx, 1            ; set color
    int 10h
    mov dx, offset borderline      ; prepare to print
    mov ah, 9
    int 21h
    ret
printborline endp

printborline2 proc
    mov ah, 09h
    mov bl, 9
    mov cx, 2            ; set color
    int 10h
    mov dx, offset borderline2     ; prepare to print
    mov ah, 9
    int 21h
    ret
printborline2 endp

printborder proc
    mov ah, 09h
    mov bl, 9
    mov cx, 13           ; set color
    int 10h
    mov dx, offset border          ; prepare to print
    mov ah, 9
    int 21h
    ret
printborder endp

printbwrow proc
    mov ah, 09h
    mov bl, 4
    mov cx, 13           ; set color
    int 10h
    mov dx, offset bwrow          ; prepare to print
    mov ah, 9
    int 21h
    ret
printbwrow endp

printboard proc
    mov ax, 0003h
    int 10h

    call enterkey
    call pwelcome
    call enterkey

    call printborder
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

    mov dx, offset row1b
    mov ah, 9
    int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

    mov dx, offset row1c
    mov ah, 9
    int 21h 
    
    call printborline2
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

    call printborline

    mov dx, offset sol1b
    mov ah, 9
    int 21h

    call printborline

    mov dx, offset sol1c
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
