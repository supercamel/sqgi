'use strict';
const vscode = require('vscode');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
exports.run = async function () {
    const extension = vscode.extensions.getExtension('supercamel.sqgi');
    assert.ok(extension); await extension.activate();
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'sqgi-vscode-'));
    try {
        for (const [suffix, language, source, expected] of [
            ['nut', 'sqgi-squirrel', 'async function f(){\nreturn 1+2\n}\n', 'async function f() {\n  return 1 + 2\n}\n'],
            ['sqk', 'sqgi-kernel', 'export i64 f(){\nreturn 1+2;\n}\n', 'export i64 f() {\n  return 1 + 2;\n}\n']
        ]) {
            const file = path.join(dir, 'test.' + suffix); fs.writeFileSync(file, source);
            const doc = await vscode.workspace.openTextDocument(vscode.Uri.file(file));
            assert.equal(doc.languageId, language);
            const edits = await vscode.commands.executeCommand('vscode.executeFormatDocumentProvider', doc.uri, { tabSize: 2, insertSpaces: true });
            assert.ok(edits.length > 0);
            const edit = new vscode.WorkspaceEdit(); edit.set(doc.uri, edits);
            assert.ok(await vscode.workspace.applyEdit(edit));
            assert.equal(doc.getText(), expected);
        }
    } finally { fs.rmSync(dir, { recursive: true, force: true }); }
    console.log('SQGI extension host: associations and formatting passed');
};
