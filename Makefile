# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lduboulo <marvin@42lausanne.ch>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/27 18:29:51 by lduboulo          #+#    #+#              #
#    Updated: 2022/03/28 23:19:36 by lduboulo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COLORS

GREEN	= \033[1;32m
RED 	= \033[1;31m
ORANGE	= \033[1;33m
GREY	= \033[1;90m
BUILD	= \e[38;5;225m
RESET	= \033[0m

# COLORS

SRCS_DIR	= ./src/
SRCS_FILES	= argument_check.c argument_check_2.c main.c useful_functions.c \
			  linked_list_manipulation.c sorts_function.c algorithm_functions.c \
			  sorts_functions_2.c algorithm_functions_2.c

SRCS		:= ${patsubst %, ${SRCS_DIR}%, ${SRCS_FILES}}

O_DIR		= ./objs/

OBJS_FILES	:= ${SRCS_FILES:.c=.o}
OBJS		:= ${patsubst %, ${O_DIR}%, ${OBJS_FILES}}


LIBFT		= ./Libft
MAKELIB		= ${MAKE} -C ${LIBFT}

NAME		= push_swap

CC			= gcc
AR			= ar rcs
MKDIR		= mkdir
RM			= rm -f

CFLAGS		= -Wall -Wextra -Werror -g3 -fsanitize=address


all:		${NAME}

${NAME}:	${O_DIR} ${OBJS}
			@printf "\e[1K\r${GREEN}💻 Successfully compiled ${NAME} .o's${RESET}\n"
			@${MAKELIB}
			@${CC} ${CFLAGS} -o ${NAME} ${OBJS} ${LIBFT}/libft.a
			@printf "\e[1K\r${GREEN}💻 Successfully created ${NAME} executable${RESET}\n"

${O_DIR}:
			@${MKDIR} ${O_DIR}

${O_DIR}%.o:${SRCS_DIR}%.c
			@${CC} ${CFLAGS} -I ./Libft/src/ -o $@ -c $<
			@printf "\e[1K\r${BUILD}🚧 $@ from $<${RESET}"

clean :
	@$(MAKE) -C Libft clean
	@rm -rf $(O_DIR)
	@echo "$(GREY)====================$(ORANGE) [Deleted] : $(RESET).o files $(GREY)================================$(RESET)"

fclean : clean
	@$(MAKE) -C Libft fclean
	@rm -rf $(NAME) $(NAME).dSYM
	@echo "$(GREY)====================$(RED) [Deleted] : $(RESET) everything $(GREY)=============================$(RESET)"

re : fclean all

.PHONY : all clean fclean re
