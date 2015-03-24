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

CTYPE_DIR = ft/ctype/
IO_DIR = ft/io/
MEMORY_DIR = ft/memory/
OBJSDIR = bins
STRING_DIR = ft/string/

NAME = libfts.a


.PHONY: all\
		clean\
		fclean\
		re\
		makeobjs\
		nolib\
		ctype\
		io\
		memory\
		string

all: $(OBJSDIR) makeobjs

$(NAME): $(eval OBJS = $(shell grep -lr . $(OBJSDIR)))
$(NAME): $(OBJS)
	ar -rcs $(NAME) $^

$(OBJSDIR):
	mkdir -pm 0700 $(OBJSDIR)

makeobjs:
	@$(MAKE) -C $(CTYPE_DIR) nolib
	@$(MAKE) -C $(IO_DIR) nolib
	@$(MAKE) -C $(MEMORY_DIR) nolib
	@$(MAKE) -C $(STRING_DIR) nolib
	@$(MAKE) $(NAME)

ctype:
	@$(MAKE) -C $(CTYPE_DIR) nolib
	@$(MAKE) $(NAME)

io:
	@$(MAKE) -C $(IO_DIR) nolib
	@$(MAKE) $(NAME)

memory:
	@$(MAKE) -C $(MEMORY_DIR) nolib
	@$(MAKE) $(NAME)

string:
	@$(MAKE) -C $(MEMORY_DIR) nolib
	@$(MAKE) -C $(STRING_DIR) nolib
	@$(MAKE) $(NAME)

clean:
	@$(MAKE) -C $(CTYPE_DIR) clean
	@$(MAKE) -C $(IO_DIR) clean
	@$(MAKE) -C $(MEMORY_DIR) clean
	@$(MAKE) -C $(STRING_DIR) clean

fclean: clean
	rm -rf $(NAME)

re: fclean all
