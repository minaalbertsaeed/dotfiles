CC = gcc
DBUS_CFLAGS = $(shell pkg-config --cflags --libs dbus-1)
CFLAGS = -Wall -Wextra $(DBUS_CFLAGS)
SRC = open_file_handler.c
TARGET = ofh

$(TARGET): $(SRC)
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) 

install: $(TARGET)
	cp $(TARGET) $(HOME)/.local/bin/

clean: $(TARGET)
	rm $(TARGET)
