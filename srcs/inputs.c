/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   inputs.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/28 23:33:44 by gbir              #+#    #+#             */
/*   Updated: 2015/02/28 23:33:44 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include "game_2048.h"

int				inputs(int *win, u_int *map)
{
	int		c;

	c = 0;
	timeout(0);
	c = getch();
	if (c == KEY_UP || c == 'w')
		move_map(1, map);
	else if (c == KEY_RIGHT || c == 'd')
		move_map(2, map);
	else if (c == KEY_DOWN || c == 's')
		move_map(3, map);
	else if (c == KEY_LEFT || c == 'a')
		move_map(4, map);
	else if (c == 'n' || c == 'r')
		reset_game(win, map);
	else if (c == ESCAPE || c == 'q')
		return (0);
	return (-1);
}
