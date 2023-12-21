
;fharenheit to celsius
;C= (F - 32) * 5/9 + 1
.model small         
.stack 100h        

.data 
    C dw ?
    
.code 
    main proc
        ; load the data segment
        mov ax, @data
        mov ds, ax
        
        ;farenheit to temp to ax variable 
        mov ax, 1000
        sub ax, 32 ; ax = ax - 32
        
	
        mov bx, 5
        mul bx    ; ax = ax * bx
        
        mov bx, 9 ; ax = ax / bx
        div bx
        
        add ax, 1 ; ax = ax + 1
        
        mov C, ax ; store Celcius temp to C  variable 
        
        ; display the result
        mov ah, 09h
        lea dx, C
        int 21h
        
        mov ah,4ch ; exit to dos
        int 21h
        main endp
    end main
