; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/01/28 19:34:32 by mngomane          #+#    #+#              ;
;    Updated: 2015/01/28 19:34:32 by mngomane         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section		.text
	global	_ft_memcpy

_ft_memcpy:
	pushf
	push	rcx
	push	rdx
	cld
	mov		rcx, rdx
	rep
	movsb
_clear:
	pop		rdx
	pop		rcx
	popf
	ret
