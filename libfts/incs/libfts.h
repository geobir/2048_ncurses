/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/01/30 21:09:16 by mngomane          #+#    #+#             */
/*   Updated: 2015/01/30 21:09:16 by mngomane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

# include <stddef.h>

extern void		ft_bzero(void *s, size_t n);
extern char		*ft_strcat(char *s1, const char *s2);
extern int		ft_isalpha(int c);
extern int		ft_isdigit(int c);
extern int		ft_isalnum(int c);
extern int		ft_isascii(int c);
extern int		ft_isprint(int c);
extern int		ft_toupper(int c);
extern int		ft_tolower(int c);
extern int		ft_puts(const char *s);
extern size_t	ft_strlen(const char *s);
extern void		*ft_memset(void *b, int c, size_t len);
extern void		*ft_memcpy(void *dst, const void *src, size_t n);
extern char		*ft_strdup(const char *s1);
extern void		ft_cat(int fd);
extern int		ft_putstr(const char *s);
extern char		*ft_prefixtrim(const char *str);
extern int		ft_atoi(const char *str);
extern int		ft_putchar_fd(const char c, const int fd);
extern int		ft_puthex(const int c, const int fd);
extern int		ft_putstr_fd(const char *s, const int fd);
extern int		ft_putnbr(const int nbr);

#endif
