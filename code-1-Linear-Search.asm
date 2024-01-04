org 100h 
.model small
.data
    myArray db 10,20,30,40,50
    arraySize dw 5 
    searchValue db 50
    newline db 10, 13, '$'
    not_found_msg db 'Value not found $'
    found_msg db 'Value found $'
.code 
       
  main proc
     mov ax, @data
     mov dx, ax
     
     xor si, si
     search_loop:
        cmp si, arraySize
        je value_not_found
        
        mov al, [myArray+si]
        cmp al, searchValue
        je value_found
        
        inc si
        jmp search_loop
        
        Value_found:
        mov ah,09h
        lea dx, found_msg
        int 21h
        jmp exit  
        
        Value_not_found:
        mov ah,09h
        lea dx, not_found_msg
        int 21h
        jmp exit 
        
        exit: 
        mov ah,4ch
        int 21h
    
end main 
ret

