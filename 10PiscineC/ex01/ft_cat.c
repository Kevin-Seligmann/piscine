/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_cat.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/08 18:17:23 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/08 18:17:31 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/errno.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

void    ft_read(char *file);
void	ft_putstr(char *str);

int main (int argc, char **argv)
{
	int reads;

	reads = 1;
	if (argc == 1)
		ft_read("-");
	while(reads < argc)
	{
//		if(argv[reads][0] == '-')
//			parse_options(argv[reads]);
//		else
//		{
			ft_read(argv[reads]);
			reads ++;
//		}
	}
	return (0);
}

void	ft_read(char *file)
{
	char c[30000];
	int	br;
	int fd;

	if (*file == '-' && *(file + 1) == 0)
	{
		while(read(0, c, 30000))
		{
			ft_putstr(c);
			c[0] = 0;
		}
	}
	else
	{
		fd = open(file, 0);
		if (fd == -1)
			printf("Error 1\n");
		br = read(fd, c, 30000);
		if (br == -1)
			printf("Error 2\n");
		ft_putstr(c);
		close(fd);
	}
}

void ft_putstr(char *str)
{
	while(*str != 0)
		write(1, str++, 1);
}
