# نام فایل اجرایی
TARGET = my_program

# لیست فایل‌های منبع (C source files)
SRCS = main.c menu.c maps.c characters.c addItems.c \
       in_game_menu.c display_game.c hide_map.c music.c \
       interactions.c monster.c playerfight.c saveANDload.c

# تبدیل نام فایل‌های C به فایل‌های شیء (object files)
OBJS = $(SRCS:.c=.o)

# دایرکتوری هدرها
INCLUDE_DIR = headers

# کامپایلر
CC = gcc

# فلگ‌های کامپایل
CFLAGS = -I$(INCLUDE_DIR) -Wall -Wextra -g

# کتابخانه‌های مورد نیاز
LIBS = -lncursesw -lSDL2 -lSDL2_mixer -pthread

# دستور اصلی برای ساخت برنامه
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LIBS)

# قانون برای ساخت فایل‌های شیء از فایل‌های منبع
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# دستور برای پاک کردن فایل‌های کامپایل شده
clean:
	rm -f $(OBJS) $(TARGET)

# دستور برای اجرای برنامه بعد از کامپایل
run: $(TARGET)
	./$(TARGET)
