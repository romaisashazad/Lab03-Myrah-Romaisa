# task 3 s:
.text
.globl main

main:
    li x10, 0x100      
    
    #  array: [6, 5, 4, 3, 2, 1]
    li x5, 6
    sw x5, 0(x10)       # v[0] = 6
    li x5, 5
    sw x5, 4(x10)       # v[1] = 5
    li x5, 4
    sw x5, 8(x10)       # v[2] = 4
    li x5, 3
    sw x5, 12(x10)      # v[3] = 3
    li x5, 2
    sw x5, 16(x10)      # v[4] = 2
    li x5, 1
    sw x5, 20(x10)      # v[5] = 1

    li x11, 3           # k = 3 (swap v[3] and v[4])

    jal x1, swap        # Call swap(v, 3)

    addi x10, x0, 10    
    ecall             

swap:
    slli x5, x11, 2     # x5 = k × 4 (each int = 4 bytes)
    add x5, x10, x5     # x5 = address of v[k]
    
    lw x6, 0(x5)        # x6 = v[3] = 3
    lw x7, 4(x5)        # x7 = v[4] = 2
    
    sw x7, 0(x5)        # v[3] = 2
    sw x6, 4(x5)        # v[4] = 3
    
    jalr x0, 0(x1)      # Return to main

end:
    j end