CC = cc
CFLAGS = -Wall -Wextra -Werror
NASM = nasm
NASMFLAGS = -f elf64
# Noms des sorties
NAME = libasm.a
EXEC = test

# Fichiers sources et objets
SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS = $(SRCS:.s=.o)

MAIN_SRC = main.c
MAIN_OBJ = $(MAIN_SRC:.c=.o)

# --- RÈGLES ---

# Règle par défaut : Compile la lib ET l'exécutable
all : $(NAME) $(EXEC)

# Création de la bibliothèque statique
$(NAME) : $(OBJS)
	ar rcs $(NAME) $(OBJS)

# Compilation de l'exécutable (Lien entre le main et la lib)
$(EXEC) : $(MAIN_OBJ) $(NAME)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L. -lasm -o $(EXEC)

# Règle pour transformer le .s en .o
%.o : %.s
	$(NASM) $(NASMFLAGS) $< -o $@

# Règle pour transformer le .c en .o
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	rm -f $(OBJS) $(MAIN_OBJ)

fclean : clean
	rm -f $(NAME)
	rm -f $(EXEC)

re : fclean all

.PHONY: all clean fclean re