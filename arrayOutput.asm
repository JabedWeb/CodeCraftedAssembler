.model small
.stack 100h

print_msg MACRO msg
    mov ah, 9
    mov dx, OFFSET msg
    int 21h
ENDM
.data
    arr db 10 dup(?)
    i db ?
    newline db 10, 13, '$'
    mesg db 'Enter the size of array: $'
    mesg1 db 'Enter the elements of array: $'
    mesg2 db 'The elements of array are: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; print message
    print_msg mesg
    mov si, offset arr
   ;  print_msg 'array size: '
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48
    mov i, 0

   print_msg newline
   print_msg mesg1
input:
    mov ah, 1
    int 21h
    mov [si], al
    inc si
    inc i
    cmp i, bl
    JL input
    JGE array_print

    ; print array element
array_print:
    print_msg newline
    print_msg mesg2
    mov si, offset arr
    mov i, 0
PRINT:
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    inc i
    cmp i, bl
    JL PRINT
    JGE exit

    ; exit program
exit:
    mov ah, 4ch
    int 21h
main endp

end main