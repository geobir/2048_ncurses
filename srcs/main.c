/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/27 20:51:19 by mngomane          #+#    #+#             */
/*   Updated: 2015/02/27 20:51:19 by mngomane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ncurses.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include "game_2048.h"

static void		init_colors(void)
{
	start_color();
	if (can_change_color())
	{
		init_color(BG_GAME, 186 * 4, 172 * 4, 160 * 4);
		init_color(COLOR_TEXT, 120 * 4, 107 * 4, 102 * 4);
		init_color(COLOR_WHITE, 250 * 4, 250 * 4, 250 * 4);
		init_color(BG_0, 204 * 4, 193 * 4, 180 * 4);
		init_color(BG_2, 237 * 4, 228 * 4, 218 * 4);
		init_color(BG_4, 235 * 4, 223 * 4, 202 * 4);
		init_color(BG_8, 237 * 4, 177 * 4, 128 * 4);
		init_color(BG_16, 245 * 4, 149 * 4, 98 * 4);
		init_color(BG_32, 242 * 4, 124 * 4, 94 * 4);
		init_color(BG_64, 245 * 4, 94 * 4, 56 * 4);
		init_color(BG_128, 235 * 4, 204 * 4, 113 * 4);
		init_color(BG_256, 235 * 4, 197 * 4, 103 * 4);
		init_color(BG_512, 235 * 4, 198 * 4, 80 * 4);
		init_color(BG_1024, 235 * 4, 194 * 4, 70 * 4);
		init_color(BG_2048, 237 * 4, 193 * 4, 47 * 4);
		init_color(BG_4096, 250 * 4, 249 * 4, 155 * 4);
	}
}

static void		init_ncurses(void)
{
	initscr();
	init_colors();
	init_pair(1, COLOR_TEXT, BG_0);
	init_pair(2, COLOR_TEXT, BG_2);
	init_pair(3, COLOR_TEXT, BG_4);
	init_pair(4, COLOR_WHITE, BG_8);
	init_pair(5, COLOR_WHITE, BG_16);
	init_pair(6, COLOR_WHITE, BG_32);
	init_pair(7, COLOR_WHITE, BG_64);
	init_pair(8, COLOR_WHITE, BG_128);
	init_pair(9, COLOR_WHITE, BG_256);
	init_pair(10, COLOR_WHITE, BG_512);
	init_pair(11, COLOR_WHITE, BG_1024);
	init_pair(12, COLOR_WHITE, BG_2048);
	init_pair(13, COLOR_TEXT, BG_4096);
	init_pair(20, COLOR_WHITE, COLOR_TEXT);
	init_pair(21, COLOR_WHITE, BG_GAME);
	curs_set(0);
	keypad(stdscr, TRUE);
	noecho();
}

static int		game_loop(void)
{
	t_vec		max;
	t_vec		size;
	int			cur;
	int			w;
	u_int		map[MAPSIZE];

	reset_game(&w, map);
	while (42)
	{
		getmaxyx(stdscr, max.y, max.x);
		size.x = max.x / XY_MAP;
		size.y = max.y / XY_MAP;
		cur = -1;
		attron(COLOR_PAIR(21));
		while ((u_int)++cur < max.y)
			mvprintw(cur, 0, "%*s", max.x, "");
		attroff(COLOR_PAIR(21));
		if (max.x < XY_MAP * 6 || max.y < XY_MAP * 3)
			return (-1);
		draw_map(size, map);
		if (inputs(&w, map) == 0 || is_lose(&w, map) == 1 ||
			(!w && is_win(&w, map) == 1))
			break ;
	}
	return (0);
}

int				main(void)
{
	int		ret;
	int		secure_check;

	secure_check = XY_MAP;
	if (secure_check < 2 || secure_check > 20)
	{
		write(1, ERR_XY, sizeof(ERR_XY));
		return (-1);
	}
	srand((u_int)time((void *)0));
	init_ncurses();
	ret = game_loop();
	endwin();
	if (ret == -1)
		write(1, ERR_WIN, sizeof(ERR_WIN));
	return (0);
}
