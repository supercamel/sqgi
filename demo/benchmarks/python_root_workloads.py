"""Pure-Python equivalent of the independent mutable-root holdouts."""
import sys
from time import perf_counter_ns

root_numeric = 0
root_payload = None


class OwnCounter:
    def __init__(self):
        self.value = 0

    def update(self, value):
        self.value = value
        return value


class RootCounter:
    def update(self, value):
        global root_numeric
        root_numeric = value
        return value


class RootPublisher:
    def update(self, value):
        global root_payload
        root_payload = value
        return value[0]


class RootTransform:
    def update(self, value):
        global root_numeric
        root_numeric = value
        return value + 1


def counter_work(n, shared):
    global root_numeric
    root_numeric = 0
    receiver = RootCounter() if shared else OwnCounter()
    total = 0
    for i in range(n):
        total = (total + receiver.update((i * 13 + 7) % 997)) % 1000003
    return total + (root_numeric if shared else receiver.value)


def reference_work(n):
    global root_payload
    root_payload = None
    receiver, pool, total = RootPublisher(), [], 0
    for j in range(17):
        pool.append([j * 23 + 5])
    for i in range(n):
        total = (total + receiver.update(pool[i % 17])) % 1000003
    return total + root_payload[0]


def transformed_work(n):
    global root_numeric
    root_numeric = 0
    receiver, total = RootTransform(), 0
    for i in range(n):
        total = (total + receiver.update((i * 13 + 7) % 997)) % 1000003
    return total + root_numeric


if __name__ == '__main__':
    iterations = int(sys.argv[1]) if len(sys.argv) > 1 else 200000
    warmups = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    if iterations <= 0 or warmups < 0:
        raise ValueError('invalid benchmark arguments')
    for name, f in [('receiver_integer', lambda n: counter_work(n, False)),
                    ('root_integer', lambda n: counter_work(n, True)),
                    ('root_reference', reference_work),
                    ('root_integer_result', transformed_work)]:
        expected = f(iterations)
        for _ in range(warmups):
            if f(iterations) != expected:
                raise ValueError(name + ' warm checksum')
        start = perf_counter_ns()
        value = f(iterations)
        elapsed = (perf_counter_ns() - start) / 1000
        if value != expected:
            raise ValueError(name + ' checksum')
        print(f'BENCH\t{name}\t{iterations}\t{elapsed / iterations:.9f}\t{value}')
