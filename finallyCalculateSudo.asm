.model small
.stack 100h

print_msg MACRO msg
    mov ah, 9
    mov dx, OFFSET msg
    int 21h
ENDM

.data
    arr db 9 dup(?)  ; Array to hold 9 single-digit numbers for 3x3 Sudoku
    i db 0
    welcome db 'Welcome to Mini Sudoku!$'
    newline db 10, 13, '$' 
    mesg1 db 'Enter 9 elements of the Sudoku (1-3), 3 elements per row: $'
    mesg2 db 'Your Mini Sudoku grid is:$'
    error_msg db 'Error: Please enter numbers 1-3 only.$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display welcome message
    print_msg welcome
    print_msg newline
    
    ; Get 9 array elements
    print_msg mesg1
    mov i, 0
    mov si, offset arr
input_loop:
    cmp i, 9
    JE display_grid    ; Jump to display_grid if 9 elements are read
    mov ah, 1
    int 21h            ; Read character
    cmp al, '1'
    jb error           ; If less than '1', jump to error
    cmp al, '3'
    ja error           ; If greater than '3', jump to error
    mov [si], al       ; Store in array
    inc si
    inc i
    mov ah, 0          ; Clear AH for division
    mov al, i
    mov bl, 3
    div bl             ; Divide i by 3
    cmp ah, 0          ; Check if remainder is 0
    jne input_loop     ; If not, continue input
    print_msg newline  ; Print newline after every 3 elements
    jmp input_loop

error:
    ; Display error message and prompt for input again
    print_msg error_msg
    print_msg newline
    jmp input_loop

display_grid:
    ; Display the elements in 3x3 format
    print_msg mesg2
    print_msg newline
    mov i, 0
    mov si, offset arr
display_loop:
    mov dl, [si]       ; Load array element
    mov ah, 2
    int 21h            ; Print character
    inc si
    inc i
    cmp i, 9
    je exit            ; Exit if all elements have been printed
    mov ah, 0          ; Clear AH for division
    mov al, i
    mov bl, 3
    div bl             ; Divide i by 3
    cmp ah, 0          ; Check if remainder is 0
    jne display_loop   ; If not, continue printing
    print_msg newline  ; Print newline after every 3 elements
    jmp display_loop

exit:
    mov ah, 4ch
    int 21h
main endp

end main
