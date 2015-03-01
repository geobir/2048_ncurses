; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putstr_fd.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/02/02 01:28:34 by mngomane          #+#    #+#              ;
;    Updated: 2015/02/02 01:28:34 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_putstr_fd

_ft_putstr_fd:
	pushf
	xor		rdx, rdx
	mov		rax, 0x2000004
_len:
	cmp		byte[rdi], 0
	je		_switch_check
	add		rdx, 1
	add		rdi, 1
	jmp		_len
_switch_check:
	cmp		rdi, rsi
	je		_switch_end
_switch_start:
	xor		rdi, rsi
	xor		rsi, rdi
	xor		rdi, rsi
_switch_end:
	syscall
_clear:
	popf
	ret
