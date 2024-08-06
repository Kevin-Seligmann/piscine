/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   display_file.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kseligma <kseligma@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/07 20:25:41 by kseligma          #+#    #+#             */
/*   Updated: 2023/11/07 20:25:51 by kseligma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int	main(int argc, char **argv)
{
	int 	file_desc;
	int		bytes;
	char	c[1];

	if (argc == 1)
		write(2, "File name missing.\n", 19);
	if (argc > 2)
		write(2, "Too many arguments.\n", 20);
	if (argc == 1 || argc > 2)
		return (0);

	file_desc = open(argv[1], 0);
	if (file_desc == -1)
	{
		write(2, "Cannot read file.\n", 18);
		return (0);
	}
	bytes = 1;
	while(bytes > 0)
	{
		bytes = read(file_desc, c, 1);
		if (bytes == -1)
		{
			write(2, "Cannot read file.\n", 18);
			return (0);
		}
		if (bytes != 0)
			write(1, c, 1);
	}
	return (0);
}
