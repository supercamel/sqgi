'use strict';
// Same linear-scan A*, neighbour order and tie breaking as astar.sqk.
// Float64Array uses the kernel's 8-byte cell layout. Int32Array is an
// idiomatic smaller representation; all values in this workload fit exactly.
const assert = require('node:assert/strict');
const N = 256;
let sink = 0;
function distance(a, b) {
    return Math.abs((a >> 4) - (b >> 4)) + Math.abs((a & 15) - (b & 15));
}
function search(grid, state, path, start, goal) {
    for (let i = 0; i < N; ++i) {
        state[4*i] = 1000000; state[4*i+1] = 1000000;
        state[4*i+2] = -1; state[4*i+3] = 0; path[i] = -1;
    }
    if (grid[start] !== 0 || grid[goal] !== 0) return -1;
    state[start*4] = 0; state[start*4+1] = distance(start, goal); state[start*4+3] = 1;
    for (;;) {
        let current = -1, best = 1000000;
        for (let i = 0; i < N; ++i) {
            if (state[4*i+3] === 1 && state[4*i+1] < best) {
                best = state[4*i+1]; current = i;
            }
        }
        if (current === -1) return -1;
        if (current === goal) {
            let length = 0;
            while (current !== -1) { path[length++] = current; current = state[current*4+2]; }
            return length;
        }
        state[current*4+3] = 2;
        const row = current >> 4, col = current & 15;
        for (let direction = 0; direction < 4; ++direction) {
            let r = row, c = col;
            if (direction === 0) --r;
            if (direction === 1) ++r;
            if (direction === 2) --c;
            if (direction === 3) ++c;
            if (r >= 0 && r < 16 && c >= 0 && c < 16) {
                const next = r*16+c;
                if (grid[next] === 0 && state[next*4+3] !== 2) {
                    const candidate = state[current*4]+1;
                    if (candidate < state[next*4]) {
                        state[next*4] = candidate; state[next*4+1] = candidate+distance(next, goal);
                        state[next*4+2] = current; state[next*4+3] = 1;
                    }
                }
            }
        }
    }
}
function bfs(grid, start, goal) {
    const depths = new Int32Array(N).fill(-1), queue = [start]; depths[start] = 0;
    for (let head = 0; head < queue.length; ++head) {
        const cell = queue[head]; if (cell === goal) return depths[cell];
        for (const [dr, dc] of [[-1,0],[1,0],[0,-1],[0,1]]) {
            const r = (cell >> 4)+dr, c = (cell & 15)+dc;
            if (r < 0 || r >= 16 || c < 0 || c >= 16) continue;
            const next = r*16+c;
            if (!grid[next] && depths[next] < 0) { depths[next] = depths[cell]+1; queue.push(next); }
        }
    }
    return -1;
}
// Match the C++ fixture's whole-buffer checksum, including virtual guard cells.
function checksum(buffers, result) {
    let hash = BigInt.asUintN(64, BigInt(result));
    function add(value) { hash = BigInt.asUintN(64, (hash ^ BigInt.asUintN(64, value))*1099511628211n); }
    for (const buffer of buffers) {
        add(0x13579bdf2468ace0n);
        for (const value of buffer) add(BigInt(value));
        add(0xfedcba9876543210n);
    }
    return hash.toString();
}
// Use one representation per process to avoid cross-type IC pollution.
const kind = process.argv[2] || 'float64';
assert.ok(['float64', 'int32'].includes(kind), 'usage: node node_astar.js [float64|int32]');
const Storage = kind === 'float64' ? Float64Array : Int32Array;
const cases = [];
for (const pattern of ['open', 'maze', 'unreachable', 'same']) {
    const grid = new Storage(N), state = new Storage(N*4), path = new Storage(N);
    for (let i = 0; i < N; ++i) {
        const r = i >> 4, c = i & 15;
        grid[i] = (pattern === 'maze' ? (c === 5 && r !== 12) || (c === 10 && r !== 3) : pattern === 'unreachable' && r === 8) ? 1 : 0;
    }
    const goal = pattern === 'same' ? 0 : 255;
    function batch(repetitions) {
        const start = process.hrtime.bigint();
        for (let i = 0; i < repetitions; ++i) sink = search(grid, state, path, 0, goal);
        return Number(process.hrtime.bigint()-start)/repetitions;
    }
    const warmStart = process.hrtime.bigint();
    do { batch(100); } while (process.hrtime.bigint()-warmStart < 100000000n);
    const repetitions = Math.max(1, Math.min(100000, Math.floor(1e7/batch(100))));
    const samples = Array.from({length: 9}, () => batch(repetitions)).sort((a,b) => a-b);
    const length = search(grid, state, path, 0, goal), shortest = bfs(grid, 0, goal);
    assert.equal(length, shortest < 0 ? -1 : shortest+1);
    if (length > 0) {
        assert.equal(path[0], goal); assert.equal(path[length-1], 0);
        const seen = new Set();
        for (let i = 0; i < length; ++i) {
            assert.ok(path[i] >= 0 && path[i] < N && grid[path[i]] === 0 && !seen.has(path[i]));
            seen.add(path[i]); if (i) assert.equal(distance(path[i-1], path[i]), 1);
        }
    }
    for (let i = Math.max(0, length); i < N; ++i) assert.equal(path[i], -1);
    cases.push({workload: 'astar', pattern, storage: kind, repetitions, samples: 9,
        node_ns: samples[4], min_ns: samples[0], max_ns: samples[8], checksum: checksum([grid,state,path],length)});
}
console.log(JSON.stringify({node: process.version, v8: process.versions.v8, cases, sink}, null, 2));
