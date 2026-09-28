/* Independent native DLL teardown probe. No SQGI or GTK initialization.
 * Build with x86_64-w64-mingw32-gcc and place next to the payload DLLs.
 * Usage: dll_teardown.exe library.dll [free]
 * Acceptance additionally requires the process to exit successfully.
 */
#include <windows.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
    if (argc < 2 || argc > 3 || (argc == 3 && strcmp(argv[2], "free"))) {
        fputs("Usage: dll_teardown.exe library.dll [free]\n", stderr);
        return 2;
    }
    HMODULE library = LoadLibraryA(argv[1]);
    if (!library) {
        fprintf(stderr, "LoadLibrary failed: %lu\n", GetLastError());
        return 3;
    }
    puts("DLL LOAD COMPLETE");
    fflush(stdout);
    if (argc == 3) {
        if (!FreeLibrary(library)) {
            fprintf(stderr, "FreeLibrary failed: %lu\n", GetLastError());
            return 4;
        }
        puts("DLL FREE COMPLETE");
        fflush(stdout);
    }
    return 0;
}
