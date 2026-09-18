'use strict';
const vscode = require('vscode');
const { format } = require('./formatter');
function activate(context) {
    for (const language of ['sqgi-squirrel', 'sqgi-kernel']) {
        context.subscriptions.push(vscode.languages.registerDocumentFormattingEditProvider(language, {
            provideDocumentFormattingEdits(document, options) {
                try {
                    const source = document.getText();
                    const result = format(source, options);
                    if (source === result) return [];
                    const range = new vscode.Range(document.positionAt(0), document.positionAt(source.length));
                    return [vscode.TextEdit.replace(range, result)];
                } catch (error) {
                    vscode.window.showWarningMessage(`SQGI formatter: ${error.message}`);
                    return [];
                }
            }
        }));
    }
}
module.exports = { activate };
