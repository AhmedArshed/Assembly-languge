include irvine32.inc

employ struct
id byte "000000"
lastname byte 30 dup(?)
year word ?
history dword 0,0,0,0
employ ends
.data
emp employ <>
.code
main proc
mov edx,(offset emp.id)
mov ecx ,(sizeof emp.id)
call readstring

mov edx , (offset emp.lastname)
mov ecx ,(sizeof emp.lastname)
call readstring

call readint
mov emp.year , ax

mov ecx , lengthof emp.history
mov esi , offset emp.history
l1:
   call readint
   mov dword ptr[esi] , eax
   inc esi
loop l1
exit
main endp
end main