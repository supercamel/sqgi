#!/usr/bin/env python3
"""Scalar/list/object ports of SQGI's kernels; no NumPy or native vector library."""
import math
import sys
import time


def scalar_step(acc, a, b):
    # Python % floors; SQGI and JavaScript truncate. Negative accumulators
    # occur in the long benchmark, so preserve their signed remainder exactly.
    value = acc * 33 + a * 17 - b * 9 + 97
    return value % 1000003 if value >= 0 else -((-value) % 1000003)


def direct_call_kernel(n):
    acc = 7
    for i in range(n):
        acc = scalar_step(acc, i % 251, i % 127)
    return acc


def scalar_branch_step(acc, i):
    if i % 2 == 0:
        delta = i % 17
    else:
        delta = 0 - (i % 13)
    return (acc + delta + 97) % 1000003


def branch_call_kernel(n):
    acc = 7
    for i in range(n):
        acc = scalar_branch_step(acc, i)
    return acc


def scalar_float_step(x, y):
    return x * 0.5 + y


def float_call_kernel(n):
    value = 0.0
    for i in range(n):
        value = scalar_float_step(value, i % 7)
    return value


def numeric_loop_kernel(n):
    acc = 13
    for i in range(n):
        acc = (acc + (i % 997) * 31 + (acc % 17) * 7 + 11) % 1000000007
    return acc


class Vec3:
    # Fixed fields correspond to the Squirrel class and stable JS shape.
    __slots__ = ('values',)

    def __init__(self, x=0.0, y=0.0, z=0.0):
        self.values = [x, y, z]

    def get(self, i):
        return self.values[i]

    def set(self, i, value):
        self.values[i] = value
        return value

    def __add__(self, other):
        return Vec3(self.values[0] + other.values[0], self.values[1] + other.values[1], self.values[2] + other.values[2])

    def __sub__(self, other):
        return Vec3(self.values[0] - other.values[0], self.values[1] - other.values[1], self.values[2] - other.values[2])

    def __mul__(self, scalar):
        return Vec3(self.values[0] * scalar, self.values[1] * scalar, self.values[2] * scalar)

    def dot(self, other):
        return self.values[0] * other.values[0] + self.values[1] * other.values[1] + self.values[2] * other.values[2]

    def cross(self, other):
        return Vec3(self.values[1] * other.values[2] - self.values[2] * other.values[1],
                    self.values[2] * other.values[0] - self.values[0] * other.values[2],
                    self.values[0] * other.values[1] - self.values[1] * other.values[0])


def vector_kernel(n):
    pos, vel, axis = Vec3(1.0, -2.0, 0.5), Vec3(0.125, -0.250, 0.375), Vec3(0.25, 0.5, -0.75)
    checksum = 0.0
    for i in range(n):
        wind = Vec3(((i % 11) - 5.0) * 0.01, ((i % 7) - 3.0) * 0.02, ((i % 5) - 2.0) * 0.015)
        force = vel.cross(axis) + wind - pos * 0.0125
        pos = pos + force * 0.05
        vel = vel + pos.cross(force) * 0.0025
        idx = i % 3
        next_index = (idx + 1) % 3
        pos.set(next_index, pos.get(next_index) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    return pos.dot(vel) + checksum


class PayloadBox:
    __slots__ = ('payload', 'label')

    def __init__(self, payload, label):
        self.payload = payload
        self.label = label

    def swap_with(self, other, label):
        previous = self.payload
        self.payload = other.payload
        self.label = label
        other.payload = previous
        return self.payload[0] + other.payload[1]


def dynamic_member_kernel(n):
    keys = ['x', 'y', 'z']
    state = dict(x=3, y=5, z=7, active=None, label='init')
    boxes = [PayloadBox([1, 2, 3], 'a'), PayloadBox([4, 5, 6], 'b')]
    total = 0
    for i in range(n):
        key = keys[i % 3]
        old = state[key]
        state[key] = old + (i % 17)
        state['active'] = boxes[i % 2]
        state['label'] = key
        box = state['active']
        total = (total + box.swap_with(boxes[(i + 1) % 2], key)) % 1000003
        box.payload[i % 3] = (box.payload[i % 3] + state[key] + i) % 997
        total = (total + box.payload[(i + 2) % 3] + state[key]) % 1000003
    return total + state['x'] * 3 + state['y'] * 5 + state['z'] * 7 + boxes[0].payload[0] * 11 + boxes[1].payload[2] * 13


def dynamic_key_get_set_kernel(n):
    keys, state = ['a', 'b', 'c', 'd'], dict(a=1, b=2, c=3, d=4)
    acc = 0
    for i in range(n):
        key, next_key = keys[i % 4], keys[(i + 1) % 4]
        current = state[key]
        next_value = (current + i * 3 + 7) % 1000003
        state[key] = next_value
        acc = (acc + state[next_key] + next_value) % 1000003
    return acc + state['a'] * 3 + state['b'] * 5 + state['c'] * 7 + state['d'] * 11


def object_member_write_fallback_kernel(n):
    state = dict(active=[1, 2, 3], spare=[4, 5, 6], label='init')
    total = 0
    for i in range(n):
        previous = state['active']
        state['active'] = state['spare']
        state['spare'] = previous
        state['label'] = 'even' if i % 2 == 0 else 'odd'
        state['active'][i % 3] = (state['active'][i % 3] + i + len(state['label'])) % 997
        total = (total + state['active'][(i + 1) % 3] + state['spare'][(i + 2) % 3]) % 1000003
    return total + state['active'][0] * 3 + state['active'][1] * 5 + state['spare'][2] * 7 + len(state['label'])


def array_append_kernel(n):
    values = []
    for i in range(n):
        values.append(i % 251)
    total = 0
    for i in range(n):
        total = (total + values[i] * ((i % 7) + 1)) % 1000003
    return total + len(values) * 13


def array_write_kernel(n):
    values = [0, 0, 0, 0, 0, 0, 0, 0]
    for i in range(n):
        slot = i % 8
        values[slot] = (values[slot] + i * 5 + slot) % 1000003
    total = 0
    for i in range(8):
        total = (total + values[i] * (i + 3)) % 1000003
    return total


def math_intrinsic_kernel(n):
    total = 0.0
    for i in range(n):
        x = float((i % 97) + 1)
        total += math.sqrt(x) + math.sin(0.0) + math.cos(0.0)
        total += math.fabs(-3.5) + math.floor(1.75) + math.ceil(1.25)
        total += math.pow(1.0001, float(i % 5))
    return total


def math_variable_kernel(n):
    total = 0.0
    for i in range(n):
        x = float((i % 97) + 1) * 0.01
        total += math.sqrt(x) + math.sin(x) + math.cos(x) + math.log(x) + math.atan2(x, 0.75) + math.pow(x, 1.125)
    return total


def matrix_kernel(n):
    a = [[1.0, 0.5, -0.25], [-0.75, 1.25, 0.375], [0.625, -0.5, 1.5]]
    v = [1.0, -2.0, 0.75]
    checksum = 0.0
    for i in range(n):
        x = a[0][0] * v[0] + a[0][1] * v[1] + a[0][2] * v[2]
        y = a[1][0] * v[0] + a[1][1] * v[1] + a[1][2] * v[2]
        z = a[2][0] * v[0] + a[2][1] * v[1] + a[2][2] * v[2]
        v[0] = x * 0.125 + ((i % 5) - 2.0) * 0.01
        v[1] = y * 0.125 - ((i % 7) - 3.0) * 0.015
        v[2] = z * 0.125 + ((i % 11) - 5.0) * 0.005
        a[i % 3][(i + 1) % 3] = a[i % 3][(i + 1) % 3] * 0.99 + v[i % 3] * 0.001
        checksum = checksum + v[0] * 0.25 + v[1] * 0.5 - v[2] * 0.125
    return checksum + v[0] * 3.0 + v[1] * 5.0 + v[2] * 7.0


def array_read_kernel(n):
    a, total = [1, 2, 3, 4], 0
    for i in range(n):
        total += a[i % 4]
    return total


def array_float_kernel(n):
    a, total = [0.5, 1.5, 2.5, 3.5], 0.0
    for i in range(n):
        total += a[i % 4]
    return total


KERNEL_NAMES = ['direct_call', 'branch_call', 'float_call', 'numeric_loop', 'vector',
                'dynamic_member', 'dynamic_key_get_set', 'object_member_write_fallback',
                'array_append', 'array_write', 'array_read', 'array_float',
                'math_intrinsic', 'math_variable', 'matrix']
SCALED = {'direct_call', 'branch_call', 'float_call', 'numeric_loop', 'array_read', 'array_float'}
CHECKS = [['array_read', 200, 500, 0], ['array_float', 200, 400, 0.0005], ['direct_call', 400, 193938, 0], ['branch_call', 400, 39196, 0], ['float_call', 400, 5.05511811023622, 1e-12], ['numeric_loop', 400, 2500508, 0], ['vector', 120, 0.021712587807413163, 1e-12], ['dynamic_member', 160, 186190, 0], ['dynamic_key_get_set', 200, 470622, 0], ['object_member_write_fallback', 120, 82710, 0], ['array_append', 300, 134408, 0], ['array_write', 300, 461837, 0], ['math_intrinsic', 80, 1161.312744995912, 1e-09], ['math_variable', 80, 122.66761111643609, 1e-09], ['matrix', 200, -0.3146732297299328, 1e-12]]


def main():
    iterations = int(sys.argv[1]) if len(sys.argv) > 1 else 80000
    warmups = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    if iterations <= 0 or warmups < 0:
        raise ValueError('iterations must be positive and warmups nonnegative')
    kernels = {name: globals()[name + '_kernel'] for name in KERNEL_NAMES}
    for name, n, expected, epsilon in CHECKS:
        actual = kernels[name](n)
        if not math.isfinite(actual) or abs(actual - expected) > epsilon:
            raise ValueError(f'{name}: {actual} expected {expected}')
    sink = 0
    for name, fn in kernels.items():
        n = iterations * (20 if name in SCALED else 1)
        for _ in range(warmups):
            sink += fn(n)
        start = time.perf_counter_ns()
        checksum = fn(n)
        elapsed = time.perf_counter_ns() - start
        print(f'BENCH\t{name}\t{n}\t{elapsed / 1000 / n:.9f}\t{checksum}')
    print(f'SINK\t{sink}')


if __name__ == '__main__':
    main()
