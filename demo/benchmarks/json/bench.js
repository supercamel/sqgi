'use strict';
const node = typeof process !== 'undefined';
const GLib = node ? null : imports.gi.GLib;
const args = node ? process.argv.slice(2) : ARGV;
const read = node ? p => require('node:fs').readFileSync(p, 'utf8')
    : p => imports.byteArray.toString(GLib.file_get_contents(p)[1]);
const now = node ? () => Number(process.hrtime.bigint()) : () => GLib.get_monotonic_time() * 1000;
const out = node ? s => console.log(s) : s => print(s);
const text = read(args[0]), operation = args[1], n = Number(args[2]);
const value = JSON.parse(text);
function batch(n) {
    let checksum = 0, last;
    if (operation === 'parse') {
        for (let i = 0; i < n; i++) { last = JSON.parse(text); checksum += last.marker; }
    } else if (operation === 'stringify') {
        for (let i = 0; i < n; i++) { last = JSON.stringify(value); checksum += last.length; }
    } else {
        for (let i = 0; i < n; i++) { last = JSON.parse(JSON.stringify(value)); checksum += last.marker; }
    }
    return [checksum, last];
}
batch(n);
const start = now();
const result = batch(n);
const elapsed = now() - start;
out(`${elapsed / n}\t${result[0]}`);
out(operation === 'stringify' ? result[1] : JSON.stringify(result[1]));
