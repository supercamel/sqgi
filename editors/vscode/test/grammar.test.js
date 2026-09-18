'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const textmate = require('vscode-textmate');
const onig = require('vscode-oniguruma');
const data = require('../../language-data.json');

test('both TextMate grammars tokenize real language features', async () => {
    const wasm = fs.readFileSync(require.resolve('vscode-oniguruma/release/onig.wasm'));
    await onig.loadWASM(wasm.buffer.slice(wasm.byteOffset, wasm.byteOffset + wasm.byteLength));
    const registry = new textmate.Registry({
        onigLib: Promise.resolve({ createOnigScanner: p => new onig.OnigScanner(p), createOnigString: s => new onig.OnigString(s) }),
        loadGrammar: async scope => JSON.parse(fs.readFileSync(path.join(__dirname, '../syntaxes', scope.slice(7) + '.tmLanguage.json'), 'utf8'))
    });
    try {
        for (const kind of ['squirrel', 'kernel']) {
            const grammar = await registry.loadGrammar('source.sqgi-' + kind);
            for (const [group, prefix] of [['keywords', 'keyword.control'], ['types', 'storage.type'], ['builtins', 'support.function'], ['constants', 'constant.language']]) {
                for (const word of data[kind][group]) {
                    const tokens = grammar.tokenizeLine(word + ' value', textmate.INITIAL).tokens;
                    assert.ok(tokens[0].scopes.some(s => s.startsWith(prefix)), kind + ': ' + word);
                }
            }
            const lines = ['local s = @"line ""quoted""', 'inside // string', 'end" // comment', '/* block', 'more */ return 0x2a + 1.2e-3;'];
            let state = textmate.INITIAL;
            const results = lines.map(line => { const r = grammar.tokenizeLine(line, state); state = r.ruleStack; return r.tokens; });
            assert.ok(results[1][0].scopes.some(s => s.startsWith('string.quoted.double.verbatim')));
            assert.ok(results[2].at(-1).scopes.some(s => s.startsWith('comment.line')));
            assert.ok(results[3][0].scopes.some(s => s.startsWith('comment.block')));
            assert.ok(results[4].some(t => t.scopes.some(s => s.startsWith('constant.numeric'))));
        }
    } finally { registry.dispose(); }
});

test('vocabulary covers the actual Squirrel keywords and kernel math catalog', () => {
    const root = path.resolve(__dirname, '../../..');
    const lexer = fs.readFileSync(path.join(root, 'Squirrel3/squirrel/sqlexer.cpp'), 'utf8');
    for (const match of lexer.matchAll(/ADD_KEYWORD\((\w+),/g)) {
        if (match[1] !== 'key') assert.ok([...data.squirrel.keywords, ...data.squirrel.constants].includes(match[1]), match[1]);
    }
    const math = fs.readFileSync(path.join(root, 'src/kernel/math.h'), 'utf8');
    for (const match of math.matchAll(/\bX\((\w+)/g)) assert.ok(data.kernel.builtins.includes(match[1]), match[1]);
});
