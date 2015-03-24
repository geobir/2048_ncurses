; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/26 13:19:43 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/26 13:19:43 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_isalpha

_ft_isalpha:
	pushf
	xor		rax, rax
	mov		rdx, rdi
	cmp		rdx, 'A'
	jl		_clear
	cmp		rdx, 'z'
	jg		_clear
	cmp		rdx, 'Z'
	jle		_true
	cmp		rdx, 'a'
	jge		_true
	jmp		_clear
_true:
	add		rax, 1
_clear:
	popf
	ret
