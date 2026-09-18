'use strict';

// Keep token spelling and every source line boundary intact. In Squirrel a
// newline can terminate a statement, and changing it can change the program.
const operators = ['<=>', '>>>', '<<=', '>>=', '...', '==', '!=', '<=', '>=', '<-',
    '++', '--', '+=', '-=', '*=', '/=', '%=', '&&', '||', '<<', '>>', '::', '</', '/>'];
const number = /^(?:0[xX][\da-fA-F]+|(?:\d+\.\d*|\.\d+|\d+)(?:[eE][+-]?\d+)?)/;
const word = /^[\p{L}_$][\p{L}\p{N}_$]*/u;
const controls = new Set(['if', 'for', 'foreach', 'while', 'switch', 'catch']);
const prefixWords = new Set(['return', 'throw', 'yield', 'await', 'resume', 'delete', 'clone', 'typeof', 'in']);
const binary = new Set(['=', '<-', '+', '-', '*', '/', '%', '+=', '-=', '*=', '/=', '%=',
    '==', '!=', '<', '>', '<=', '>=', '<=>', '&&', '||', '&', '|', '^', '<<', '>>', '>>>', '?', ':']);

function tokenize(source) {
    const tokens = [];
    let pos = 0, line = 0;
    function take(end, kind) {
        const text = source.slice(pos, end);
        tokens.push({ text, kind, line });
        line += (text.match(/\r\n|\r|\n/g) || []).length;
        pos = end;
    }
    while (pos < source.length) {
        const rest = source.slice(pos), c = source[pos];
        if (pos === 0 && c === '\uFEFF') { take(pos + 1, 'bom'); continue; }
        const ws = /^[ \t\v\f]+/.exec(rest);
        if (ws) { take(pos + ws[0].length, 'space'); continue; }
        const nl = /^(?:\r\n|\r|\n)/.exec(rest);
        if (nl) { take(pos + nl[0].length, 'newline'); continue; }
        if (rest.startsWith('//') || c === '#') {
            const end = rest.search(/[\r\n]/);
            take(end < 0 ? source.length : pos + end, 'comment'); continue;
        }
        if (rest.startsWith('/*')) {
            const end = source.indexOf('*/', pos + 2);
            if (end < 0) throw new Error(`Unterminated block comment on line ${line + 1}`);
            take(end + 2, 'comment'); continue;
        }
        const verbatim = rest.startsWith('@"');
        if (verbatim || c === '"' || c === "'") {
            const quote = verbatim ? '"' : c;
            let end = pos + (verbatim ? 2 : 1), closed = false;
            for (; end < source.length; ++end) {
                if (!verbatim && source[end] === '\\') { ++end; continue; }
                if (source[end] === quote) {
                    if (verbatim && source[end + 1] === '"') { ++end; continue; }
                    ++end; closed = true; break;
                }
            }
            if (!closed) throw new Error(`Unterminated string on line ${line + 1}`);
            take(end, 'string'); continue;
        }
        const numeric = number.exec(rest);
        if (numeric) { take(pos + numeric[0].length, 'number'); continue; }
        const identifier = word.exec(rest);
        if (identifier) { take(pos + identifier[0].length, 'word'); continue; }
        const op = operators.find(value => rest.startsWith(value));
        take(pos + (op ? op.length : 1), 'punct');
    }
    return tokens;
}

function signature(tokens) {
    return tokens.filter(t => t.kind !== 'space').map(t => [t.kind, t.text]);
}

function format(source, options = {}) {
    const width = options.tabSize === undefined ? 4 : options.tabSize;
    if (!Number.isInteger(width) || width < 1 || width > 16) throw new Error('tabSize must be an integer from 1 to 16');
    const unit = options.insertSpaces === false ? '\t' : ' '.repeat(width);
    const tokens = tokenize(source), out = [], stack = [];
    let start = true, prev = null, prevCode = null;
    let lineTokens = [], extraIndent = 0;
    const close = Object.assign(Object.create(null), { '}': '{', ')': '(', ']': '[' });
    const opens = new Set(['{', '(', '[']);
    function spacing(left, right) {
        if (!left) return '';
        const a = left.text, b = right.text;
        if (right.kind === 'comment' || left.kind === 'comment') return ' ';
        // Never turn separate punctuation/number tokens into a new token.
        if ((operators.includes(a + b)) || a + b === '//' || a + b === '/*' ||
            (a === '@' && right.kind === 'string') ||
            (a === '.' && right.kind === 'number') || (left.kind === 'number' && b === '.')) return ' ';
        if (['.', '::'].includes(a) || ['.', '::'].includes(b)) return '';
        if ([',', ';', ')', ']'].includes(b)) return '';
        if (a === '(' || a === '[') return '';
        if (a === '{' && b === '}') return '';
        if (left.unary) return '';
        if ((b === '++' || b === '--') && !right.unary) return '';
        if (b === '(') return controls.has(a) || prefixWords.has(a) ? ' ' : '';
        if (b === '[' && (left.kind === 'word' || [')', ']'].includes(a)) && !prefixWords.has(a)) return '';
        if (b === ':') return '';
        return ' ';
    }
    for (let i = 0; i < tokens.length; ++i) {
        const t = tokens[i];
        if (t.kind === 'space') continue;
        if (t.kind === 'bom') { out.push(t.text); continue; }
        if (t.kind === 'newline') {
            out.push(t.text); start = true; prev = null;
            const last = lineTokens[lineTokens.length - 1];
            if (last) {
                const unbraced = controls.has(lineTokens[0].text) && last.text === ')';
                extraIndent = unbraced || binary.has(last.text) ? 1 : 0;
            }
            lineTokens = [];
            continue;
        }
        t.unary = ['!', '~', '+', '-', '++', '--'].includes(t.text) &&
            (!prevCode || binary.has(prevCode.text) || opens.has(prevCode.text) ||
             [',', ';'].includes(prevCode.text) || prefixWords.has(prevCode.text));
        if (start) {
            // A sequence such as }]); closes all three levels before indenting.
            let leadingCloses = 0;
            for (let j = i; j < tokens.length; ++j) {
                if (tokens[j].kind === 'space') continue;
                if (!close[tokens[j].text]) break;
                ++leadingCloses;
            }
            let depth = Math.max(0, stack.length - leadingCloses);
            if (t.text === 'case' || t.text === 'default') depth = Math.max(0, depth - 1);
            if (!leadingCloses && t.text !== '{') depth += extraIndent;
            out.push(unit.repeat(depth)); start = false;
        } else {
            out.push(spacing(prev, t));
        }
        out.push(t.text); prev = t;
        if (t.kind === 'comment') continue;
        lineTokens.push(t); prevCode = t;
        if (opens.has(t.text)) stack.push(t.text);
        else if (close[t.text] && stack.pop() !== close[t.text]) {
            throw new Error(`Unmatched ${t.text} on line ${t.line + 1}`);
        }
    }
    if (stack.length) throw new Error('Unclosed delimiter; fix the syntax before formatting');
    const result = out.join('');
    // Refuse an edit if a lexical corner case would change tokens or newlines.
    if (JSON.stringify(signature(tokens)) !== JSON.stringify(signature(tokenize(result)))) {
        throw new Error('Formatting would change tokens; source left unchanged');
    }
    return result;
}
module.exports = { format, tokenize, signature };
