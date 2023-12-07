.MODEL SMALL
.STACK 100h

.DATA
    board DB 9 DUP (9 DUP (?))
    row DB 9 DUP (9 DUP (?))
    col DB 9 DUP (9 DUP (?))
    blk DB 9 DUP (9 DUP (?))
    validSudokuMsg DB "Yes$"
    invalidSudokuMsg DB "No$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        ; Input the Sudoku board
        MOV CX, 9 ; Outer loop counter
        MOV DI, OFFSET board ; Destination index
    outerLoop:
        MOV BX, 9 ; Inner loop counter
        MOV SI, OFFSET board[DI] ; Source index
    innerLoop:
        CALL READ_NUM ; Read a number from input
        MOV [SI], AL ; Store the number in board[i][j]
        INC SI ; Move to the next element
        DEC BX ; Decrement the inner loop counter
        JNZ innerLoop ; Loop until inner loop counter is zero
        ADD DI, 9 ; Move to the next row
        DEC CX ; Decrement the outer loop counter
        JNZ outerLoop ; Loop until outer loop counter is zero

        ; Call isValidSudoku function
        LEA SI, board ; Pass the address of board to SI
        CALL isValidSudoku

        ; Output the result
        MOV AH, 09h ; Print string function
        MOV DX, OFFSET validSudokuMsg ; Default to valid message
        CMP AL, 0 ; Check if isValidSudoku returned false
        JZ invalidSudoku ; Jump if it returned false
        MOV DX, OFFSET invalidSudokuMsg ; Set to invalid message
    invalidSudoku:
        INT 21h ; Print the result

        ; Exit program
        MOV AH, 4Ch
        INT 21h

    READ_NUM PROC
        MOV AH, 01h ; Read character function
        INT 21h ; Read a character from input
        SUB AL, '0' ; Convert from ASCII to number
        RET
    READ_NUM ENDP

    isValidSudoku PROC
        PUSH BP
        MOV BP, SP

        ; Initialize the row, col, and blk arrays to false
        MOV CX, 9 ; Outer loop counter
        XOR DI, DI ; Destination index
    outerLoop1_fix:
        MOV BX, 9 ; Inner loop counter
        XOR SI, SI ; Source index
        LEA AX, row[DI] ; Calculate the address of row[i]
        MOV DX, AX ; Destination index for storing false
        MOV AX, 9 ; Repeat count
        MOV CX, 0 ; Initial value
        REP STOSB ; Store 9 false values in row[i]

        LEA AX, col[DI] ; Calculate the address of col[i]
        MOV DX, AX ; Destination index for storing false
        REP STOSB ; Store 9 false values in col[i]

        LEA AX, blk[DI] ; Calculate the address of blk[i]
        MOV DX, AX ; Destination index for storing false
        REP STOSB ; Store 9 false values in blk[i]

        ADD DI, 9 ; Move to the next row
        DEC CX ; Decrement the outer loop counter
        JNZ outerLoop1_fix  ; Loop until outer loop counter is zero

        ; Check the validity of Sudoku
        XOR DI, DI ; Row index
        XOR SI, SI ; Column index
        MOV CX, 9 ; Outer loop counter
    outerLoop2:
        MOV BX, 9 ; Inner loop counter
        LEA AX, board[DI] ; Calculate the address of board[i]
    innerLoop2:
        MOV AL, [AX+SI] ; Load the number from board[i][j]
        TEST AL, AL ; Check if the number is zero
        JZ skipCheck ; If zero, skip the validity check

        MOV DX, DI ; Move row index to DX
        MOV AH, AL ; Move the number to AH
        DEC AH ; Subtract 1 to get the index (0-8)
        LEA AX, row[DX] ; Calculate the address of row[i]
        ADD AX, AH ; Move to the corresponding element
        CMP [AX], 1 ; Check if the number is already used in row[i]
        JNZ invalid ; Jump to invalid label if true
        MOV [AX], 1 ; Set row[i][num] to true

        MOV DX, SI ; Move column index to DX
        MOV AH, AL ; Move the number to AH
        DEC AH ; Subtract 1 to get the index (0-8)
        LEA AX, col[DX] ; Calculate the address of col[j]
        ADD AX, AH ; Move to the corresponding element
        CMP [AX], 1 ; Check if the number is already used in col[j]
        JNZ invalid ; Jump to invalid label if true
        MOV [AX], 1 ; Set col[j][num] to true

        MOV DX, DI ; Move row index to DX
        MOV AH, AL ; Move the number to AH
        DEC AH ; Subtract 1 to get the index (0-8)
        MOV BX, 3 ; Divide by 3 to get the block index
        MUL BX ; Multiply AH by 3
        ADD AH, SI ; Add column index to AH
        SHR AH, 1 ; Divide AH by 2 to get the byte index
        ADD AH, DX ; Add row index to AH
        LEA AX, blk[AX] ; Calculate the address of blk[blkIndex]
        ADD AX, AH ; Move to the corresponding element
        CMP [AX], 1 ; Check if the number is already used in blk[blkIndex]
        JNZ invalid ; Jump to invalid label if true
        MOV [AX], 1 ; Set blk[blkIndex][num] to true

    skipCheck:
        INC SI ; Move to the next column
        DEC BX ; Decrement the inner loop counter
        JNZ innerLoop2 ; Loop until inner loop counter is zero
        ADD DI, 9 ; Move to the next row
        DEC CX ; Decrement the outer loop counter
        JNZ outerLoop2 ; Loop until outer loop counter is zero

        ; Return true if the Sudoku is valid
        MOV AX, 1 ; Set the return value to true
        JMP exit

    invalid:
        MOV AX, 0 ; Set the return value to false

    exit:
        POP BP
        RET

    MAIN ENDP
    END MAIN