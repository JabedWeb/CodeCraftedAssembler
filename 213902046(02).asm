; concate two strings
include 'emu8086.inc'
.model small
.data
  firstName db 50 dup(?)
  lastName db 50 dup(?)
  fullName db 100 dup(?)

.code

main proc
  mov ax, @data
  mov ds, ax
 
  lea di, firstName 
  mov dx, 50
  print 'enter your first name: '
  call get_string
  
  printn ''
  lea di, lastName
  mov dx, 50
  print 'enter your last name: '
  call get_string
  printn ''

  call strConcate
  
  exit:
    mov ah, 04ch
    int 21h
 
main endp


strConcate proc
  mov si, 0
  mov di, 0
 
  cont1:
    mov dl, firstName[si]      
    mov fullName[di], dl
    inc si
    inc di         ; store first name into full name
    cmp dl, 0
    je temp
    jne cont1
   
  temp:
    dec di
    mov si, 0
    mov fullName[di], '_'
    inc di                 ; concate first name and underscore _
    jmp cont2
   
  cont2:
    mov dl, lastName[si]
    mov fullName[di], dl
    inc si
    inc di                 
    cmp dl, 0
    je print_fullName
    jne cont2
   
  print_fullName:
    print 'full name is: '
    lea si, fullName
    call print_string
    printn ''
    
    ret
strConcate endp

define_scan_num
define_print_num
define_print_num_uns
define_get_string
define_print_string

end main
