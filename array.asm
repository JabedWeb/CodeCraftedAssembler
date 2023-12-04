.model small
.stack 100h
.data  
    arr db 5 dup(?)  ; Define an array of 5 bytes

.code  
main proc 
    mov ax, @data
    mov ds, ax

    ; Input loop to read 5 characters
    mov si, offset arr  ; Point SI to the start of the array
    mov cx, 5           ; Set counter to 5

input_loop:
    mov ah, 1           ; Function 1: Read character from standard input
    int 21h             ; Call DOS interrupt
    mov [si], al        ; Store the character in the array
    inc si              ; Move to the next position in the array
    loop input_loop     ; Repeat until 5 characters are read

    ; Output loop to display 5 characters
    mov si, offset arr  ; Reset SI to the start of the array
    mov cx, 5           ; Reset counter to 5

output_loop:
    mov ah, 2           ; Function 2: Write character to standard output
    mov dl, [si]        ; Load the character from the array into DL
    int 21h             ; Call DOS interrupt to output the character
    inc si              ; Move to the next position in the array
    loop output_loop    ; Repeat until all characters are displayed

    ; Terminate program
    mov ah, 4Ch         ; Function 4Ch: Terminate with return code
    int 21h             ; Call DOS interrupt to terminate the program
main endp 
end main
