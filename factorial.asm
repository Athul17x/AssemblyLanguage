BITS 32

extern printf
extern scanf

section .data
	fmt: db "%d",0
	output: db "The factorial is %d",10,0
	
section .text
	global main
	
	main:
	push ebp
	mov ebp,esp
	sub esp,0x10

	lea eax, [ebp-0x4]
        push eax
        push fmt
        call scanf

	mov ebx,0
	mov ecx,1	

	L1:
	add ebx, 1
	mov edx, dword [ebp-0x4]
	imul ecx,ebx
	cmp ebx,edx
	jl L1

	push ecx
        push output
        call printf
	
	leave 
	ret
