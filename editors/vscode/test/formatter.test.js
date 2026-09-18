'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');
const { format, tokenize, signature } = require('../src/formatter');
const cli = path.resolve(__dirname, '../../..', 'tools/sqgifmt');

test('spacing, indentation, kernel types and unary operators', () => {
    assert.equal(format('export f64 f( f64 x ){\nreturn sqrt(x*x)+ -x;\n}\n'),
        'export f64 f(f64 x) {\n    return sqrt(x * x) + -x;\n}\n');
    assert.equal(format('local a={x=1,y=[2,3]}\n'), 'local a = { x = 1, y = [2, 3] }\n');
});
test('preserves semicolon-optional statement boundaries and line endings', () => {
    for (const eol of ['\n', '\r\n', '\r']) {
        const s = ['function f(){', 'return', '-1', '}', '', ''].join(eol);
        const r = format(s);
        assert.deepEqual(signature(tokenize(r)), signature(tokenize(s)));
        assert.equal(format(r), r);
        assert.equal(r.split(eol).length, s.split(eol).length);
    }
});
test('strings, comments, verbatim strings and BOM remain byte-identical', () => {
    const s = '\uFEFF#!/usr/bin/env sqgi\r\nfunction f(){\r\nlocal s=@"a ""quoted""\r\n  literal { // text\r\n"\r\n/* text\r\n * keep  spacing */\r\nreturn "\\\"{}" // untouched   \r\n}\r\n';
    const r = format(s);
    assert.deepEqual(signature(tokenize(r)), signature(tokenize(s)));
    assert.equal(format(r), r);
});
test('does not merge tokens into comments, literals or compound operators', () => {
    for (const s of ['x + +y\n', 'x - -y\n', 'a / *b\n', 'x < -y\n', 'x > >y\n', '1 . tostring()\n', 'local a = @ (x) x + 1\n']) {
        assert.deepEqual(signature(tokenize(format(s))), signature(tokenize(s)));
    }
});
test('tabs, comments before unbraced bodies, and multiple closing delimiters', () => {
    const s = 'function f(){\nif(x)\n// body\nreturn call([\n1,2\n]);\n}\n';
    const r = format(s, { tabSize: 2, insertSpaces: false });
    assert.equal(format(r, { tabSize: 2, insertSpaces: false }), r);
    assert.ok(r.includes('\n\tif (x)'));
});
test('rejects incomplete source and invalid formatting options', () => {
    for (const s of ['"abc', '/* abc', 'f(', '{]', '@"oops']) assert.throws(() => format(s));
    for (const tabSize of [0, -1, 17, NaN, 1.5]) assert.throws(() => format('x', { tabSize }));
});
test('CLI stdin, check, write, paths with spaces, and errors without modification', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'sqgifmt-'));
    try {
        const file = path.join(dir, 'space name.nut');
        const bad = path.join(dir, 'bad.nut');
        fs.writeFileSync(file, 'local x=1\n'); fs.writeFileSync(bad, 'f(');
        const invoke = (args, input) => spawnSync(process.execPath, [cli, ...args], { input, encoding: 'utf8' });
        assert.equal(invoke(['--check', file]).status, 1);
        assert.equal(invoke(['--write', file, bad]).status, 2);
        assert.equal(fs.readFileSync(file, 'utf8'), 'local x=1\n');
        assert.equal(invoke(['--write', file]).status, 0);
        assert.equal(invoke(['--check', file]).status, 0);
        assert.equal(invoke([], 'local x=1\n').stdout, 'local x = 1\n');
        assert.equal(invoke(['--write'], 'x').status, 2);
        assert.equal(invoke([], Buffer.from([0xff])).status, 2);
        assert.equal(invoke(['--wat']).status, 2);
    } finally { fs.rmSync(dir, { recursive: true, force: true }); }
});

test('prototype-named identifiers and control blocks remain ordinary syntax', () => {
    const s = 'class A{\nconstructor(x){\nthis.toString=x\n}\n}\nif(x)\n{\nf()\n}\n';
    const r = format(s);
    assert.equal(format(r), r);
    assert.ok(r.includes('if (x)\n{\n    f()'));
});
