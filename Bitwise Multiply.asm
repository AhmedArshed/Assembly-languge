INCLUDE IRVINE32.inc

.data 
	num1 dword 1101110111b
	num2 dword 10101111b
	num3 dword ?
.code

main proc
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor edi, edi
	mov esi, 2
	mov ebx, num2
	mov ecx, 32
	L10:
		shl ebx, 1
		jnc L9
		inc edi
		L9:
	Loop L10
	
	mov ebx, num2
	mov ecx, edi
	L1:
		push ecx
		xor esi, esi
		xor edi,edi
		mov ecx, 16
		L2:
			shr ebx, 1
			inc edi
			jc L4
		
		Loop L2
		L4:
		
		mov ecx, edi
		rcl ebx,cl
		shr ebx, cl
		shl ebx, cl
		mov num3, ebx
		mov ebx, num2
		mov esi, 32
		sub esi, edi
		mov ecx, esi
		SHL ebx, cl
		SHR ebx, cl
		mov ecx, ebx
		L5:
			add eax,num1
			
		Loop L5
		
		mov ebx, num3
		mov num2, ebx
		pop ecx
	Loop L1
		call writedec 
		call crlf
exit
main endp
end main