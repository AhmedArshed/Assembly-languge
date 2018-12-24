include irvine32.inc

.data
	array byte 9,8,7,6,5,4,3,1,0,87,99,101
	
.code
main proc
	xor eax , eax
	xor ecx , ecx
	xor ebx , ebx
	xor esi , esi
	
	mov ecx , lengthof array
	l1:
	   push ecx
	   xor esi , esi
	l2:
	   mov al , array[esi]
	   cmp al , array[esi+1]
	   jae l3
		xchg al , array[esi+1]
		mov array[esi] ,al
	l3:
	   inc esi
	loop l2
	
	pop ecx	
	loop l1
xor ecx , ecx
xor eax , eax
xor esi , esi
mov ecx , lengthof array
l4:
   mov al , array[esi]   
   call writeint 
   call crlf
   inc esi
loop l4
exit
main endp
end main