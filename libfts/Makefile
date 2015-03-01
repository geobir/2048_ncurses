#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/28 00:43:23 by mngomane          #+#    #+#              #
#    Updated: 2015/01/28 00:43:23 by mngomane         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

OBJSDIR = bins/

ASMSDIR = asms/

NAME = libfts.a

ASMS = ft_bzero.s\
		ft_strcat.s\
		ft_isalpha.s\
		ft_isdigit.s\
		ft_isalnum.s\
		ft_isascii.s\
		ft_isprint.s\
		ft_toupper.s\
		ft_tolower.s\
		ft_puts.s\
		ft_strlen.s\
		ft_memset.s\
		ft_memcpy.s\
		ft_strdup.s\
		ft_cat.s\
		ft_putstr.s\
		ft_prefixtrim.s\
		ft_atoi.s\
		ft_putchar_fd.s\
		ft_puthex.s\
		ft_putstr_fd.s

OBJS = $(addprefix $(OBJSDIR), $(ASMS:%.s=%.o))

CC = nasm

FLAGS = -f macho64


.PHONY: all clean fclean re

all: $(OBJSDIR) $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $^
	ranlib $(NAME)

$(OBJSDIR):
	mkdir $(OBJSDIR)

$(OBJSDIR)%.o: $(ASMSDIR)%.s
	$(CC) $(FLAGS) $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all
