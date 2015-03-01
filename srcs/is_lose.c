/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   is_lose.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 23:33:20 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 23:33:20 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include "game_2048.h"

static int		lose_screen(int *win, u_int *map)
{
	t_vec			max;
	t_vec			size;
	int				c;

	getmaxyx(stdscr, max.y, max.x);
	size.x = max.x / XY_MAP;
	size.y = max.y / XY_MAP;
	draw_map(size, map);
	draw_info(LOSE_MSG);
	while (42)
	{
		c = getch();
		if (c == ESCAPE || c == 'q')
			return (1);
		else if (c == 'n')
		{
			reset_game(win, map);
			return (0);
		}
	}
}

static int		available_move(u_int *map, u_int cur)
{
	if ((cur % XY_MAP) < (XY_MAP - 1))
	{
		if (map[cur] == map[cur + 1])
			return (1);
	}
	if (cur < MAPSIZE - XY_MAP)
	{
		if (map[cur] == map[cur + XY_MAP])
			return (1);
	}
	return (0);
}

int				is_lose(int *win, u_int *map)
{
	u_int	cur;
	u_int	check;

	check = MAPSIZE - 1;
	cur = 0;
	while (cur < check + 1)
	{
		if (map[cur] > 28)
			return (lose_screen(win, map));
		if (map[cur++] == 0)
			return (0);
	}
	cur = 0;
	while (cur < check)
	{
		if (available_move(map, cur))
			return (0);
		++cur;
	}
	return (lose_screen(win, map));
}
