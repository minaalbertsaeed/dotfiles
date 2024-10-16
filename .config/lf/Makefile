CC = gcc
DBUS_CFLAGS = $(shell pkg-config --cflags dbus-1)
CFLAGS = -Wall -Wextra $(DBUS_CFLAGS)
SRC = open_file_handler.c
TARGET = ofh

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) $(HOME)/.local/bin/$(TARGET)
