#include "sqgi_vm.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define SQGI_INTERACTIVE_BUF 2048

/* ── Interactive REPL ────────────────────────────────────────────────────── */

static SQInteger quit_fn(HSQUIRRELVM v)
{
    (void)v;
    exit(0);
    return 0;
}

static void run_repl(HSQUIRRELVM v)
{
    char buf[SQGI_INTERACTIVE_BUF];

    /* Register quit() in root table */
    sq_pushroottable(v);
    sq_pushstring(v, "quit", -1);
    sq_newclosure(v, quit_fn, 0);
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);

    printf("SQGI interactive console (Squirrel %d)\n", SQUIRREL_VERSION_NUMBER);
    printf("Type 'quit()' to exit.\n");

    for (;;) {
        printf(">> ");
        fflush(stdout);

        if (!fgets(buf, sizeof(buf), stdin)) break;

        SQInteger len = (SQInteger)strlen(buf);
        if (len == 0) continue;

        /* Strip trailing newline */
        if (buf[len - 1] == '\n') buf[--len] = '\0';
        if (len == 0) continue;

        /* Leading '=' prints the result expression */
        const char *src = buf;
        SQBool retval = SQFalse;
        char print_buf[SQGI_INTERACTIVE_BUF + 16];
        if (buf[0] == '=') {
            snprintf(print_buf, sizeof(print_buf), "return %s", buf + 1);
            src = print_buf;
            retval = SQTrue;
        }

        SQRESULT res = sq_compilebuffer(v, src, (SQInteger)strlen(src), "interactive", SQTrue);
        if (SQ_FAILED(res)) continue;

        sq_pushroottable(v);
        res = sq_call(v, 1, retval, SQTrue);
        if (SQ_SUCCEEDED(res) && retval) {
            const SQChar *str = NULL;
            if (SQ_SUCCEEDED(sq_tostring(v, -1))) {
                if (SQ_SUCCEEDED(sq_getstring(v, -1, &str)) && str) {
                    printf("%s\n", str);
                }
                sq_pop(v, 1); /* pop stringified value */
            }
            sq_pop(v, 1); /* pop result */
        }
        sq_pop(v, 1); /* pop closure */
    }
}

/* ── Entry Point ─────────────────────────────────────────────────────────── */

int main(int argc, char *argv[])
{
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) {
        fprintf(stderr, "sqgi: failed to create VM\n");
        return 1;
    }

    if (argc < 2) {
        run_repl(v);
        sqgi_vm_free(v);
        return 0;
    }

    /* --version / -v */
    if (strcmp(argv[1], "--version") == 0 || strcmp(argv[1], "-v") == 0) {
#ifndef SQGI_VERSION
#define SQGI_VERSION "unknown"
#endif
        printf("sqgi %s\n", SQGI_VERSION);
        sqgi_vm_free(v);
        return 0;
    }

    /* --help / -h */
    if (strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0) {
        printf(
            "Usage: sqgi [options] [script [args...]]\n"
            "\n"
            "Options:\n"
            "  -e <src>       Evaluate inline Squirrel source and exit\n"
            "  -v, --version  Print version and exit\n"
            "  -h, --help     Show this message and exit\n"
            "\n"
            "With no arguments, sqgi starts an interactive REPL.\n"
        );
        sqgi_vm_free(v);
        return 0;
    }

    /* Check for -e "inline script" flag */
    if (strcmp(argv[1], "-e") == 0) {
        if (argc < 3) {
            fprintf(stderr, "sqgi: -e requires a script string\n");
            sqgi_vm_free(v);
            return 1;
        }
        const char *src = argv[2];
        SQRESULT res = sqgi_vm_dobuffer(v, src, (SQInteger)strlen(src), "cmdline");
        sqgi_vm_free(v);
        return SQ_FAILED(res) ? 1 : 0;
    }

    /* Script file mode: push remaining argv as string args */
    const char *filename = argv[1];

    /* Load file to a closure, then call it with remaining args */
    sq_pushroottable(v);
    SQRESULT res = sqstd_loadfile(v, filename, SQTrue);
    if (SQ_FAILED(res)) {
        sq_pop(v, 1); /* pop root table */
        sqgi_vm_free(v);
        return 1;
    }

    /* closure is at top, push root as 'this' then push argv[2..] as params */
    sq_pushroottable(v);
    int callargs = 1;
    for (int i = 2; i < argc; i++) {
        sq_pushstring(v, argv[i], -1);
        callargs++;
    }

    res = sq_call(v, callargs, SQTrue, SQTrue);
    int exitcode = 0;
    if (SQ_SUCCEEDED(res)) {
        SQInteger ret = 0;
        if (SQ_SUCCEEDED(sq_getinteger(v, -1, &ret)))
            exitcode = (int)ret;
        sq_pop(v, 1); /* pop return value */
    } else {
        exitcode = 1;
    }
    sq_pop(v, 2); /* pop closure + root table */

    sqgi_vm_free(v);
    return exitcode;
}
