#!/usr/bin/env node
'use strict';
const fs = require('node:fs');
const path = require('node:path');
const os = require('node:os');
const assert = require('node:assert/strict');
const { spawnSync } = require('node:child_process');
const { format, tokenize, signature } = require('../../editors/vscode/src/formatter');
const root = path.resolve(__dirname, '../..');
const sqgi = process.argv[2];
if (!sqgi) throw new Error('Usage: node test/editor/check_corpus.js /path/to/sqgi-with-kernels');
const listed = spawnSync('rg', ['--files', 'demo', 'test', 'tools/sqgipkg_lib', 'editors/gtksourceview', '-g', '*.nut', '-g', '*.sqk'], { cwd: root, encoding: 'utf8' });
if (listed.status) throw new Error(listed.stderr);
const files = listed.stdout.trim().split('\n').filter(f => !f.startsWith('test/') || /^test\/test_[^/]+\.nut$/.test(f) || f.startsWith('test/editor/'));
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sqgi-format-corpus-'));
try {
    const formatted = [];
    for (const [i, file] of files.entries()) {
        const source = fs.readFileSync(path.join(root, file), 'utf8');
        let result;
        try { result = format(source); }
        catch (error) { throw new Error(file + ': ' + error.message); }
        assert.equal(format(result), result, 'idempotence: ' + file);
        assert.deepEqual(signature(tokenize(result)), signature(tokenize(source)), file);
        const target = path.join(temp, i + path.extname(file));
        fs.writeFileSync(target, result); formatted.push(target);
    }
    const driver = path.join(temp, 'compile.nut');
    fs.writeFileSync(driver, 'foreach (p in vargv) { if (p.slice(-4) == ".sqk") sqgi.kernel.load(p); else loadfile(p); }\nprint("compile checks passed\\n");\n');
    const proc = spawnSync(path.resolve(sqgi), [driver, ...formatted], { cwd: root, encoding: 'utf8', timeout: 120000 });
    if (proc.status !== 0) throw new Error(proc.stdout + proc.stderr);
    console.log(`${files.length} source files: token/newline preservation, idempotence, and compilation passed`);
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
