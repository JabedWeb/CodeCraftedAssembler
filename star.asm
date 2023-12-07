.model small      ; defines the memory model as 'small'
.stack 100h       ; allocates 256 bytes (100h) for the stack

.data             ; data segment
.code             ; code segment 


; main procedure
main proc
    mov ax, @data ; initializes data segment
    mov ds, ax    ; moves the data segment address to ds register

    mov bx, 1     ; sets bx to 1, which will be used to count the number of asterisks per line

    mov cx, 5     ; sets the loop counter cx to 5, for 5 lines in the triangle
l1: 
    push cx       ; saves cx on stack (number of lines left to print)
    mov cx, bx    ; sets cx to the current number of asterisks to print

l2: 
    mov dl, '*'   ; loads asterisk character into dl for printing
    mov ah, 2     ; sets up ah for the interrupt function to print a character
    int 21h       ; calls the interrupt to print the character in dl
    loop l2       ; decrements cx; if cx is not zero, it jumps back to l2

    ; prints a new line (carriage return and line feed)
    mov dl, 10    ; line feed
    mov ah, 2     ; print function
    int 21h       ; call interrupt
    mov dl, 13    ; carriage return
    mov ah, 2     ; print function
    int 21h       ; call interrupt
    inc bx        ; increments bx for the next line (increase the number of asterisks)

    pop cx        ; restores cx (number of lines left to print)
    loop l1       ; decrements cx; if cx is not zero, it jumps back to l1

    ; program termination
    mov ah, 4ch   ; terminate program function
    int 21h       ; call interrupt
main endp
end main
