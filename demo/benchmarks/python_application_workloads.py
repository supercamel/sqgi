#!/usr/bin/env python3
"""Pure-Python port of test/bench_application_workloads.nut; no native-array libraries."""
import sys
from time import perf_counter_ns


def make_inputs(seed):
    return dict(codes=[(i * 73 + seed * 19) % 1024 for i in range(4096)],
                words=["word_" + str((i * 37 + seed) % 257) for i in range(4096)],
                next=[(i * 109 + 89 + seed * 2) % 4096 for i in range(4096)],
                weights=[(i * 31 + seed) % 997 for i in range(4096)], seed=seed)


def route_step(acc, code, threshold):
    if code < threshold:
        delta = code * 3 + 11
    else:
        delta = code * 7 + 23
    return (acc + delta) % 1000003


def route_events(n, data, threshold):
    codes, acc = data['codes'], 17
    size = len(codes)
    for i in range(n):
        acc = route_step(acc, codes[i % size], threshold)
    return acc


def route_balanced(n, data):
    return route_events(n, data, 512)


def route_skewed(n, data):
    return route_events(n, data, 1000)


def price_event(price, quantity, category, cap):
    price = price * quantity
    if quantity == 0:
        return 0
    if category < 2:
        return price + 17
    if price > cap:
        price = cap
    return price + category * 3


def pricing_events(n, data):
    codes, total = data['codes'], 0
    size = len(codes)
    for i in range(n):
        code, quantity = codes[i % size], i % 11
        price = code + 19
        total = (total + price_event(price, quantity, code % 7, 4000) + price + quantity) % 1000003
    return total


def filter_step(previous, sample, mode):
    if mode < 3:
        return previous * 0.75 + sample * 0.25
    return previous * 0.5 + sample * 0.5


def filter_stream(n, data):
    codes, value, total = data['codes'], 0.5, 0.0
    size = len(codes)
    for i in range(n):
        value = filter_step(value, codes[i % size], i % 5)
        total += value * 0.0001
    return total + value


def record_updates(n, data, size):
    records = []
    for i in range(size):
        if i % 2 == 0:
            records.append(dict(balance=i % 97, count=0, weight=i % 7 + 1))
        else:
            records.append(dict(weight=i % 7 + 1, count=0, balance=i % 97))
    total, seed = 0, data['seed']
    for i in range(n):
        row = records[(i * 73 + seed) % size]
        row['balance'] = (row['balance'] + i % 31 + row['weight']) % 1009
        row['count'] += 1
        total = (total + row['balance'] * row['weight'] + row['count']) % 1000003
    return total


def records_64(n, data):
    return record_updates(n, data, 64)


def records_4096(n, data):
    return record_updates(n, data, 4096)


def word_count(n, data):
    words, counts, total = data['words'], {}, 0
    size = len(words)
    for i in range(n):
        key = words[i % size]
        if key in counts:
            counts[key] += 1
        else:
            counts[key] = 1
        total = (total + counts[key] * len(key)) % 1000003
    return total


def graph_walk(n, data):
    next_nodes, weights, cursor = data['next'], data['weights'], data['seed'] % 4096
    total = 0
    for _ in range(n):
        cursor = next_nodes[cursor]
        total = (total + weights[cursor]) % 1000003
    return total + cursor


def main():
    iterations = int(sys.argv[1]) if len(sys.argv) > 1 else 200000
    warmups = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    data = make_inputs(int(sys.argv[3]) if len(sys.argv) > 3 else 17)
    for fn in (route_balanced, route_skewed, pricing_events, filter_stream,
               records_64, records_4096, word_count, graph_walk):
        for _ in range(warmups):
            warm = fn(iterations, data)
        start = perf_counter_ns()
        checksum = fn(iterations, data)
        elapsed = perf_counter_ns() - start
        if warmups > 0 and checksum != warm:
            raise ValueError('unstable application checksum')
        print(f'BENCH\t{fn.__name__}\t{iterations}\t{elapsed / 1000 / iterations:.9f}\t{checksum}')


if __name__ == '__main__':
    main()
