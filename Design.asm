; Md Jabed Hossen
; ID 213902046
; Project 1: Sudoku

.model small
.stack 100h

print_msg MACRO msg
    mov ah, 9
    mov dx, OFFSET msg
    int 21h
ENDM

.data
    arr db 81 dup(?)  ; Array to hold 81 single-digit numbers
    i db 0
    welcome db '                       W E L C O M E  T O  S U D O K U                         $'
    newline db 10, 13, '$' 
    border db '-------------------------$'
    border2 db '| $'
    mesg1 db 'Enter 81 elements of the Sudoku  $'
    mesg2 db 'The elements of the Sudoku What you input: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Get 81 array elements with newline after every 9 elements
    print_msg welcome
    print_msg newline
    print_msg newline
    print_msg mesg1
    print_msg newline
    print_msg newline
    mov i, 0
    mov si, offset arr
input_loop:
    cmp i, 81
    JE end_input    ; Jump to end_input if 81 elements are read
    mov ah, 1
    int 21h         ; Read character
    cmp al, '1'
    jb input_loop   ; Skip if less than '1'
    cmp al, '9'
    ja input_loop   ; Skip if greater than '9'
    mov [si], al    ; Store in array
    inc si
    inc i
    mov ah, 0       ; Clear AH for division
    mov al, i
    mov bl, 9
    div bl          ; Divide i by 9
    cmp ah, 0       ; Check if remainder is 0
    JNE input_loop  ; If not, continue input
    cmp i, 81       ; Check if 81 elements are read
    JE end_input    ; If 81 elements read, skip newline
    print_msg newline  ; Print newline after every 9 elements
    JMP input_loop     ; Continue input loop
end_input:

    ; Print array elements in 9x9 format
    print_msg newline
    print_msg newline
    print_msg mesg2
    print_msg newline
    print_msg newline
    mov i, 0
    mov si, offset arr
print_loop:
    mov dl, [si]       ; Load array element
    mov ah, 2
    int 21h            ; Print character
    print_msg border2  ; Print border
    inc si
    inc i
    cmp i, 81
    JL check_newline
    JMP exit

check_newline:
    mov ah, 0          ; Clear AH for division
    mov al, i
    mov bl, 9
    div bl             ; Divide i by 9
    cmp ah, 0          ; Check if remainder is 0
    JNE print_loop     ; If not, continue printing
    print_msg newline  ; Print newline after every 9 elements
    print_msg border   ; Print border
    print_msg newline  ; Print newline
    JMP print_loop

    ; Exit program
exit:
    mov ah, 4ch
    int 21h
main endp

end main