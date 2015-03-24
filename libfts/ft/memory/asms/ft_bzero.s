; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 03:55:17 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 03:55:17 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_bzero

_ft_bzero:
	cmp		rsi, 0
	je		_clear
	mov		byte[rdi], 0
	add		rdi, 1
	sub		rsi, 1
	jmp		_ft_bzero
_clear:
	ret
