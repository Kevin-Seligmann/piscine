/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_is_sort.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/09 13:38:52 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/09 13:38:53 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int	func(int a, int b);

int	ft_is_sort(int *tab, int length, int (*f)(int, int))
{
	int	ind;

	ind = 0;
	while (ind < length - 1)
	{
		if (f(tab[ind], tab[ind + 1]) < 0)
			return (0);
		ind ++;
	}
	return (1);
}

/*
int	main(int argc, char **argv)
{
	int nums[11] = {-5, 2, 4, 6, 9, 9, 0, 9, 10, 10, 11};
	printf("Ordenado %d \n", ft_is_sort(nums, 11, func));
}

int func(int a, int b)
{
	return (b - a);
}
*/
