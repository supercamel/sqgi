'use strict';
const fs = require('node:fs');
const { format } = require('./formatter');
function main(args) {
    try {
        let write = false, check = false;
        const paths = [], options = {};
        for (let i = 0; i < args.length; ++i) {
            const arg = args[i];
            if (arg === '--help' || arg === '-h') {
                process.stdout.write('Usage: sqgifmt [--check | --write] [--tabs] [--indent N] [--] [FILE ...]\nWithout files, reads stdin and writes formatted source to stdout.\n--check exits 1 when formatting differs; errors exit 2.\n'); return;
            }
            if (arg === '--') { paths.push(...args.slice(i + 1)); break; }
            if (arg === '--write' || arg === '-w') write = true;
            else if (arg === '--check') check = true;
            else if (arg === '--tabs') options.insertSpaces = false;
            else if (arg === '--indent') options.tabSize = Number(args[++i]);
            else if (arg.startsWith('-') && arg !== '-') throw new Error(`Unknown option: ${arg}`);
            else paths.push(arg);
        }
        if (write && check) throw new Error('--write and --check are mutually exclusive');
        if (!paths.length) paths.push('-');
        if (paths.includes('-') && (paths.length > 1 || write)) throw new Error('stdin cannot be combined with files or --write');
        if (paths.length > 1 && !write && !check) throw new Error('Multiple files require --write or --check');
        // Prepare every result before changing any file. Parse errors never cause
        // a partially formatted batch, and buffers are decoded with strict UTF-8.
        const results = paths.map(path => {
            const bytes = fs.readFileSync(path === '-' ? 0 : path);
            const text = new TextDecoder('utf-8', { fatal: true, ignoreBOM: true }).decode(bytes);
            return { path, text, result: format(text, options) };
        });
        for (const item of results) {
            if (check) {
                if (item.text !== item.result) { process.stderr.write(`${item.path}: needs formatting\n`); process.exitCode = 1; }
            } else if (write) {
                if (item.text !== item.result) fs.writeFileSync(item.path, item.result, 'utf8');
            } else process.stdout.write(item.result);
        }
    } catch (error) { process.stderr.write(`sqgifmt: ${error.message}\n`); process.exitCode = 2; }
}
module.exports = { main };
