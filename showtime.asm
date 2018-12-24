include irvine32.inc

.data
sec byte ?
hours byte ?
mint byte ?
time word 0001001000001110b
a byte ":",0
.code
	showTime proc
	mov ax , time
	shl ax , 5
	shr ax , 10
	mov mint , al
mov ax , time
shl ax , 11
rol ax , 5
mov sec , al
	mov ax , time
	shr ax , 11
	mov hours , al
	ret
	showTime endp
main proc
xor eax , eax
xor ebx , ebx
xor ecx , ecx
xor edx , edx
xor esi , esi
xor edi , edi

call showTime
mov al , hours
call writedec
mov edx , offset a
call writestring
mov al , mint
call writedec
mov edx , offset a
call writestring
mov al , sec
call writedec

call crlf
	exit
	main endp
	end main