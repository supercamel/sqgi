# Incident report: repeated async worker crash in SQGI 0.1.0

Date observed: 13 August 2026
Host: `sam-huge-pc`
Status: unresolved; no SQGI code or binary changes were retained

## Summary

An SQGI process running a long-lived Squirrel worker loop repeatedly terminates
with `SIGSEGV`. The normal worker reproduced the failure approximately every
nine minutes while polling an idle server. The same failure was reproduced in
about 30 seconds by running the identical script with its idle polling delay
set to zero.

The symbolized core places the fault in `SQVM::Push`, called by
`sqgi_wake_idle_cb` while resuming an awaited task. Source inspection suggests
that intermediate return objects may accumulate on a coroutine stack when a
resume immediately reaches another `await`. This is a hypothesis, not a proven
root cause.

No CFD solver process was active during the observed idle crashes. The
production worker was running the original, unchanged SQGI binary throughout.

## Environment

| Component | Value |
| --- | --- |
| SQGI | 0.1.0 |
| Repository HEAD during investigation | `4820070 Add GTK dialog demo and libsoup3 Windows default` |
| Binary SHA-256 | `a68d066d3aecd05e93346107c8ce50f38c6f3ae35914c93b42147087f3ab7117` |
| ELF build ID | `b24d0437d6c5f1f575b629519aa412de17d8ee38` |
| Architecture | x86-64 |
| Kernel | Linux 7.0.0-28-generic on Ubuntu 24.04 |
| glibc | 2.39 |
| GLib/GIO | 2.80.0 |
| libsoup | 3.4.4 |

The following binaries were byte-identical at the end of the investigation:

- `/home/sam/Programming/sqgi/build/sqgi`
- `/usr/local/bin/sqgi`
- `/opt/sqgi/bin/sqgi`

## Workload

The affected process executes:

```text
/opt/sqgi/bin/sqgi /opt/anemoi-worker/current/worker/main.nut
```

The Squirrel script is a long-lived GLib main-loop application. While idle, it
repeatedly:

1. sends an authenticated heartbeat with
   `Soup.Session.send_and_read_async`;
2. parses the JSON response;
3. sends an authenticated FIFO lease request using the same async API;
4. parses a response whose job is null; and
5. awaits a short `sqgi.sleep` before repeating.

The production process uses a 1,500 ms idle delay. The accelerated reproducer
uses `--poll-ms=0`.

## Observed timeline

The corrected service started at 11:38:04 AEST.

- 11:46:55: first retained service crash.
- 11:47:01: systemd restarted the worker.
- 11:55:51: second crash at the same instruction; systemd restarted it again.
- About 12:00: an accelerated temporary process reproduced the crash with exit
  status 139.

The worker completed two short FIFO diagnostic jobs successfully between the
first two service crashes. This shows that the failure is intermittent with
respect to individual requests but repeatable over enough loop iterations.

Both service crashes produced the same kernel signature apart from ASLR:

```text
sqgi: segfault at 8 ... error 4 in sqgi[362f5,<load-address>+6f000]
```

## Accelerated reproduction

The exact reproduction requires an Anemoi worker endpoint and a valid worker
token. Do not put the token in shell history or a report. The production queue
was verified empty before this test.

Conceptually, the command was:

```sh
read -r ANEMOI_WORKER_TOKEN < /path/to/private/worker-token
export ANEMOI_WORKER_TOKEN

ANEMOI_SERVER_URL=http://127.0.0.1:18080 \
ANEMOI_WORKER_ID=temporary-crash-probe \
ANEMOI_WORKER_NAME='Temporary SQGI crash probe' \
ANEMOI_WORK_ROOT=/tmp/anemoi-worker-crash-probe \
SQGI=/opt/sqgi/bin/sqgi \
ANEMOI_CFD_CASE_SCRIPT=/opt/anemoi-worker/current/worker/cfd-case.nut \
timeout 120 /opt/sqgi/bin/sqgi \
  /opt/anemoi-worker/current/worker/main.nut --poll-ms=0
```

Observed result:

```text
timeout: the monitored command dumped core
Segmentation fault
exit status 139
```

The temporary worker database record was deleted after the reproduction.

## Narrowing tests

The following tests used the same unchanged SQGI binary and passed:

### Synchronous JSON stress

One million iterations, each parsing a representative response object and
stringifying a representative heartbeat object:

```text
0
250000
500000
750000
json-stress-ok
```

### Async Soup and JSON stress

A separate SQGI process performed 700 sequential
`Soup.Session.send_and_read_async` requests against the loopback health
endpoint, parsed every JSON response, and awaited 10 ms between requests:

```text
0
100
200
300
400
500
600
async-soup-stress-ok
```

These results do not prove JSON or Soup innocent. They show that neither the
synchronous JSON helper nor a simple single-request async Soup loop was
sufficient to reproduce the fault. The full heartbeat-plus-lease worker loop
was sufficient.

## Core and backtrace

The accelerated probe created:

```text
/var/crash/_opt_sqgi_bin_sqgi.1000.crash
```

It was unpacked privately into:

```text
/tmp/anemoi-sqgi-crash-1000
```

A core can contain the worker bearer token and other process memory. Do not
publish or copy it to an untrusted location.

The relevant symbolized backtrace is:

```text
#0  SQObjectPtr::operator=
    Squirrel3/squirrel/sqobject.h:272
#1  SQVM::Push
    Squirrel3/squirrel/sqvm.cpp:2125
#2  sq_pushobject
    Squirrel3/squirrel/sqapi.cpp:1133
#3  sqgi_wake_idle_cb
    src/sqgi_async.c:165
#4  GLib main-loop dispatch
#5  g_main_loop_run
#6  GI invocation
#7  gi_function_call
    src/sqgi_gi.c:1107
#8  Squirrel native call and VM execution
#9  main
    src/main.c:377
```

At the fault, `SQObjectPtr::operator=` was releasing the old value of a stack
slot:

```cpp
_unVal = obj._unVal;
_type = obj._type;
__AddRef(_type, _unVal);
__Release(tOldType, unOldVal);  // fault
```

The failure address was also mapped independently with `addr2line` using the
deployed binary and ELF load offset.

## Source-level hypothesis

The crashing callback contains:

```c
sq_pushobject(coro, j->value);
wr = sq_wakeupvm(coro, SQTrue, SQTrue, SQFalse, SQFalse);
```

The second boolean passed to `sq_wakeupvm` is `retval = SQTrue`. The bundled
Squirrel implementation ends with:

```c
if (retval)
    v->Push(ret);
```

That push occurs after `Execute` returns, including when the resumed coroutine
has reached another `await` and is suspended again. On a successful wake,
`sqgi_wake_idle_cb` calls `sqgi_async_check_complete(coro)`. That helper
returns immediately unless the coroutine is idle.

Therefore, one plausible sequence is:

1. An awaited task resolves.
2. SQGI pushes the resolved value and wakes the coroutine.
3. The coroutine advances to its next `await` and suspends.
4. `sq_wakeupvm(..., retval = SQTrue)` pushes its temporary return object.
5. The completion check sees a suspended VM and returns.
6. The temporary object remains on the coroutine stack.
7. Repetition eventually corrupts or exhausts the stack; the next
   `sq_pushobject` faults while replacing an invalid old slot.

A structurally similar path exists in `sqgi_await_timeout_cb`, which also calls
`sq_wakeupvm` with `retval = SQTrue` and then performs only the completion
check.

This interpretation fits:

- the exact backtrace;
- the repeated identical instruction;
- the dependence on a long sequence of awaits;
- the much faster failure with a zero polling delay; and
- the absence of a CFD child process.

It remains possible that the stack was corrupted earlier by GI marshalling,
cross-VM reference ownership, waiter settlement, nested main-loop behavior, or
another SQGI defect. The backtrace identifies where corruption became visible,
not necessarily where it originated.

## Suggested independent checks

1. Log `sq_gettop(coro)` immediately before and after every
   `sq_wakeupvm`, together with the resulting VM state. Check whether the top
   grows only when the coroutine suspends again.
2. Create a small pure-Squirrel regression that performs more than 2,000
   sequential `await sqgi.sleep(0)` operations in one async function. This
   proposed minimal reproducer was not run during this investigation.
3. Repeat under ASan/UBSan and a debug Squirrel build.
4. Experiment in a separate branch with either:
   - suppressing the resume return value when it is not needed; or
   - discarding only the intermediate return object when the VM remains
     suspended.
5. Verify final return values, thrown errors, cancellation, nested async
   functions, task waiters, and nested GLib main-loop dispatch after any
   candidate change.
6. Inspect cross-VM `HSQOBJECT` addref/release ownership for
   `SqgiWakeJob.value` and `thread_ref`.
7. Add a regression that confirms coroutine stack depth remains bounded across
   thousands of sequential awaits.

## Investigation boundaries

No proposed fix was built or executed. A brief source edit was made during
initial diagnosis, then completely reverted before this report was requested.
At report creation:

- `src/sqgi_async.c` had no Git diff;
- `test/test_async_reentrancy.nut` had no Git diff; and
- all built and installed SQGI binaries retained their original checksum.

This report intentionally records evidence and hypotheses only.
