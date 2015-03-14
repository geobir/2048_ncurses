/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   game_2048.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mngomane <mngomane@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/27 20:49:30 by mngomane          #+#    #+#             */
/*   Updated: 2015/02/27 20:49:30 by mngomane         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GAME_2048_H
# define GAME_2048_H

# include <sys/types.h>
# include "libfts.h"

# define XY_MAP		4
# define MAPSIZE	(XY_MAP * XY_MAP)

# define ESCAPE		27
# define FLOOR(x)	(x / 2)
# define CEIL(x)	(x - FLOOR(x))

# define BG_GAME	10
# define COLOR_TEXT	11

# define BG_0		15
# define BG_2		16
# define BG_4		17
# define BG_8		18
# define BG_16		19
# define BG_32		20
# define BG_64		21
# define BG_128		22
# define BG_256		23
# define BG_512		24
# define BG_1024	25
# define BG_2048	26
# define BG_4096	27

# define ERR_XY		"Error with XY_MAP size.\n"
# define ERR_XYWIN	"Error with XY_MAP size."
# define ERR_WIN	"Error: window is to small.\n"
# define LOSE_MSG	"You Lose, Quit or launch a new Game"
# define WIN_MSG	"You Win, Quit or Continue the Game"

enum				e_const
{
	WIN_VALUE = 2048
};

typedef struct		s_vec
{
	u_int			x;
	u_int			y;
}					t_vec;

void				rnd_nbr(u_int *map);
u_int				mult_two(u_int nbr);
int					inputs(int *win, u_int *map);
int					is_lose(int *win, u_int *map);
int					is_win(int *win, u_int *map);
void				move_map(int key, u_int *map);
void				reset_game(int *win, u_int *map);
void				draw_info(char *str);
void				draw_map(t_vec case_size, u_int *map);

#endif
