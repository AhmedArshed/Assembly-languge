include irvine32.inc

.data
a byte "Enter a value",0
pNo byte "Number is prime",0
ToExit byte "To exit program Enter -1 ",0
notp byte "Not a prime no",0
b byte 0
prime DWORD 0
check WORD 2
.code
main proc

xor eax , eax
xor ecx , ecx
xor ebx , ebx
xor edx , edx
xor esi , esi
mov ecx , 0
l1:
  mov edx , offset ToExit
  call writestring
  ;call crlf
  ;mov edx , offset a
  ;call writestring
  ;call crlf
  call readint
  
  cmp eax , -1
  je l4
  mov prime , eax
  sub eax , 2
  push ecx
  mov ecx , eax

l2:
  xor ebx , ebx
  xor eax , eax
  mov eax , prime
  mov bx , check
  div bx
  inc check
  cmp edx , 0
    je prime_no
    loop l2
  prime_no:
    inc b
    loop l2
xor eax , eax
mov al , b
call writedec
call crlf
cmp al , 1
je is
   mov edx , offset notp
   call writestring
   call crlf
   jmp l3
is:
mov edx , offset pNo
call writestring
call crlf
  l3:
  pop ecx
  loop l1
l4:

exit
main endp
end main