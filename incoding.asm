include irvine32.inc

.data
key SBYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
value byte "Fast Nuces" , 0
count byte 0

.code
main proc
xor eax , eax
xor ebx , ebx
xor ecx , ecx
xor edx , edx
xor esi , esi
xor edi , edi
	mov esi , offset key
	mov edi , offset value
	mov ecx , sizeof value - 1
	l1:
	   xor eax , eax
	   mov al, [esi]
	   bt eax , 7
	   jc l6
	   jnc l3
	   
	l6:
	    neg al
	    mov cl , al
	l2:
	   mov dl , [edi]
	   ror dl , 1
	   mov [edi] , dl
loop l2
jmp l8

	l3:
	   mov cl , al
	l4:
	   mov dl , [edi]
	   rol dl , 1
	   mov [edi], dl
	loop l4
	l8:
	   inc edi
	   inc esi
	   inc count
	   cmp count , 10
	   jne l5
	   mov count , 0
	   mov esi , offset key
	   l5:
	loop l1
	exit
	main endp
	end main