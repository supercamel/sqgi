'use strict';
// Port of spatial_index.nut's object-tree query, including result allocation.
// The fixture contains RouteTastic's actual tree: no differing sort/tie rules.
const isNode = typeof process !== 'undefined';
const args = isNode ? process.argv.slice(2) : ARGV;
const text = isNode ? (await import('node:fs')).readFileSync(args[0], 'utf8')
                    : new TextDecoder().decode(imports.gi.GLib.file_get_contents(args[0])[1]);
const fixture = JSON.parse(text);
const now = isNode ? () => Number(process.hrtime.bigint()) / 1e9
                   : () => imports.gi.GLib.get_monotonic_time() / 1e6;
function intersects(a, b) {
    return !(a.maxx < b.minx || b.maxx < a.minx || a.maxy < b.miny || b.maxy < a.miny);
}
function query(root, box) {
    const out = [], pending = [root];
    while (pending.length > 0) {
        const node = pending.pop();
        if (!intersects(node.bbox, box)) continue;
        if (node.entries !== null) {
            for (const entry of node.entries) if (intersects(entry.bbox, box)) out.push(entry.obj);
        } else {
            pending.push(node.right); pending.push(node.left);
        }
    }
    return out;
}
const runs = [];
for (let repeat = 0; repeat < 6; repeat++) {
    const start = now(); let checksum = 0, matches = 0;
    for (const box of fixture.queries) for (const id of query(fixture.tree, box)) {
        checksum = (checksum * 31 + id) & 0x7fffffff; matches++;
    }
    const seconds = now() - start;
    if (checksum !== fixture.checksum || matches !== fixture.matches) throw new Error('spatial result mismatch');
    runs.push({repeat, seconds, checksum, matches});
}
const result = JSON.stringify({queries: fixture.queries.length, runs});
if (isNode) console.log(result); else print(result);
