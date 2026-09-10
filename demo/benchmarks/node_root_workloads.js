// Same operations as test/bench_root_workloads.nut; works in Node and GJS.
'use strict';
const node = typeof process !== 'undefined';
const args = node ? process.argv.slice(2) : ARGV;
const iterations = Number(args[0] || 200000), warmups = Number(args[1] || 5);
if (!Number.isSafeInteger(iterations) || iterations <= 0 ||
    !Number.isSafeInteger(warmups) || warmups < 0) throw Error('invalid benchmark arguments');
const now = node ? () => Number(process.hrtime.bigint()) / 1000
                 : () => imports.gi.GLib.get_monotonic_time();
const output = node ? text => console.log(text) : text => print(text);
let rootNumeric = 0, rootPayload = null;
class OwnCounter {
    constructor() { this.value = 0; }
    update(next) { this.value = next; return next; }
}
class RootCounter {
    update(next) { rootNumeric = next; return next; }
}
class RootTransform {
    update(next) { rootNumeric = next; return next + 1; }
}
class RootPublisher {
    update(next) { rootPayload = next; return next[0]; }
}
function counterWork(n, shared) {
    rootNumeric = 0;
    const receiver = shared ? new RootCounter() : new OwnCounter();
    let sum = 0;
    for (let i = 0; i < n; i++) sum = (sum + receiver.update((i * 13 + 7) % 997)) % 1000003;
    return sum + (shared ? rootNumeric : receiver.value);
}
function referenceWork(n) {
    rootPayload = null;
    const receiver = new RootPublisher(), pool = [];
    let sum = 0;
    for (let j = 0; j < 17; j++) pool.push([j * 23 + 5]);
    for (let i = 0; i < n; i++) sum = (sum + receiver.update(pool[i % 17])) % 1000003;
    return sum + rootPayload[0];
}
function transformedWork(n) {
    rootNumeric = 0;
    const receiver = new RootTransform();
    let sum = 0;
    for (let i = 0; i < n; i++) sum = (sum + receiver.update((i * 13 + 7) % 997)) % 1000003;
    return sum + rootNumeric;
}
for (const [name, f] of [
    ['receiver_integer', n => counterWork(n, false)],
    ['root_integer', n => counterWork(n, true)],
    ['root_reference', referenceWork],
    ['root_integer_result', transformedWork],
]) {
    const expected = f(iterations);
    for (let w = 0; w < warmups; w++) if (f(iterations) !== expected) throw Error(name + ' warm checksum');
    const start = now(), value = f(iterations), elapsed = now() - start;
    if (value !== expected) throw Error(name + ' checksum');
    output(['BENCH', name, iterations, (elapsed / iterations).toFixed(9), value].join('\t'));
}
