.model small     
.stack 100h      

.data          
.code           

main proc 

mov ax, @data     
mov ds, ax

; print A to Z
mov cx, 26
mov ah, 2
mov dl, 'A'
print:
    int 21h
    inc dl
    loop print

exit:
mov ax, 4ch    
int 21h

main endp
end main

