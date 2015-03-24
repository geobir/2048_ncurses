; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 02:16:21 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 02:16:21 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_toupper

_ft_toupper:
	pushf
	mov		rdx, rdi
	cmp		rdx, 'a'
	jl		_clear
	cmp		rdx, 'z'
	jg		_clear
_upper:
	add		rdx, 'M'
	sub		rdx, 'm'
_clear:
	mov		rax, rdx
	popf
	ret
