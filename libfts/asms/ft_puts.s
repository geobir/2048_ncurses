; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 02:54:47 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 02:54:47 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.data
	_new_line:	db	0ah
	_null:		db	"(null)"

section		.text
	global	_ft_puts

_ft_puts:
	pushf
	xor		rdx, rdx
	mov		rax, 0x2000004
	mov		rsi, rdi
_null_check:
	cmp		rdi, 0
	je		_print_null
_len:
	cmp		byte[rdi], 0
	je		_print
	add		rdx, 1
	add		rdi, 1
	jmp		_len
_print:
	mov		rdi, 1
	syscall
_print_new_line:
	mov		rax, 0x2000004
	mov		rdi, 1
	lea		rsi, [rel _new_line]
	mov		rdx, 1
	syscall
	mov		rax, 0ah
	jmp		_clear
_clear:
	popf
	ret
_print_null:
	mov		rax, 0x2000004
	mov		rdi, 1
	lea		rsi, [rel _null]
	mov		rdx, 6
	syscall
	jmp		_print_new_line
