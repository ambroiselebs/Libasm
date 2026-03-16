/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aberenge <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/10 18:58:33 by aberenge          #+#    #+#             */
/*   Updated: 2025/07/10 19:00:12 by aberenge         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	check_read(char* filename)
{
	int		fd;
	int		r_size;
	char	buffer[100];

	fd = open(filename, O_RDONLY);
	while ((r_size = (ft_read(fd, buffer, sizeof(buffer)))) > 0)
		buffer[r_size] = '\0';
	close(fd);

	printf("Buffer: %s\n\n", buffer);
}

int main(void)
{
	char*   test = "Hello world!\n";
	char    test_cpy[20];
	char*	filename = "test_file";
	char	*dest_strdup = NULL;

	printf("Strlen: %d\n\n", (int) ft_strlen(test));

	ft_strcpy(test_cpy, test);
	printf("Strcpy: %s\n", test_cpy);

	printf("Strcmp: %d\n", ft_strcmp(test, test_cpy));
	test_cpy[2] = 'a';
	printf("Strcmp: %d\n\n", ft_strcmp(test, test_cpy));

	ft_write(1, "Hello world!\n\n", 15);

	check_read(filename);

	dest_strdup = ft_strdup(test);
	printf("Strdup: %s\n", dest_strdup);
}