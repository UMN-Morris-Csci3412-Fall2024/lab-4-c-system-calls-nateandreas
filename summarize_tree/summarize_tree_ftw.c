#include <stdio.h>
#include <stdlib.h>
#include <ftw.h>
#include <sys/stat.h>

static int num_dirs = 0;
static int num_regular = 0;

// Callback function for ftw()
static int callback(const char *fpath, const struct stat *sb, int typeflag) {
    if (typeflag == FTW_D) {
        num_dirs++;
    } else if (typeflag == FTW_F) {
        num_regular++;
    }
    return 0; // Return 0 to continue the traversal
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <directory>\n", argv[0]);
        return 1;
    }

    // Use ftw to traverse the directory tree
    if (ftw(argv[1], callback, 16) == -1) {
        perror("ftw");
        return 1;
    }

    printf("There were %d directories.\n", num_dirs);
    printf("There were %d regular files.\n", num_regular);

    return 0;
}
