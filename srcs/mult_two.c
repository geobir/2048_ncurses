/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mult_two.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbir <gbir@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/01 12:46:20 by gbir              #+#    #+#             */
/*   Updated: 2015/03/01 12:46:20 by gbir             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "game_2048.h"

u_int	mult_two(u_int nbr)
{
	u_int	ret;

	ret = 1;
	return (ret << nbr);
}