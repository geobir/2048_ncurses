/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   draw_info.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 23:35:53 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 23:35:53 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include "game_2048.h"

void		draw_info(char *str)
{
	t_vec			max;

	getmaxyx(stdscr, max.y, max.x);
	attron(COLOR_PAIR(20));
	mvprintw(FLOOR(max.y) - 1, 0, "%*s", max.x, "");
	mvprintw(FLOOR(max.y), 0, "%*s%*s", FLOOR(max.x) + ft_strlen(str) / 2,
			str, CEIL(max.x) - ft_strlen(str) / 2, "");
	mvprintw(FLOOR(max.y) + 1, 0, "%*s", max.x, "");
	attroff(COLOR_PAIR(20));
	refresh();
}
