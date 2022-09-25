global _start

section .text
_start:
	push ebp
	mov ebp,esp
	sub esp,0x10

; call to the prompt message
	push len
	push welcome_prompt
	call print_to_screen

	; loop to print table
	; iter variable will edi
	xor edi, edi ; iter i
	xor edx, edx ; iter j

	; outer loop printable number
	xor ebx,ebx
	; inner loop printable number
	xor ecx,ecx

loop_outer:
	push ebx
	push ecx
	push edx
	push edi

	call get_printable_number

	pop edi
	pop edx
	pop ecx
	pop ebx

	mov ebx,eax

		loop_inner:
			push ebx
			push ecx
			push edi
			push edx

			call get_printable_number

			pop edx ;     restore       
			pop edi ;     older         
			pop ecx ;     state         
			pop ebx ;     :3            

			mov ecx,eax ; get required value

			; pushing to stack for safe keeping
			push ebx
			push ecx
			push edi
			push edx

			; print shit to screen
			push table_len

			mov eax,table_fmt
			add eax,0x0
			mov word [eax], bx
			add eax,0x7    ; should be 0x6 but 0x5 cause one already added
			mov word [eax], cx

			mov eax,edi
			mul edx
			mov ebx,eax

			push ebx
			call get_printable_number
			pop ebx ; stack cleanup
			mov ebx,eax
			mov eax,table_fmt

			add eax,0xc
			mov word [eax], bx

			push table_fmt

			call print_to_screen

			; pop from stack
			pop edx ; cleaning up stack 8|
			pop edx ; cleanung up stack 8|
			pop edx
			pop edi
			pop ecx
			pop ebx

			inc edx
			cmp edx,0xb
			jnz loop_inner

	push banner_len
	push banner
	call print_to_screen
	pop edx ; stack clean up. pop to edx cause it gonna be xor anyway
	pop edx ; stack clean up. pop to edx cause it gonna be xor anyway


	xor edx,edx
	inc edi
	cmp edi,0xa
	jnz loop_outer

	jmp exit



; print number as strings
	;push table_len
	;mov eax,table_fmt
	;add eax,0x1
	;mov word [eax],0x35
	;push table_fmt
	;call print_to_screen

; graceful exit
	jmp exit
	
print_to_screen:
; this function prints buffer to screen
; function prologue and other shit is'nt
; required here. Still here cause idk
	push ebp
	mov ebp,esp
	sub esp,0x10

	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx

	mov eax,0x4 ; syscall to write (0x4)
	mov ebx,0x1 ; writing to stdout
	mov ecx,[ebp+0x8] ; pointer to first argument i.e the buffer
	mov edx,[ebp+0xc] ; length of the string
	int 0x80 ; syscall

	mov esp,ebp
	pop ebp
	ret

clear_var:
; this function clears all the required variables
	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edi,edi
	xor edx,edx

	ret

get_printable_number:
; according to the ascii table
; 0x30 => 0
; 0x31 => 1
; ....
; will handle only two digit number
; div with 10 quotient get one print and remainder gets one
; thus anynumber plus 0x30 will give ascii printable number
; works only for single digit number
; return result in eax

	push ebp
	mov ebp,esp
	sub esp,0x10

	xor eax,eax
	xor ebx,ebx ; => printable_number
	xor ecx,ecx ; => quotient
	xor edx,edx ; => remainder

	mov eax,[ebp+0x8]

	; edx will have the remainder
	mov ebx,0xa
	div ebx
	mov ecx,eax

	add ecx,0x30
	add edx,0x30

	xor ebx,ebx ; => printable_number
	mov byte bl, cl
	mov byte bh, dl

	mov eax,ebx

	mov esp,ebp
	pop ebp
	ret


exit:
; nice exit by calling the exit syscall
	call clear_var
	mov eax,0x1
	mov ebx,0x0
	int 0x80


section .data
	welcome_prompt db "Welcome To The Table Printer.", 0xa, "Written in x86 exclusively for you :D", 0xa
	len equ $ - welcome_prompt

	; will be using as fmt to print tables
	table_fmt db "00  x  00 = 00", 0xa
	table_len equ $ - table_fmt

	; banner for pretty shit
	banner db "==========================", 0xa
	banner_len equ $ - banner
