include irvine32.inc

.data
str1 BYTE "Color output is easy!",0

.code
main proc
	mov  eax,Green + (white*15)
	call SetTextColor
	mov  edx,OFFSET str1
	call WriteString
	call Crlf
exit
main endp
end main
