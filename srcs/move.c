/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   move.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 17:02:58 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 17:03:01 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "game_2048.h"

static void		move_one(u_int *map, int *do_something)
{
	u_int	cur;

	cur = XY_MAP;
	while (cur < MAPSIZE)
	{
		if (map[cur] && map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP] == 0)
		{
			map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP] = map[cur];
			map[cur] = 0;
			*do_something = 1;
		}
		++cur;
	}
}

static void		fusion(u_int *map, int *do_something)
{
	u_int	cur;

	cur = XY_MAP;
	while (cur < MAPSIZE)
	{
		if (map[cur] &&
			map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP] == map[cur])
		{
			map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP]++;
			map[cur] = 0;
			*do_something = 1;
		}
		++cur;
	}
}

static void		move(u_int *map)
{
	u_int	cur;
	int		do_something;

	do_something = 0;
	cur = XY_MAP;
	while (cur < MAPSIZE)
	{
		if (map[cur] && map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP] == 0)
		{
			map[(cur / XY_MAP - 1) * XY_MAP + cur % XY_MAP] = map[cur];
			map[cur] = 0;
			cur = XY_MAP;
			do_something = 1;
		}
		else
			++cur;
	}
	fusion(map, &do_something);
	move_one(map, &do_something);
	if (do_something)
		rnd_nbr(map);
}

static void		rotate_map(u_int *map, int8_t repeat)
{
	u_int	*cpymap;
	int		y;
	int		x;

	while (repeat--)
	{
		cpymap = (u_int *)malloc(sizeof(u_int) * MAPSIZE);
		if (!cpymap)
			return ;
		y = -1;
		while (++y < MAPSIZE)
			cpymap[y] = map[y];
		y = -1;
		while (++y < XY_MAP)
		{
			x = 0;
			while (x < XY_MAP)
			{
				map[y * XY_MAP + x] = cpymap[(XY_MAP - x - 1) * XY_MAP + y];
				++x;
			}
		}
		free(cpymap);
	}
}

void			move_map(int key, u_int *map)
{
	if (key == 1)
		move(map);
	else if (key == 2)
	{
		rotate_map(map, 3);
		move(map);
		rotate_map(map, 1);
	}
	else if (key == 3)
	{
		rotate_map(map, 2);
		move(map);
		rotate_map(map, 2);
	}
	else if (key == 4)
	{
		rotate_map(map, 1);
		move(map);
		rotate_map(map, 3);
	}
}
