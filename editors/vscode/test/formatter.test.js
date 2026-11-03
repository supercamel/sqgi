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
        assert.ok(r.endsWith(eol));
        assert.ok(!r.replaceAll(eol, '').match(/[\r\n]/));
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

// These cases must preserve more than token order: Squirrel uses newlines as
// statement boundaries, and adding a scope can change local variable lifetime.
const safetyCases = {
    'nested unbraced controls': 'if (true)\nif (false)\nprint("bad")\nelse\nprint("ok")\n',
    'multiline unbraced call': 'if (true)\nprint(\n"ok"\n)\n',
    'unbraced local scope': 'if (true)\nlocal value = 7\nprint(value)\n',
    'do while terminator': 'local n=0\ndo\n++n\nwhile (n < 2)\nprint(n)\n',
    'control text inside literal': 'local s=@"text\nif (true)\nliteral body\nend"\nprint(s)\n',
    'control text inside comment': '/*\nif (true)\ncomment body\n*/\nprint("ok")\n',
    'comment as unbraced body prefix': 'if (true)\n/* explanation */\nprint("ok")\n',
    'same-line body followed by return boundary': 'function f() { return\n7\n}\nprint(f())\n',
    'function expression invocation': 'print((function() { return 7 })())\n',
    'mixed line endings inside literals': 'local s=@"one\r\ntwo\nthree\r\nfour"\nprint(s)\r\n',
    'trailing comment after brace': 'if (true) { // keep body\nprint("ok")\n}\n',
};
for (const [name, source] of Object.entries(safetyCases)) {
    test(`safety: ${name}`, () => {
        const result = format(source);
        assert.deepEqual(signature(tokenize(result)), signature(tokenize(source)));
        assert.equal(format(result), result);
    });
}

test('formatted programs compile and behave identically in SQGI', t => {
    const runtime = process.env.SQGI_TEST_EXECUTABLE || 'sqgi';
    const probe = spawnSync(runtime, ['--version'], { encoding: 'utf8', timeout: 5000 });
    if (probe.error && probe.error.code === 'ENOENT' && !process.env.SQGI_TEST_EXECUTABLE) {
        t.skip('sqgi unavailable; set SQGI_TEST_EXECUTABLE to enable runtime checks');
        return;
    }
    assert.equal(probe.status, 0, probe.stderr);
    for (const [name, source] of Object.entries(safetyCases)) {
        const run = text => spawnSync(runtime, ['-e', text], { encoding: 'utf8', timeout: 5000 });
        const original = run(source);
        assert.equal(original.status, 0, `${name}: original: ${original.stderr}`);
        const formatted = run(format(source));
        assert.equal(formatted.status, 0, `${name}: formatted: ${formatted.stderr}`);
        assert.equal(formatted.stdout, original.stdout, name);
        assert.equal(formatted.stderr, original.stderr, name);
    }
});

test('repository demos and tests preserve tokens, line boundaries and idempotence', () => {
    const root = path.resolve(__dirname, '../../..');
    let checked = 0;
    function visit(dir) {
        for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
            const file = path.join(dir, entry.name);
            if (entry.isDirectory()) visit(file);
            else if (/\.(nut|sqk)$/.test(entry.name)) {
                const source = fs.readFileSync(file, 'utf8');
                const result = format(source);
                assert.deepEqual(signature(tokenize(result)), signature(tokenize(source)), file);
                assert.equal(format(result), result, file);
                ++checked;
            }
        }
    }
    visit(path.join(root, 'demo'));
    visit(path.join(root, 'test'));
    assert.ok(checked > 0, 'repository corpus must not be empty');
});
