.model small
.stack 100h

.code 
 
 main proc 
  mov cx, 26  ; 26 times loop as we take cx resister
  mov ah, 2
  mov dl, 'A'

  level1:
  int 21h
  inc dl 
  loop level1

  exit :
    mov ah, 4ch
    int 21h
    main endp
end main
