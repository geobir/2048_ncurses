; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putstr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/31 01:24:33 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/31 01:24:33 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_putstr

_ft_putstr:
	pushf
	xor		rdx, rdx
	mov		rax, 0x2000004
	mov		rsi, rdi
_len:
	cmp		byte[rdi], 0
	je		_print
	add		rdx, 1
	add		rdi, 1
	jmp		_len
_print:
	mov		rdi, 1
	syscall
_clear:
	popf
	ret
