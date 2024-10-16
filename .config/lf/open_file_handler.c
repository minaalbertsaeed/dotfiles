#include <stdio.h>
#include <stdlib.h>
#include <dbus/dbus.h>
#include <string.h>
#define BUF_SIZE 1024
void escape_spaces_in_place(char *filename) {
    int length = strlen(filename);
    int new_length = length;

    // Count how many spaces need to be escaped
    for (int i = 0; i < length; i++) {
        if (filename[i] == ' ' || 
            filename[i] == '(' || filename[i] == ')' || 
            filename[i] == '[' || filename[i] == ']' ||
            filename[i] == '&'
        ) {
            new_length++;
        }
    }

    // Adjust the string in place, starting from the end
    for (int i = length; i >= 0; i--) {
        switch (filename[i]) {
            case ' ':
                filename[new_length--] = ' ';
                filename[new_length--] = '\\';
                break;
            case '(':
                filename[new_length--] = '(';
                filename[new_length--] = '\\';
                break;
            case ')':
                filename[new_length--] = ')';
                filename[new_length--] = '\\';
                break;
            case '[':
                filename[new_length--] = '[';
                filename[new_length--] = '\\';
                break;
            case ']':
                filename[new_length--] = ']';
                filename[new_length--] = '\\';
                break;
            case '&':
                filename[new_length--] = '&';
                filename[new_length--] = '\\';
                break;
            default:
                filename[new_length--] = filename[i];
                continue;
        }
    }
}

static void show_items(DBusMessage* message) {
    const char *term = "/home/mina/.local/scripts/tmux_new_window.sh";
    DBusMessageIter iter;
    dbus_message_iter_init(message, &iter);
    DBusMessageIter array;
    dbus_message_iter_recurse(&iter, &array);
    while (dbus_message_iter_get_arg_type(&array) != DBUS_TYPE_INVALID) {
        const char* item;
        char filename [BUF_SIZE], cmd[BUF_SIZE*2];

        dbus_message_iter_get_basic(&array, &item);
        strcpy(filename, item + 7);
        escape_spaces_in_place(filename);

        sprintf(cmd, "%s \"lfub %s\"  &", term, filename);

        /*Clear filename array */
        memset(filename, 0, sizeof(filename));
        system(cmd);
        dbus_message_iter_next(&array);
        return ;
    }
}

static DBusHandlerResult message_handler(DBusConnection* connection, DBusMessage* message, void* user_data) {
    if (dbus_message_is_method_call(message, "org.freedesktop.FileManager1", "ShowItems")) {
        DBusMessage* reply = dbus_message_new_method_return(message);
        if (reply != NULL) {
            show_items(message);
            dbus_connection_send(connection, reply, NULL);
            dbus_message_unref(reply);
        } else {
            fprintf(stderr, "Error creating reply message\n");
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
    }

    return DBUS_HANDLER_RESULT_HANDLED;
}

int main() {
    DBusConnection* connection = dbus_bus_get(DBUS_BUS_SESSION, NULL);
    if (connection == NULL) {
        fprintf(stderr, "Failed to connect to the D-Bus session bus\n");
        return 1;
    }

    dbus_bus_request_name(connection, "org.freedesktop.FileManager1", DBUS_NAME_FLAG_REPLACE_EXISTING, NULL);

    dbus_connection_add_filter(connection, message_handler, NULL, NULL);
    while (dbus_connection_read_write_dispatch(connection, -1))
        ;

    return 0;
}
