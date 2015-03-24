; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 02:45:14 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 02:45:14 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_tolower

_ft_tolower:
	pushf
	mov		rdx, rdi
	cmp		rdx, 'A'
	jl		_clear
	cmp		rdx, 'Z'
	jg		_clear
_lower:
	add		rdx, 'm'
	sub		rdx, 'M'
_clear:
	mov		rax, rdx
	popf
	ret
