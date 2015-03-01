; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putchar_fd.s                                    :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/31 21:20:12 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/31 21:20:12 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_putchar_fd

_ft_putchar_fd:
_init:
	pushf
	sub		rsp, 8
	mov		[rsp - 8], rdi
_write:
	mov		rax, 0x2000004
	mov		rdi, rsi
	lea		rsi, [rsp - 8]
	mov		rdx, 1
	syscall
_clear:
	add		rsp, 8
_exit:
	popf
	ret
