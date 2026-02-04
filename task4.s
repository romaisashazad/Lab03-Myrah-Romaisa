.text
.globl main

main:
    li x10, 0x100       # x = base address
    li x11, 0x200       # y = base address

    # Store "Hi\0" in y[]
    li x5, 72           # 'H'
    sb x5, 0(x11)
    li x5, 105          # 'i'
    sb x5, 1(x11)
    li x5, 0            # null terminator
    sb x5, 2(x11)

    jal x1, strcpy      # call strcpy

    li x17, 10          # exit syscall
    ecall

strcpy:
    addi sp, sp, -4     # push stack
    sw   x19, 0(sp)     # save x19
    add  x19, x0, x0    # i = 0

L1:
    add x5, x19, x11    # addr of y[i]
    lbu x6, 0(x5)       # load y[i]
    add x7, x19, x10    # addr of x[i]
    sb  x6, 0(x7)       # store to x[i]

    beq x6, x0, L2      # if null, end

    addi x19, x19, 1    # i++
    j L1                # loop

L2:
    lw   x19, 0(sp)     # restore x19
    addi sp,  sp, 4     # pop stack
    jalr x0,  0(x1)     # return

end:
    j end