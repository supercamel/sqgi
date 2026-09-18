import json
import sys
import time

text = open(sys.argv[1], encoding="utf-8").read()
operation, n = sys.argv[2], int(sys.argv[3])
value = json.loads(text)


def stringify(value):
    return json.dumps(value, ensure_ascii=False, separators=(",", ":"), allow_nan=False)


def batch(n):
    checksum, last = 0, None
    if operation == "parse":
        for _ in range(n):
            last = json.loads(text)
            checksum += last["marker"]
    elif operation == "stringify":
        for _ in range(n):
            last = stringify(value)
            checksum += len(last)
    else:
        for _ in range(n):
            last = json.loads(stringify(value))
            checksum += last["marker"]
    return checksum, last


batch(n)
start = time.perf_counter_ns()
checksum, last = batch(n)
elapsed = time.perf_counter_ns() - start
print(f"{elapsed / n}\t{checksum}")
print(last if operation == "stringify" else stringify(last))
