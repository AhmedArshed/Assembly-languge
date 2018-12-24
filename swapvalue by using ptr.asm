include irvine32.inc
sub1 proto pvalx:ptr dword , pvaly:ptr dword
.data

x byte 7h
y byte 8h
.code

sub1 proc, pvalx:ptr dword , pvaly:ptr dword
	mov esi,pValX	; get pointers
	mov edi,pValY
	mov eax,[esi]	; get first integer
	xchg eax,[edi]	; exchange with second
	mov [esi],eax

ret
sub1 ENDP
main proc

invoke sub1,offset x ,offset y

xor eax , eax
mov al , x
call writehex
call crlf
mov al , y
call writehex
call crlf
cmp eax, ebx
exit
main endp
end main