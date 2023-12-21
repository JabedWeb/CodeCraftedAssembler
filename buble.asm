User
org 100h
.model small

.data
    myarray db  'A','C','B','F','D','$' 
    arrSize dw 5             
    newline db 10,13,'$'
    sorted_msg db 'sorted array elements $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, arrSize

    outer_loop:
    dec cx
    jz end_sort

    mov si, 0

    inner_loop:
    mov al, [myarray+si]
    mov ah, [myarray+si+1]

    cmp al, ah
    jbe no_swap

    mov [myarray+si], ah
    mov [myarray+si+1], al

    no_swap:
    inc si
    cmp si, cx
    jb inner_loop
    jmp outer_loop

end_sort:
    mov ah, 9
    lea dx, sorted_msg
    int 21h

    mov si, 0

printed_sorted_array:
    mov ah, 2
    mov dl, [myarray+si]
    int 21h
    inc si

    cmp si, arrSize
    je end_program

    mov dl, ' '
    int 21h
    jmp printed_sorted_array

end_program:
    mov ah, 4ch
    int 21h

main endp
end main