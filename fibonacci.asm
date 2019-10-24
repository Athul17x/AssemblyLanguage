BITS 32

extern printf
extern scanf

section .rodata
	enter: db "Enter number: " ,0
	output: db "The n-th term of the Fibnoacci series: %d", 10, 0
	input: db "%d", 0 

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
		push input
		call scanf

		mov ecx, dword [ebp-0x4]
                cmp ecx, 0
                mov ebx, 0
                je exit

		mov ecx, dword [ebp-0x4]
		cmp ecx, 1
		mov ebx, 1
		je exit

		mov ecx, dword [ebp-0x4]
		cmp ecx, 2
		mov ebx, 1
		je exit

		mov edi, 1 ;a
		mov ebx, 1 ;b
		mov edx, 0

		sub ecx, 2 	

		L1:
			inc edx
			mov esi, ebx
			add ebx, edi
			mov edi, esi			
			cmp edx, ecx
			jne L1
		
		exit:
		push ebx
		push output
		call printf
				
		leave 
		ret
			
