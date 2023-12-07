.model small
.stack 100h

.data
    array dw 3 dup (3 dup (?))
    prompt db "Enter the elements of the array (3x3):$"
    output db "The elements of the array are:$"

.code
    main proc
        mov ax, @data
        mov ds, ax

        ; Display prompt
        mov ah, 09h
        mov dx, offset prompt
        int 21h

        ; Input the array
        mov cx, 3 ; Outer loop counter
        mov di, offset array ; Destination index
    outerloop:
        mov bx, 3 ; Inner loop counter
        mov si, offset array[di] ; Source index
    innerloop:
        call read_num ; Read a number from input
        push ax ; Store the number on the stack
        mov ax, [si] ; Load the number from array[i][j]
        pop [si] ; Restore the number from the stack to array[i][j]
        add si, 2 ; move to the next element (2 bytes per element)
        dec bx ; Decrement the inner loop counter
        jnz innerloop ; Loop until inner loop counter is zero
        add di, 6 ; move to the next row (6 bytes per row)
        dec cx ; Decrement the outer loop counter
        jnz outerloop ; Loop until outer loop counter is zero


        ; newline
        mov ah, 02h
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h


        ; Display output
        mov ah, 09h
        mov dx, offset output
        int 21h

        ; Output the array
        mov cx, 3 ; Outer loop counter
        mov di, offset array ; Destination index
    outerloop2:
        mov bx, 3 ; Inner loop counter
        mov si, offset array[di] ; Source index
    innerloop2:
        mov ax, [si] ; Load the number from array[i][j]
        call write_num ; Write the number to output
        add si, 2 ; move to the next element (2 bytes per element)
        dec bx ; Decrement the inner loop counter
        jnz innerloop2 ; Loop until inner loop counter is zero
        add di, 6 ; move to the next row (6 bytes per row)
        dec cx ; Decrement the outer loop counter
        jnz outerloop2 ; Loop until outer loop counter is zero

        ; Exit program
        mov ah, 4ch
        int 21h

    read_num proc
        mov ah, 01h ; Read character function
        int 21h ; Read a character from input
        sub al, '0' ; Convert from ASCII to number
        mov ah, 0 ; Clear upper part of AX
        ret
    read_num endp

    write_num proc
        add ax, '0' ; Convert number to ASCII
        mov dl, al ; move the ASCII character to DL
        mov ah, 02h ; Print character function
        int 21h ; Print the character
        ret
    write_num endp

    main endp
    end main