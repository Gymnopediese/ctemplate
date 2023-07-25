# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albaud <albaud@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 13:07:44 by albaud            #+#    #+#              #
#    Updated: 2023/07/25 13:54:06 by albaud           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS 		= ${wildcard main.c srcs/*.c srcs/*/*.c srcs/*/*/*.c}
OBJS		= $(patsubst srcs/%.c, objs/%.o, $(SRCS))
NAME 		= main
CC			= gcc
CFLAGS		= -g3 -fsanitize=address -Wall -Wextra -Werror
OBJ_DIR		= objs
SRC_DIR		= libs

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

.c.o 	:
		${CC} ${CFLAGS} -c $< -o ${<:.c=.o}
		
all 	: $(NAME)

$(NAME)	: ${OBJS}
		gcc ${CFLAGS} -o ${NAME} ${OBJS}

clean	:
		rm -rf $(OBJ_DIR)

fclean	:	clean
		rm -f ${NAME} 

re:		fclean all

run	: $(NAME)
		./$(NAME)