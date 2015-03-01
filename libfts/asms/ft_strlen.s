; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 06:15:52 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 06:15:52 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_strlen

_ft_strlen:
	pushf
	cld
	sub		rsp, 8
	mov		[rsp - 8], rdi
	mov		rcx, -1
	xor		rax, rax
	repne
	scasb
_len:
	mov		rax, -2
	sub		rax, rcx
_clear:
	mov		rdi, [rsp - 8]
	add		rsp, 8
	popf
	ret
