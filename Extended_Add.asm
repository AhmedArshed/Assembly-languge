include irvine32.inc

.data
op1 DWORD 34h,12h,98h,74h,06h,0A4h,0B2h,0A2h 
op2 DWORD 02h,45h,23h,00h,00h,87h,10h,80h 
sum DWORD 9 dup(0)
.code
  Extended_Add proc
  pushad
  clc
  L1: mov eax,[esi]  
  adc eax,[edi]      
  pushfd            
  mov [ebx],eax
  add esi,4
  add edi,4 
  add ebx,4 
  popfd     
  loop L1     
    mov dword ptr [ebx],0 
     adc dword ptr [ebx],0 
     popad 
     ret
    Extended_Add ENDP
Display_Sum PROC 
pushad 
add  esi,ecx 
sub  esi,TYPE dword
mov  ebx,TYPE dword
 L2:
  mov  eax,[esi] 
 
 call WriteHex  
 sub esi,TYPE dword  
 loop L2
    popad 
    ret 
  Display_Sum ENDP
    
    
    
main proc
  xor eax , eax
  xor ebx , ebx
  xor ecx , ecx
  xor esi , esi
  xor edi , edi

  mov esi,OFFSET op1 
  mov edi,OFFSET op2
  mov ebx,OFFSET sum
  mov ecx,LENGTHOF op1
  call Extended_Add 
  mov   esi,OFFSET sum
  mov   ecx,LENGTHOF sum 
  call  Display_Sum
  call  Crlf
exit
main endp
end main

