.model small 
.stack 100h 
; Macro for printing a string 
printString macro str 
    lea dx, str 
    mov ah, 09h 
    int 21h 
endm 
; Macro for printing a character in DL 
printChar macro 
    mov ah, 02h 
    int 21h 
endm
.data 
    arr db 100 dup(?) 
    evenSum db 0 
    i db 0 
    oddSum db 0 
    newline db 10, 13, '$' 
    msgSize db 'Enter size of the array: $' msgElement db 'Enter array element: $' msgEvenSum db 'Even summation is: $' msgOddSum db 'Odd summation is: $' 
.code 
main proc 
; Initialize data segment 
    mov ax, @data 
    mov ds, ax 
    ; Take array size from user 
    printString msgSize 
    mov ah, 1 
    int 21h 
    sub al, 48 
    mov bl, al 
    mov i,0 
    ; Take array elements from user
    mov si, offset arr 
    printString newline 
    printString msgElement 
    take_input: 
    mov ah, 1 
    int 21h 
    sub al, 48 
    mov [si], al 
    inc si 
    inc i 
    cmp i, bl 
    JL take_input 
    ; Traverse array and calculate sum of odd and even numbers mov si, offset arr 
    mov dl, 2 
    mov i,0 
    arr_traverse: 
    mov al, [si] 
    div dl 
    cmp ah, 0 
    je even_sum 
    jmp odd_sum 
    even_sum: 
    mov al, evenSum 
    add al,[si]
    mov evenSum, al 
    jmp back 
    odd_sum: 
    mov al, oddSum 
    add al,[si] 
    mov oddSum, al 
    jmp back 
    back: 
    inc si 
    inc i 
    cmp i, bl 
    JL arr_traverse 
    ; Print the results 
    print_result: 
    printString newline 
    printString msgEvenSum mov dl, evenSum 
    add dl, 48 
    printChar 
    printString newline 
    printString msgOddSum mov dl, oddSum 
    add dl, 48 
    printChar
    ; Exit the program 
    mov ah, 4ch 
    int 21h 
main endp 
end main