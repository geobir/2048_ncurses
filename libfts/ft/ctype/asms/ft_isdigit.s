; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/27 23:36:03 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/27 23:36:03 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_isdigit

_ft_isdigit:
	pushf
	xor		rax, rax
	mov		rdx, rdi
	cmp		rdx, '0'
	jl		_clear
	cmp		rdx, '9'
	jle		_true
_clear:
	popf
	ret
_true:
	add		rax, 1
	jmp		_clear
