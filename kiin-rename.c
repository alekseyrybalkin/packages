/* gcc -o _kiin-rename kiin-rename.c */

#include <stdio.h>
#include <errno.h>

int main(int argc, char** argv) {
    if (argc > 2) {
        int retval = rename(argv[1], argv[2]);
        if (retval == -1) {
            printf("kiin-rename failed with errno %d\n", errno);
        }
        return retval;
    }
    printf("kiin-rename expects two parameters\n");
    return -1;
}
