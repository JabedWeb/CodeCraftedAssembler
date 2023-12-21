;Put 100H to register BX, Then move the contents of this register to AX register.
;• After that add 10H to the contents of AX register.

.model small
.stack 100h
.data
.code
main proc
mov ax, @data
mov ds, ax
mov bx, 100h
mov ax, bx
add ax, 10h
mov ax, 4ch
int 21h
main endp
end main
