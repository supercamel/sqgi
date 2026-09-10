import GLib from 'gi://GLib';
const process = {argv: ['gjs', 'module', ...ARGV], hrtime: {bigint: () => BigInt(GLib.get_monotonic_time()) * 1000n}};
const console = {log: print};
// Same operations and allocations as test/bench_member_owners.nut.
'use strict';
const iterations = Number(process.argv[2] || 200000);
const warmups = Number(process.argv[3] || 5);
if (!Number.isSafeInteger(iterations) || iterations <= 0 ||
    !Number.isSafeInteger(warmups) || warmups < 0) throw Error('invalid benchmark arguments');
class OwnerRecord {
    constructor() { this.current = null; this.epoch = 0; this.scale = 0.0; }
}
function recycle(record, pool, n, width) {
    let sum = 0.0;
    for (let i = 0; i < n; i++) {
        const old = record.current;
        record.current = pool[i % width];
        record.current[0] = (old[0] + i) % 997;
        record.epoch = i; record.scale = record.scale + 0.25;
        sum += record.current[0] + record.epoch % 17 + record.scale;
    }
    return sum;
}
function owners(n, width, classes) {
    const pool = [];
    for (let j = 0; j < width; j++) pool.push([j + 1]);
    const record = classes ? new OwnerRecord() : {current: null, epoch: 0, scale: 0.0};
    record.current = pool[width - 1];
    let sum = recycle(record, pool, n, width);
    for (const value of pool) sum += value[0];
    return sum + record.epoch + record.scale;
}
for (const classes of [false, true]) for (const width of [1, 2, 5, 19, 257]) {
    const name = (classes ? 'class' : 'table') + '_owners_' + width;
    const expected = owners(iterations, width, classes);
    for (let w = 0; w < warmups; w++) if (owners(iterations, width, classes) !== expected) throw Error(name + ' warm checksum');
    const start = process.hrtime.bigint(), value = owners(iterations, width, classes);
    const elapsed = Number(process.hrtime.bigint() - start) / 1000;
    if (value !== expected) throw Error(name + ' checksum');
    console.log(['BENCH', name, iterations, (elapsed / iterations).toFixed(9), value.toPrecision(17)].join('\t'));
}
