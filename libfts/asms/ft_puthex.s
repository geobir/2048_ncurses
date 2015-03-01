; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puthex.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/02/01 04:37:51 by mngomane          #+#    #+#              ;
;    Updated: 2015/02/01 04:37:51 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_puthex

_ft_puthex:
_init:
	pushf
	sub		rsp, 8
	mov		[rsp - 8], rdi
	mov		rdi, rsi
_write:
	lea		rsi, [rsp - 5]
	mov		rax, 0x2000004
	mov		rdx, 1
	syscall

	lea		rsi, [rsp - 6]
	mov		rax, 0x2000004
	mov		rdx, 1
	syscall

	lea		rsi, [rsp - 7]
	mov		rax, 0x2000004
	mov		rdx, 1
	syscall

	lea		rsi, [rsp - 8]
	mov		rax, 0x2000004
	mov		rdx, 1
	syscall
_clear:
	add		rsp, 8
	popf
_exit:
	ret
