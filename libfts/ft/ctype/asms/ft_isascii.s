; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 01:39:15 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 01:39:15 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_isascii

_ft_isascii:
	pushf
	xor		rax, rax
	mov		rdx, rdi
	cmp		rdx, 0
	jl		_clear
	cmp		rdx, 127
	jg		_clear
	add		rax, 1
_clear:
	popf
	ret
