; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 19:46:29 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 19:46:29 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_strdup

extern		_malloc, _ft_strlen

_ft_strdup:
	pushf
	sub		rsp, 16
	mov		[rsp - 8], r12
	mov		[rsp - 16], r13
	mov		r12, rdi
	call	_ft_strlen
	mov		rcx, rax
	mov		rdi, rcx
	mov		r13, rcx
	call	_malloc
	mov		rcx, r13
	mov		rdi, rax
	mov		rsi, r12
	rep
	movsb
_clear:
	mov		r13, [rsp - 16]
	mov		r12, [rsp - 8]
	add		rsp, 16
	popf
	ret
