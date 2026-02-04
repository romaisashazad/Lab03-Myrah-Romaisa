.text
.globl main

main:
    addi x10,x0, 30    # g = 30
    addi x11,x0, 20    # h = 20  
    addi x12,x0, 10    # i = 10
    addi x13,x0, 5     # j = 5
    
    jal x1,leaf_example 
    
    end:
        j end

leaf_example:
    addi sp, sp, -12   # allocating 12 bytes on stack
    sw x18, 0(sp)
    sw x19, 4(sp)
    sw x20, 8(sp)
    
    add x18, x10, x11  # g + h = 30 + 20 = 50 (temp register)
    add x19, x12, x13  # i + j = 10 + 5 = 15 (temp register)
    sub x20, x18, x19  # f = (g+h) - (i+j) = 35
    
    addi x10, x20, 0  # moving x20 result to x10
    
    lw x18, 0(sp)
    lw x19, 4(sp)
    lw x20, 8(sp)
    addi sp, sp, 12   # restoring stack pointer

    jalr x0, 0(x1) # to return 
    
    
