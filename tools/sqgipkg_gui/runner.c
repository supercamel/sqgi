/* C-JOB: Linux process supervision only; no packaging policy. */
#define _GNU_SOURCE
#include <sys/prctl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static volatile sig_atomic_t interrupted;
static void interrupt_job(int signal_number) { (void)signal_number; interrupted = 1; }
static double now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec / 1e9;
}

/* Detached children are adopted by this subreaper after their parent exits. */
static void signal_children(int sig) {
    char path[128];
    snprintf(path, sizeof(path), "/proc/self/task/%ld/children", (long)getpid());
    FILE *file = fopen(path, "r");
    if (!file) return;
    long pid;
    while (fscanf(file, "%ld", &pid) == 1) if (pid > 0) kill((pid_t)pid, sig);
    fclose(file);
}

int main(int argc, char **argv) {
    if (argc < 4 || argv[2][0] != '-' || argv[2][1] != '-' || argv[2][2]) {
        fprintf(stderr, "Usage: sqgipkg-runner CANCEL_FILE -- COMMAND [ARG...]\n");
        return 125;
    }
    if (prctl(PR_SET_CHILD_SUBREAPER, 1) != 0) { perror("subreaper"); return 125; }
    pid_t owner = getppid();
    struct sigaction action = {0};
    action.sa_handler = interrupt_job;
    sigaction(SIGTERM, &action, NULL);
    sigaction(SIGINT, &action, NULL);
    sigaction(SIGHUP, &action, NULL);
    /* The GUI may vanish along with its pipe readers; cleanup must still run. */
    signal(SIGPIPE, SIG_IGN);
    pid_t leader = fork();
    if (leader < 0) { perror("fork"); return 125; }
    if (leader == 0) {
        signal(SIGTERM, SIG_DFL); signal(SIGINT, SIG_DFL); signal(SIGHUP, SIG_DFL);
        signal(SIGPIPE, SIG_DFL);
        if (setsid() < 0) _exit(125);
        execvp(argv[3], &argv[3]);
        perror("sqgipkg-runner exec"); _exit(127);
    }
    int cancelled = 0, finished = 0, status = 125, unexpected = 0;
    double cleanup = 0;
    for (;;) {
        if (!cancelled && (interrupted || getppid() != owner || access(argv[1], F_OK) == 0)) {
            cancelled = 1; cleanup = now();
            fprintf(stderr, "\nCancelling build and its child processes…\n");
        }
        int child_status;
        pid_t reaped;
        while ((reaped = waitpid(-1, &child_status, WNOHANG)) > 0) {
            if (reaped == leader) {
                finished = 1;
                status = WIFEXITED(child_status) ? WEXITSTATUS(child_status) : 128 + WTERMSIG(child_status);
            }
        }
        if (reaped < 0 && errno == ECHILD) break;
        if (finished && !cleanup) {
            cleanup = now(); unexpected = 1;
            fprintf(stderr, "Build command left child processes running; cleaning them up.\n");
        }
        if (cleanup) {
            int sig = now() - cleanup < 2.0 ? SIGTERM : SIGKILL;
            kill(-leader, sig);
            signal_children(sig);
        }
        struct timespec delay = {0, 20000000};
        nanosleep(&delay, NULL);
    }
    return cancelled ? 130 : unexpected ? 125 : status;
}
