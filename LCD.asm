org 0000h
mov a,#38h
acall cmn
acall delay
mov a,#0eh
acall cmn
acall delay
mov a,#01h
acall cmn
acall delay
mov a,#06h
acall cmn
acall delay
mov a,#80h
acall cmn
acall delay

mov dptr, #disp
mov r0,#0ch
l:clr a
movc a,@a+dptr
acall dat
acall delay
inc dptr
djnz r0,l

mov a,#0c0h
acall cmn
acall delay
mov dptr, #disp2
mov r0,#09h
l0:clr a
movc a,@a+dptr
acall dat
acall delay
inc dptr
djnz r0,l0
again: sjmp again

cmn:
mov p1,a
clr p2.0
clr p2.1
setb p2.2
clr p2.2
ret
dat:
mov p1,a
setb p2.0
clr p2.1
setb p2.2
clr p2.2
ret

delay: mov r3,#0fh
l3: mov r4,#0fh
l2: mov r5,#0ffh
l1: djnz r5 ,l1
djnz r4, l2
djnz r3, l3
ret
disp: db 'Keil is cool'
disp2: db 'Very cool'
end