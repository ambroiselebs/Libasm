#include "libasm.h"

void	check_strlen(char* str)
{
	printf("Real strlen: %d\n", (int) strlen(str));
	printf("ASM strlen: %d\n\n", (int) ft_strlen(str));
}

void	check_strcpy(char* s1, char* s2)
{
	printf("Str2 before strcpy: %s\n", s2);
	ft_strcpy(s2, s1);
	printf("Str2 after strcpy: %s\n\n", s2);
}

void	check_strcmp(char* s1, char* s2)
{
	ft_strcpy(s2, s1);

	printf("Real strcmp: %d\n", strcmp(s1, s2));
	printf("ASM strcmp: %d\n", ft_strcmp(s1, s2));

	s2[2] = 'a';

	printf("Real strcmp: %d\n", strcmp(s1, s2));
	printf("ASM strcmp: %d\n\n", ft_strcmp(s1, s2));
}

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

	check_strlen(test);

	check_strcpy(test, test_cpy);

	check_strcmp(test, test_cpy);

	ft_write(1, "Hello world!\n\n", 15);

	check_read(filename);

	dest_strdup = ft_strdup(test);
	printf("Strdup: %s\n", dest_strdup);
}
