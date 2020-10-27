#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include <cairo.h>
#include <cairo-xlib.h>
#include <X11/Xlib.h>

int main(int argc, char** argv) {
    Display* display = XOpenDisplay(NULL);
    int screen = DefaultScreen(display);
    Window root = DefaultRootWindow(display);

    cairo_surface_t* surface = cairo_xlib_surface_create(
        display,
        root,
        DefaultVisual(display, screen),
        DisplayWidth(display, screen),
        DisplayHeight(display, screen)
    );

    char* home_dir = getenv("HOME");
    char file_name[1000];
    memset(file_name, 0, sizeof(file_name));

    char timestamp_str[20];
    memset(timestamp_str, 0, sizeof(timestamp_str));
    time_t timestamp = time(NULL);
    sprintf(timestamp_str, "%d", timestamp);

    strcat(file_name, home_dir);
    strcat(file_name, "/");
    strcat(file_name, timestamp_str);
    strcat(file_name, ".png");

    cairo_surface_write_to_png(
        surface,
        file_name
    );

    cairo_surface_destroy(surface);
    return 0;
}
