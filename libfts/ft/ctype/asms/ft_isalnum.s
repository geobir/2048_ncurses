; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/27 23:56:15 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/27 23:56:15 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_isalnum

extern		_ft_isalpha
extern		_ft_isdigit

_ft_isalnum:
	pushf
	xor		rax, rax
	call	_ft_isalpha
	cmp		rax, 1
	je		_clear
	call	_ft_isdigit
_clear:
	popf
	ret
