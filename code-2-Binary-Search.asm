org 100h 
.model small
.data
    myArray db 10,20,30,40,50,70,90,100
    arraySize dw 8 
    searchValue db 60
    newline db 10, 13, '$'
    not_found_msg db 'Value not found $'
    found_msg db 'Value found $'
.code 
       
  main proc
     mov ax, @data
     mov dx, ax
     
     mov cx,0 ; low index
     mov dx, arraySize ; high index
     
     binary_search:
        cmp cx, dx
        jg value_not_found
        
        mov si, cx
        add si, dx
        shr si, 1
        
        mov al, [myArray+si]
        cmp al, searchValue
        je value_found
        
        jl update_low
        jg update_high
        
    update_low:
        inc si
        mov cx, si
        jmp binary_search
        
    update_high:
        dec si
        mov dx, si
        jmp binary_search
    
        
     

        
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

