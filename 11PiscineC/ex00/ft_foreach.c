/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_foreach.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/09 12:33:02 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/09 12:33:08 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

void	wr_num(int nbr);

void	ft_foreach(int *tab, int length, void (*f)(int))
{
	int	ind;

	while (ind < length)
		f(tab[ind++]);
}

/*
int	main(void)
{
	int tab[4] = {123, 22, 512, 37};

	ft_foreach(tab, 3, *wr_num);
	return (0);
}

void	wr_num(int nbr)
{
	printf("%d\n", nbr);

}
*/
