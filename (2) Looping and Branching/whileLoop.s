# An assembly implementation of: while (value != testCond) value--;
# Author: amwheeler1
# Register Usage:
#   rax: Stand-in for value during loop
#   rbx: Counter for the number of times whileloop executes

.data
    testCond: .quad 10
    value: .quad 60


.text
.global main
main:
   movq value, %rax         # rax = value
   movq $0, %rbx            # rbx = 0
   
whileloop:                  # while (rax != testCond)
    cmp testCond, %rax      # if rax == testCond
    je endloop              # jump to endloop
    decq %rax               # rax--
    incq %rbx               # rbx++
    jmp whileloop           # restart whileloop
    
endloop:                    # end of whileloop
    movq %rax, value        # value = rax
    
quit:                       # stop program execution
    movq $1, %rax           # rax = 1
    movq $0, %rbx           # rbx = 0
    int $0x80               # system interrupt 0x80
    retq                    # return
