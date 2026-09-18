#!/usr/bin/env python3
"""Pure CPython counterparts; standard lists, no NumPy/JIT dependencies."""
import json, math, sys, time, statistics

def op_geometry(b, n, pattern):
    a = b[0]
    o = b[1]
    for i in range(n):
        o[3 * i] = a[3 * i] * 1.5 + 2
        o[3 * i + 1] = a[3 * i + 1] * 1.5 - 1
        o[3 * i + 2] = a[3 * i + 2] * 1.5 + 0.5
    return 0

def op_sum(b, n, pattern):
    a = b[0]
    s = 0.0
    for i in range(n):
        s += a[i]
    return s
    return 0

def op_dot(b, n, pattern):
    a = b[0]
    s = 0.0
    c = b[1]
    for i in range(n):
        s += a[i] * c[i]
    return s
    return 0

def op_prefix(b, n, pattern):
    a = b[0]
    s = 0.0
    o = b[1]
    for i in range(n):
        s += a[i]
        o[i] = s
    return 0

def op_particles(b, n, pattern):
    a = b[0]
    for i in range(n):
        k = 5 * i
        if a[k + 4] != 0:
            x, y, vx, vy = a[k:k + 4]
            vy -= 9 * 0.125
            x += vx * 0.125
            y += vy * 0.125
            if x < 0:
                x = 0
                vx = -vx
            if x > 10:
                x = 10
                vx = -vx
            if y < 0:
                y = 0
                vy = -vy * 0.8
            a[k:k + 4] = (x, y, vx, vy)
    return 0

def op_image(b, n, pattern):
    a = b[0]
    o = b[1]
    for i in range(n):
        o[i] = 255 if min(255, max(0, a[i] + 16)) >= 128 else 0
    return 0

def op_matrix(b, n, pattern):
    a = b[0]
    c, o = b[1:]
    for r in range(n):
        for col in range(n):
            s = 0.0
            for k in range(n):
                s += a[r * 16 + k] * c[k * 16 + col]
            o[r * 16 + col] = s
    return 0

def op_routing(b, n, pattern):
    a = b[0]
    total = 0
    o = b[1]
    for i in range(n):
        hit = a[4 * i + 2] >= 4 and a[4 * i] <= 8 and (a[4 * i + 3] >= 4) and (a[4 * i + 1] <= 8)
        o[i] = int(hit)
        total += int(hit)
    return total
    return 0

def op_histogram(b, n, pattern):
    a = b[0]
    o = b[1]
    for i in range(16):
        o[i] = 0
    for i in range(n):
        o[int(a[i])] += 1
    return 0

def op_stencil(b, n, pattern):
    a = b[0]
    o = b[1]
    for i in range(n * n):
        o[i] = a[i]
    for r in range(1, n - 1):
        for c in range(1, n - 1):
            i = r * n + c
            o[i] = (a[i - 1] + a[i + 1] + a[i - n] + a[i + n]) * 0.25
    return 0

def op_astar(b, n, pattern):
    a = b[0]
    state, path = b[1:]
    goal = 0 if pattern == 'same' else 255
    for i in range(256):
        state[4 * i:4 * i + 4] = (1000000, 1000000, -1, 0)
        path[i] = -1
    if a[0] != 0 or a[goal] != 0:
        return -1

    def distance(i):
        return abs(i // 16 - goal // 16) + abs(i % 16 - goal % 16)
    state[0] = 0
    state[1] = distance(0)
    state[3] = 1
    while True:
        current = -1
        best = 1000000
        for i in range(256):
            if state[4 * i + 3] == 1 and state[4 * i + 1] < best:
                best = state[4 * i + 1]
                current = i
        if current == -1:
            return -1
        if current == goal:
            length = 0
            while current != -1:
                path[length] = current
                length += 1
                current = state[current * 4 + 2]
            return length
        state[current * 4 + 3] = 2
        row, col = divmod(current, 16)
        for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            r, c = (row + dr, col + dc)
            if 0 <= r < 16 and 0 <= c < 16:
                nxt = r * 16 + c
                if a[nxt] == 0 and state[nxt * 4 + 3] != 2:
                    candidate = state[current * 4] + 1
                    if candidate < state[nxt * 4]:
                        state[nxt * 4:nxt * 4 + 4] = (candidate, candidate + distance(nxt), current, 1)
    return 0

OPERATIONS={'geometry':op_geometry,'sum':op_sum,'dot':op_dot,'prefix':op_prefix,'particles':op_particles,'image':op_image,'matrix':op_matrix,'routing':op_routing,'histogram':op_histogram,'stencil':op_stencil,'astar':op_astar}

sink=None
def measure(invoke,reset=lambda:None):
    global sink
    def batch(n):
        global sink
        reset();start=time.perf_counter_ns()
        for _ in range(n):sink=invoke()
        return time.perf_counter_ns()-start
    reps=1
    while reps<100000:
        if batch(reps)>=5_000_000:break
        reps=min(100000,reps*2)
    start=time.perf_counter_ns()
    while time.perf_counter_ns()-start<100_000_000:batch(reps)
    samples=sorted(batch(reps)/reps for _ in range(9))
    return dict(ns=statistics.median(samples),min_ns=samples[0],max_ns=samples[-1],repetitions=reps,samples_ns=samples)

def arithmetic(n):
    s=0
    for i in range(n):s+=i*2
    return s

def float_arithmetic(n):
    s=0.5
    for i in range(n):s+=i*0.5
    return s

def float_recurrence(n):
    s=0.5
    for i in range(n):s=s*0.9999+0.125
    return s

def branches(n):
    s=0
    for i in range(n):
        if i<500000:s+=i
        else:s-=i
    return s

def kernel_calls(n):
    def twice(x):return x*2
    s=0
    for i in range(n):s+=twice(i)
    return s

def main():
    cases=[]
    for test in json.load(open(sys.argv[1]))['cases']:
        buffers=[];op=OPERATIONS[test['workload']]
        def reset():buffers[:]=[list(b) for b in test['initial']]
        def invoke():return op(buffers,test['size'],test['pattern'])
        reset();assert invoke()==test['result'],test
        assert buffers==test['expected'],(test['workload'],test['size'],test['pattern'],'single output')
        reset()
        for _ in range(test['repetitions']):invoke()
        assert buffers==test['repeated_expected'],(test['workload'],test['size'],test['pattern'],'repeated output')
        cases.append(dict(workload=test['workload'],size=test['size'],pattern=test['pattern'],**measure(invoke,reset)))
    for fn in [arithmetic,float_arithmetic,float_recurrence,branches,kernel_calls]:
        n=1000000;expected=fn(n);timing=measure(lambda:fn(n));assert sink==expected
        timing['ns']/=n
        cases.append(dict(workload='ordinary/'+fn.__name__,size=n,pattern='',result=expected,**timing))
    print(json.dumps(dict(runtime='python',version=sys.version,clock='monotonic wall',storage='Python lists; arbitrary-precision ints',cases=cases)))
if __name__=='__main__':main()
