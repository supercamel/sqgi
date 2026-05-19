#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int file_exists(const char *path) {
    FILE *file = fopen(path, "rb");
    if (!file) {
        return 0;
    }
    fclose(file);
    return 1;
}

static void join_path(char *out, size_t out_size, const char *dir, const char *name) {
    const char *sep = "/";
    size_t len = strlen(dir);

    if (len > 0 && (dir[len - 1] == '/' || dir[len - 1] == '\\')) {
        sep = "";
    }

    snprintf(out, out_size, "%s%s%s", dir, sep, name);
}

int main(int argc, char **argv) {
    const char *share = getenv("SQGI_APP_SHARE");
    const char *resources = getenv("SQGI_APP_RESOURCES");
    char payload[4096];

    if (!share || share[0] == '\0') {
        fprintf(stderr, "SQGI_APP_SHARE was not set\n");
        return 2;
    }

    join_path(payload, sizeof(payload), share, "payload.cnut");
    if (!file_exists(payload)) {
        fprintf(stderr, "compiled Squirrel payload missing: %s\n", payload);
        return 3;
    }

    printf("native entry project ran\n");
    printf("arg: %s\n", argc > 1 ? argv[1] : "<none>");
    printf("payload: %s\n", payload);
    printf("resources: %s\n", resources ? resources : "<unset>");
    return 0;
}
