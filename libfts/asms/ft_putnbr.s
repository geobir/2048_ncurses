; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putnbr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/02/08 17:39:44 by mngomane          #+#    #+#              ;
;    Updated: 2015/02/08 17:39:44 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.bss
	tmp:	resq	1

section		.data
	base:	db		"0"
	.len:			equ		$ - base

section		.text
	global	_ft_putnbr

_ft_putnbr:
	push	r12; decim
	push	r13; base
	push	r14; 10
	push	r15; rdi save
	push	rbx
	mov		rdx, rdi; result
	mov		r15, rdi
	lea		r13, [rel base]
	mov		r14, 10
	xor		rax, rax
	mov		r12, 1

_loop_decim:
	xor		rdx, rdx
	mov		rax, r15
	idiv	r12
	cmp		rax, 9
	jle		_test
	imul	r12, 10
	jmp		_loop_decim

_test:
	xor		rdx, rdx
	mov		rax, r15
	idiv	r12
	mov		rdx, rax
	mov		rbx, rax
	xor		r13, r13
	lea		r13, [rel base]
	add		byte[r13], dl
	mov		rbx, r12
	imul	rbx, rdx

_display:
	mov		rax, 0x2000004
	mov		rdi, 1
	mov		rsi, r13
	mov		rdx, 1
	syscall
	sub		r15, rbx
	mov		rax, r12
	idiv	r14
	mov		r12, rax
	; cmp		r12, 0
	; je		_toto
	; jmp		_test

_toto:

	mov		rax, r13

_clear:
	pop		rbx
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	ret
