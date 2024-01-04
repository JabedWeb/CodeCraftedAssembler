include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
    arr db 15, 10, 28, 19, 12, 60, 43, "$"
    size dw 7
    search db 60
    newline db 10, 13, "$"
.code
    main proc
    mov ax, @data
    mov ds, ax
      
      xor si, si 
      mov cx, size  
      linearSearch:
      mov al, [arr+si]
      cmp al, search
      je found
      inc si
      loop linearSearch
      
      print 'value not found!'
      jmp exit
      
      found:
      print 'value found at index: '
      
      ;print the search value index
      mov ax, si
      mov ah, 0
      mov ah, 2
      
      add al, 48
      mov dl, al
      int 21h
      
      
      ;newline print
      mov ah, 9
      lea dx, newline
      int 21h
      
      shr search, 4
      
 
      mov ah, 2
      mov dl, search
      int 21h
      
     
     exit:
     mov ah, 4ch
     int 21h   
        
    main endp
end main