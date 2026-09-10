import GLib from 'gi://GLib';
const process = {argv: ['gjs', 'module', ...ARGV], hrtime: {bigint: () => BigInt(GLib.get_monotonic_time()) * 1000n}};
const console = {log: print};
// Same operations and allocations as test/bench_member_methods.nut.
'use strict';
const iterations = Number(process.argv[2] || 200000);
const warmups = Number(process.argv[3] || 5);
if (!Number.isSafeInteger(iterations) || iterations <= 0 ||
    !Number.isSafeInteger(warmups) || warmups < 0) throw Error('invalid benchmark arguments');
class MemberRecord {
    constructor() { this.current = null; this.caption = null; this.count = 0; }
}
class OtherRecord {
    constructor() { this.padding = 19; this.count = 0; this.caption = null; this.current = null; }
}
function transfer(a, b, caption, index, next) {
    const previous = a.current;
    a.current = b.current; b.current = previous; a.caption = caption;
    return a.current[index] + b.current[next];
}
function publish(a, input, caption, index, count) {
    a.current = input; a.caption = caption; a.count = count;
    return a.current[index] + a.count;
}
function members(n, width, layout, updates) {
    const pool = [], records = [], captions = ['ready', 'busy', 'idle', 'retry', 'done'];
    for (let j = 0; j < 13; j++) {
        const payload = [];
        for (let k = 0; k < 11; k++) payload.push(j * 11 + k + 1);
        pool.push(payload);
    }
    for (let j = 0; j < width; j++) {
        let record;
        if (layout === 0) record = {current: null, caption: null, count: 0};
        else if (layout === 1) record = new MemberRecord();
        else if (j % 3 === 0) record = {count: 0, caption: null, current: null};
        else if (j % 3 === 1) record = new MemberRecord();
        else record = new OtherRecord();
        record.current = pool[j % 13]; record.caption = captions[j % 5];
        records.push(record);
    }
    let sum = 0;
    for (let i = 0; i < n; i++) {
        const a = records[i % width], index = i % 11;
        if (updates) sum += publish(a, pool[i % 13], captions[i % 5], index, i % 101);
        else sum += transfer(a, records[(i * 7) % width], captions[i % 5], index, (index + 3) % 11);
        sum = sum % 1000003;
    }
    for (const record of records) sum += record.current[0] + record.count + record.caption.length;
    return sum;
}
for (const updates of [false, true]) for (const layout of [0, 1, 2]) {
    const width = updates ? 97 : 17;
    const name = (updates ? 'publish' : 'transfer') + '_' + ['table', 'class', 'mixed'][layout];
    const expected = members(iterations, width, layout, updates);
    for (let w = 0; w < warmups; w++) if (members(iterations, width, layout, updates) !== expected) throw Error(name + ' warm checksum');
    const start = process.hrtime.bigint(), value = members(iterations, width, layout, updates);
    const elapsed = Number(process.hrtime.bigint() - start) / 1000;
    if (value !== expected) throw Error(name + ' checksum');
    console.log(['BENCH', name, iterations, (elapsed / iterations).toFixed(9), value.toPrecision(17)].join('\t'));
}
