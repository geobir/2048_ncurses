#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:51:00 by mngomane          #+#    #+#              #
#    Updated: 2015/03/24 14:51:00 by mngomane         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

OBJSDIR = ../../bins/

ASMSDIR = asms/

NAME = ../../libfts.a

ASMS = $(notdir $(shell grep -rl . $(ASMSDIR)))

OBJS = $(addprefix $(OBJSDIR), $(ASMS:%.s=%.o))

CC = nasm

FLAGS = -f macho64


.PHONY: all clean fclean re nolib

all: $(OBJSDIR) $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $^
	ranlib $(NAME)

nolib: $(OBJSDIR) $(OBJS)

$(OBJSDIR):
	mkdir -pm 0700 $(OBJSDIR)

$(OBJSDIR)%.o: $(ASMSDIR)%.s
	$(CC) $(FLAGS) $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all
