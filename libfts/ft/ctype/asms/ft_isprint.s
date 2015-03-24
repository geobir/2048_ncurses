; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 01:50:15 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 01:50:15 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_isprint

_ft_isprint:
	pushf
	xor		rax, rax
	mov		rdx, rdi
	cmp		rdx, 32
	jl		_clear
	cmp		rdx, 126
	jg		_clear
	add		rax, 1
_clear:
	popf
	ret
