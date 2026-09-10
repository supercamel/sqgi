#!/bin/bash
set -euo pipefail
cd /home/sam/Programming/sqgi
study=/tmp/sqgi-v22-native-profile
cc -O2 -g -Wall -Wextra -fPIC -shared "$study/capture.c" -o "$study/capture.so" > "$study/build.log" 2>&1
mkdir "$study/route" "$study/floats"
export SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 SQGI_JIT_PRECISE_EXITS=1 SQGI_JIT_TRACE=0
candidate=build-jit-audit-20260909/local-slot-forwarding-v22/sqgi
env LD_PRELOAD="$study/capture.so" SQGI_PROFILE_MAP_DIR="$study/route" "$candidate" /tmp/sqgi-local-slot-forwarding-study/route/entry-guards.nut > "$study/route/run.log" 2>&1
env -i PATH="$PATH" HOME="$HOME" LC_ALL=C SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 SQGI_JIT_PRECISE_EXITS=1 SQGI_JIT_TRACE=0 perf record --clockid mono -e cycles:u -F 499 -o "$study/floats.data" -- taskset -c 4 env LD_PRELOAD="$study/capture.so" SQGI_PROFILE_MAP_DIR="$study/floats" "$candidate" test/bench_float_workloads.nut --iterations=2000000 --warmups=5 > "$study/floats/record.log" 2>&1
perf script -i "$study/floats.data" --ns -F pid,tid,time,ip,event > "$study/floats/samples.txt" 2> "$study/floats/script.log"
perf report --stdio -g none --no-children --percent-limit 0.5 -i "$study/floats.data" > "$study/floats/report.log" 2>&1
