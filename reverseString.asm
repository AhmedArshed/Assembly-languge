include irvine32.inc

.data
a byte "ahmed arshed",0
.code
main proc
xor eax , eax
xor ecx , ecx
xor esi , esi
xor edx , edx
mov edx , offset a
call writestring
call crlf

mov ecx , lengthof a
dec ecx
l1:
   movzx eax , a[esi]
   push eax
   inc esi
loop l1
xor esi , esi
mov ecx , lengthof a
dec ecx
l2:
   pop eax
   mov a[esi] , al
   inc esi
loop l2
xor edx , edx
mov edx, offset a
call writestring
call crlf
exit
main endp
end main