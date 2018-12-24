include irvine32.inc

DECIMAL_OFFSET = 5 
.data
decimal_one BYTE "100123456789765",0
.code
WriteScaled proc
	mov esi, edx
	xor edx, edx
	mov edx, ecx
	sub edx, ebx
start:
	cmp edx, edi
	jnz L1
		mov eax, "."
		call writechar
	L1:
	mov eax, [esi]
	call writechar
	inc esi
	inc edi
Loop start
call crlf
ret
WriteScaled endp
main proc
	xor eax , eax
	xor ecx , ecx
	xor ebx , ebx
	xor edx , edx
	xor esi , esi
	xor edi , edi
mov edx , offset decimal_one
mov ecx , lengthof decimal_one - 1  ; due to null chractor in the end of string
mov ebx , offset DECIMAL_OFFSET
call WriteScaled
exit
main endp
end main