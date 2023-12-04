.model small
.stack 100h
.code
 
main proc

    ; Input 1
    mov ah, 1        ; Function code for reading a character from standard input
    int 21h          ; Call DOS interrupt to read a character
    mov bl, al       ; Move the input character to bl register

    ; Input 2
    mov ah, 1        ; Function code for reading a character from standard input
    int 21h          ; Call DOS interrupt to read a character
    mov bh, al       ; Move the input character to bh register

     mov ah,2  
     mov dl,10
     int 21h
     mov dl,13
     int 21h

    ; Display Input 1
    mov ah, 2        ; Function code for displaying a character
    mov dl, bl       ; Move the character in bl to dl register for display
    int 21h          ; Call DOS interrupt to display the character

    ; Display Input 2
    mov ah, 2        ; Function code for displaying a character
    mov dl, bh       ; Move the character in bh to dl register for display
    int 21h          ; Call DOS interrupt to display the character

    mov ah,2  
     mov dl,10
     int 21h
     mov dl,13
     int 21h 


    ; add bl,bh
    add bl,bh 
    sub bl,48 
    
    mov ah,2
    mov dl,bl
    int 21h

    exit : ; Exit program
    mov ah, 4ch       ; DOS function code for program exit
    int 21h          ; Call DOS interrupt to exit the program

main endp

end main
