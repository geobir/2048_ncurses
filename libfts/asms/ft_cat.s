; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 23:27:05 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 23:27:05 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.bss
	tmp:	resq	512
	.len	equ		$ - tmp

section		.text
	global	_ft_cat

_ft_cat:
	pushf
	sub		rsp, 24
	mov		[rsp - 8], r12
	mov		[rsp - 16], r13
	mov		[rsp - 24], r14
	mov		r14, rdi
_read:
	lea		rsi, [rel tmp]
	mov		rdx, tmp.len
	mov		rax, 0x2000003
	syscall
_save:
	mov		r12, rax
	mov		r13, rsi
_display:
	mov		rdi, 1
	lea		rsi, [rel r13]
	mov		rdx, r12
	mov		rax, 0x2000004
	syscall
_check:
	cmp		rax, 00h
	je		_clear
	cmp		r14, 00h
	je		_read
_clear:
	mov		r14, [rsp - 24]
	mov		r13, [rsp - 16]
	mov		r12, [rsp - 8]
	add		rsp, 24
	popf
	ret
