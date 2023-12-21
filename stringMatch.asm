org 100h
.model small

.data
    string1 db "HELLO",0
    string2 db "hello",0
    string3 db "Matched",0
    string4 db "not matched",0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset string1
    mov di, offset string2

compare_string:
    mov al, [si]
    mov bl, [di]

    cmp al, bl

    jne not_equal

    cmp al, 0

    je equal

    inc si
    inc di
    jmp compare_string

not_equal:
    mov dx, offset string4
    mov ah, 9
    int 21h

    jmp end_program

equal:
    mov dx, offset string3
    mov ah, 9
    int 21h

end_program:
    mov ah, 4ch
    int 21h
main endp
end main
