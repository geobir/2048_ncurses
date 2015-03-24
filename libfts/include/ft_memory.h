/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memory.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/24 14:36:18 by mngomane          #+#    #+#             */
/*   Updated: 2015/03/24 14:36:18 by mngomane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_MEMORY_H
# define FT_MEMORY_H

# include <sys/types.h>

extern void		ft_bzero(void *s, size_t n);
extern void		*ft_memset(void *b, int c, size_t len);
extern void		*ft_memcpy(void *dst, const void *src, size_t n);

#endif
