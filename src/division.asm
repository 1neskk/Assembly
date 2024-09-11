section .bss
	buffer resb 500

section .text
	global _start

_start:
	mov r10, 500
	shr r10, 1

	mov rsi, buffer
	mov rax, r10
	call int_to_string

	mov byte [rsi + rbx], 0xa ; assign new-line to buffer[rbx]
	inc rbx

	mov rax, 1
	mov rdi, 1
	mov rsi, buffer
	mov rdx, rbx
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall

int_to_string:
	mov rcx, 10
	xor rbx, rbx

.loop:
	xor rdx, rdx
	div rcx
	add dl, '0'
	mov [rsi + rbx], dl
	inc rbx
	test rax, rax
	jnz .loop ; if (rax != 0) goto .loop

	mov rdi, rsi ; rdi is the start of the buffer
	mov rdx, rbx ; rbx is the length of the buffer

	dec rdx ; rbx - 1 (last index of the buffer)

.reverse:
	lea rax, [rsi + rdx]
	cmp rdi, rax
	jge .done_reversing ; if (rdi >= rsi + rdx) goto .done_reversing

	mov al, [rdi]
	mov bl, [rsi + rdx]

	mov [rdi], bl
	mov [rsi + rdx], al

	inc rdi
	dec rdx
	jmp .reverse

.done_reversing:
	ret
