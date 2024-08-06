/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_map.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/09 12:39:14 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/09 12:39:15 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	wr_num(int nbr);

int	*ft_map(int *tab, int length, int (*f)(int))
{
	int	*res;
	int	ind;

	ind = 0;
	res = (int *)malloc(length * sizeof(int));
	if (res == 0)
		return (0);
	while (ind < length)
	{
		res[ind] = f(tab[ind]);
		ind ++;
	}
	return (res);
}

/*
int	main(void)
{
	int tab[4] = {};
	int	*ans;
	int ind;

	ans = ft_map(tab, 0, *wr_num);
	ind = 0;
	while(ind < 4)
		printf("%d\n", ans[ind++]);
	return (0);
}

int	wr_num(int nbr)
{
	return (nbr * 2);
}
*/
