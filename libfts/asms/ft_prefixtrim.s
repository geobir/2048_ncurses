; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_prefixtrim.s                                    :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/31 03:25:39 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/31 03:25:39 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_prefixtrim

_ft_prefixtrim:
	pushf
	sub		rsp, 8
	mov		[rsp - 8], rdi
_loop:
	test	byte[rdi], ' '
	je		_trim
	test	byte[rdi], '\t'
	je		_trim
	test	byte[rdi], '\r'
	je		_trim
	test	byte[rdi], '\v'
	je		_trim
	test	byte[rdi], '\f'
	je		_trim
	test	byte[rdi], '\n'
	je		_trim
_clear:
	mov		rax, rdi
	mov		rdi, [rsp - 8]
	add		rsp, 8
	popf
	ret
_trim:
	cmp		byte[rdi], 0
	je		_clear
	add		rdi, 1
	jmp		_loop
