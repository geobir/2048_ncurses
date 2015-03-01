/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   is_win.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 23:33:20 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 23:33:20 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include <unistd.h>
#include "game_2048.h"

static int		win_screen(u_int *map)
{
	t_vec			max;
	t_vec			size;
	int				c;

	getmaxyx(stdscr, max.y, max.x);
	size.x = max.x / XY_MAP;
	size.y = max.y / XY_MAP;
	draw_map(size, map);
	draw_info(WIN_MSG);
	while (42)
	{
		c = getch();
		if (c == ESCAPE || c == 'q')
			return (1);
		else if (c == 'c')
			return (0);
	}
}

static u_int	is_mult(uint nbr)
{
	uint	cur;
	uint	i;

	cur = 1;
	i = 0;
	while (cur <= nbr)
	{
		if (cur == nbr)
			return (i);
		++i;
		cur <<= 1;
	}
	return (0);
}

int				is_win(int *win, u_int *map)
{
	int		cur;
	u_int	mul;

	if (*win == 0)
	{
		mul = 0;
		if ((mul = is_mult(WIN_VALUE)) == 0)
		{
			draw_info(ERR_XYWIN);
			sleep(4);
			return (1);
		}
		cur = 0;
		while (cur < MAPSIZE)
		{
			if (map[cur++] >= mul)
			{
				*win = 1;
				return (win_screen(map));
			}
		}
	}
	return (0);
}
