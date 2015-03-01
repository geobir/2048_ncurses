#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/02/27 20:49:27 by mngomane          #+#    #+#              #
#    Updated: 2015/02/27 20:49:27 by mngomane         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

OBJSDIR = bins/

SRCSDIR = srcs/

LIBDIR = libfts/

NAME = game_2048

SRCS =	main.c draw.c inputs.c is_lose.c move.c reset.c rnd_nbr.c draw_info.c \
		is_win.c mult_two.c

OBJS = $(addprefix $(OBJSDIR), $(SRCS:%.c=%.o))

CXX = gcc

CC = /usr/bin/clang

FLAGS = -Wall -Wextra -Werror

HARDCORESFLAGS = -Weverything -Wextra -Werror -Wall -pedantic-errors -std=c89

LIB = -Llibfts -lfts -lncurses

INCS = -Iincs -Ilibfts/incs


.PHONY: all clean fclean re check

all: $(OBJSDIR) $(NAME) check

$(NAME): $(OBJS)
	@$(MAKE) -C $(LIBDIR)
	$(CXX) $(FLAGS) $(LIB) $(INCS) -o $(NAME) $^

$(OBJSDIR):
	mkdir $(OBJSDIR)

check: $(OBJS)
	@$(CC) $(HARDCORESFLAGS) $(LIB) $(INCS) -o $(NAME) $^

$(OBJSDIR)%.o: $(SRCSDIR)%.c
	$(CXX) $(FLAGS) $(INCS) -c $< -o $@
	@$(CC) $(HARDCORESFLAGS) $(INCS) -c $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all
