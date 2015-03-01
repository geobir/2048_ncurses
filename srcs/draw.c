/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   draw.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 17:14:15 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 17:14:15 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include "game_2048.h"

static void			draw_line(int x, int y, int siz_x, u_int nbr)
{
	if (nbr > 12)
		nbr = 12;
	attron(COLOR_PAIR(nbr + 1));
	mvprintw(y, x, "%*s", siz_x, "");
	attroff(COLOR_PAIR(nbr + 1));
}

static void			draw_line_number(int x, int y, int siz_x, u_int nbr)
{
	u_int	m;

	if (nbr > 12)
		attron(COLOR_PAIR(13));
	else
		attron(COLOR_PAIR(nbr + 1));
	if (nbr)
	{
		m = mult_two(nbr);
		if (m >= 1000)
			mvprintw(y, x, "%*d%*s", FLOOR(siz_x) + 2, m, CEIL(siz_x) - 2, "");
		else if (m >= 10)
			mvprintw(y, x, "%*d%*s", FLOOR(siz_x) + 1, m, CEIL(siz_x) - 1, "");
		else
			mvprintw(y, x, "%*d%*s", FLOOR(siz_x), m, CEIL(siz_x), "");
	}
	else
		mvprintw(y, x, "%*s", siz_x, "");
	if (nbr > 12)
		attroff(COLOR_PAIR(13));
	else
		attroff(COLOR_PAIR(13));
}

static void			draw_case(t_vec c_xy, t_vec ca_siz, u_int n)
{
	t_vec		c;

	c.y = c_xy.y + 1;
	while (c.y < ca_siz.y + c_xy.y)
	{
		if (c.y % ca_siz.y == ca_siz.y / 2)
			draw_line_number((int)c_xy.x + 1, (int)c.y, (int)ca_siz.x - 2, n);
		else
			draw_line((int)c_xy.x + 1, (int)c.y, (int)ca_siz.x - 2, n);
		++c.y;
	}
}

void				draw_map(t_vec ca_siz, u_int *map)
{
	t_vec		cur_xy;
	t_vec		cur;

	cur_xy.y = 0;
	cur.y = 0;
	while (cur.y < XY_MAP)
	{
		cur_xy.x = 0;
		cur.x = 0;
		while (cur.x < XY_MAP)
		{
			draw_case(cur_xy, ca_siz, map[cur.y * XY_MAP + cur.x]);
			cur_xy.x += ca_siz.x;
			++cur.x;
		}
		cur_xy.y += ca_siz.y;
		++cur.y;
	}
	refresh();
}
