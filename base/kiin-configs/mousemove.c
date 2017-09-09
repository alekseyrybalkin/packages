#include <stdlib.h>
#include <X11/Xlib.h>

int main(int argc, char** argv) {
    if (argc != 3) {
        return 0;
    }
    long x = strtol(argv[1], NULL, 10);
    long y = strtol(argv[2], NULL, 10);

    Display *display = XOpenDisplay(NULL);
    if (display == NULL) {
        return 1;
    }

    Window window = DefaultRootWindow(display);
    XWarpPointer(display, None, window, 0, 0, 0, 0, x, y);
    XFlush(display);

    XCloseDisplay(display);

    return 0;
}
