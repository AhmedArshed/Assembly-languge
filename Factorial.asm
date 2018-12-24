include irvine32.inc

.data
a byte "Enter value",0
.code
	fac proc
push ebp
mov ebp , esp
mov eax , [ebp+8]
cmp eax , 0
ja l1
	mov eax , 1
	jmp l2

l1:
   dec eax
   push eax
   call fac
mov ebx , [ebp+8]
mul ebx
l2:
pop ebp
ret 4
	fac endp
main proc
xor eax , eax
xor ebx, ebx
xor ecx , ecx
xor edx , edx
mov edx, offset a
call writestring
call crlf
call readint
push eax
call fac
call writedec
call crlf

exit
main endp
end main