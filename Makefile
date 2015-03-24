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

SRCS = $(notdir $(shell grep -rl . $(SRCSDIR)))

OBJS = $(addprefix $(OBJSDIR), $(SRCS:%.c=%.o))

CXX = gcc

CC = /usr/bin/clang

FLAGS = -Wall -Wextra -Werror

HARDCORESFLAGS = -Weverything -Wextra -Werror -Wall -pedantic-errors -std=c89

LIB = -Llibfts -lfts -lncurses

INCS = -Iinclude -Ilibfts/include


.PHONY: all clean fclean re check string

all: $(OBJSDIR) $(NAME) check

$(NAME): $(OBJS)
	@$(MAKE) -C $(LIBDIR) string
	$(CXX) $(FLAGS) $(LIB) $(INCS) -o $(NAME) $^

$(OBJSDIR):
	mkdir -pm 0700 $(OBJSDIR)

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
