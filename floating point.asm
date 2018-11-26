include irvine32.inc

.data
	num real4 5.04
	num1 real4 3.0
.code
main proc
	fld num
	fld num1
	FDIV

main endp
end main