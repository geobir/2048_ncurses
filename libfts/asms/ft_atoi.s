; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/31 04:25:59 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/31 04:25:59 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_atoi

extern		_ft_prefixtrim, _ft_isdigit

_ft_atoi:
	pushf
	sub		rsp, 32
	mov		[rsp - 8], r12
	mov		[rsp - 16], r13
	mov		[rsp - 24], r14
	mov		[rsp - 32], r15
	xor		rax, rax
	xor		r12, r12; result
	mov		r13, rdi; string save
	xor		r14, r14; sign
	call	_ft_prefixtrim
	mov		r15, rax; string prefixtrimed
	xor		rax, rax

_get_sign:
	cmp		byte[r15], '+'
	je		_sign_found
	cmp		byte[r15], '-'
	je		_minus_found
	movzx	rdi, byte[r15]
	call	_ft_isdigit
	cmp		rax, 0
	je		_clear

_loop:
	movzx	rdi, byte[r15]
	call	_ft_isdigit
	cmp		rax, 0
	je		_sign_assign
	imul	r12, 10
	xor		rax, rax
	movzx	rax, byte[r15]
	add		r12, rax
	sub		r12, '0'
	add		r15, 1
	jmp		_loop

_sign_assign:
	cmp		r14, 1
	je		_negative

_clear:
	mov		rdi, r13
	mov		rax, r12
	mov		r15, [rsp - 32]
	mov		r14, [rsp - 24]
	mov		r13, [rsp - 16]
	mov		r12, [rsp - 8]
	add		rsp, 32
	popf
	ret

_minus_found:
	mov		r14, 1

_sign_found:
	add		r15, 1
	jmp		_loop

_negative:
	neg		r12
	jmp		_clear
