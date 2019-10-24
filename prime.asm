BITS 32

extern printf
extern scanf

section .data
	enter: db "Enter the number to be checked: ",10,0
	in: db "%d", 0
	out: db "%d", 10,0
	yes: db "The number is prime",10,0
	no: db "The number is not prime",10,0

section .text
	global main

	main:
	
	push ebp
	mov ebp, esp
	sub esp, 0x10
	
	push enter
	call printf

	lea eax, [ebp-0x4]
	push eax
	push in
	call scanf

	mov ecx, dword [ebp-0x4]
        cmp ecx, 0
        je exitno

	mov ecx, dword [ebp-0x4]	
	cmp ecx, 1
	je exitno

	mov ecx, dword [ebp-0x4]	
	cmp ecx, 2
	je exityes
		
	mov ebx, 1
	L1:
		mov ecx, dword [ebp-0x4]

		inc ebx
		mov edx, 0
		mov eax, ecx
		div ebx

		cmp edx, 0
		je exitno

		dec ecx

		cmp ebx, ecx
		jne L1
		je exityes
		
	exitno:
			push no
			call printf
			jmp exit
	exityes:
			push yes
			call printf
	exit:	
	leave
	ret
