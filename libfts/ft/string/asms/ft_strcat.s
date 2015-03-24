; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 04:04:51 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 04:04:51 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_strcat

_ft_strcat:
	pushf
	sub		rsp, 8
	mov		[rsp - 8], rsi
	xor		rcx, rcx
	mov		rax, rdi
_jump_null:
	cmp		byte[rdi], 0
	je		_size
	add		rdi, 1
	jmp		_jump_null
_size:
	cmp		byte[rsi], 0
	je		_jump_exit
	add		rcx, 1
	add		rsi, 1
	jmp		_size
_jump_exit:
	mov		rsi, [rsp - 8]
	rep
	movsb
	jmp		_clear
_clear:
	movsb
	add		rsp, 8
	popf
	ret
