INCLUDE Irvine32.inc
.data
  packed WORD 4536h
  packed1 WORD 7207h
  ListSize = ($ - packed)
  sum byte ListSize dup(?)
.code
main PROC
xor eax , eax
xor ebx , ebx
xor ecx , ecx
xor edx , edx
xor esi , esi
xor edi , edi

    mov ecx, ListSize / 2
    L2:
      mov al,BYTE PTR packed[esi]
      add al,BYTE PTR packed1[edi]
      daa
      mov BYTE PTR sum[edx],al
      inc edi
      inc edx
      inc esi
      xor eax , eax
      adc al,0
      mov BYTE PTR sum[esi],al
    Loop L2
    mov ecx, ListSize/2+2
    inc esi
    l1:
      mov al,sum[esi]
      call Writehex 
      dec esi
  Loop l1
  call crlf
exit
main ENDP
END main