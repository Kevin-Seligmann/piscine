/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strlen.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/04 16:22:12 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/04 16:22:20 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

unsigned long	ft_strlen(char *str)
{
	unsigned long	len;

	len = 0;
	while (str[len] != 0)
		len ++;
	return (len);
}
