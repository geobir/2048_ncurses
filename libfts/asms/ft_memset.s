; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 06:25:12 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 06:25:12 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_memset

_ft_memset:
	pushf
	cld
	sub		rsp, 8
	mov		[rsp - 8], rdi
	mov		rcx, rdx
	mov		rdx, rsi
	mov		al, dl
	rep
	stosb
_clear:
	mov		rdi, [rsp - 8]
	add		rsp, 8
	mov		rax, rdi
	popf
	ret
