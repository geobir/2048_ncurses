/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_io.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/24 14:35:15 by mngomane          #+#    #+#             */
/*   Updated: 2015/03/24 14:35:15 by mngomane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_IO_H
# define FT_IO_H

extern void		ft_cat(int fd);
extern int		ft_putchar_fd(const char c, const int fd);
extern int		ft_puthex(const int c, const int fd);
extern int		ft_puts(const char *s);
extern int		ft_putstr(const char *s);
extern int		ft_putstr_fd(const char *s, const int fd);

#endif
