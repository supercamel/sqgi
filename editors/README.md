# SQGI editor support

The repository includes a formatter, a VS Code extension, Vim syntax, and GtkSourceView
4/5 language definitions for Squirrel `.nut` files and typed `.sqk` kernels. No
changes to application source are required.

## VS Code

Requires **VS Code 1.85 or newer**. Highlighting and formatting run inside the
extension; using it requires no separate SQGI, Node.js, or language server.

### Build and install

The extension is not yet published to the Marketplace. To build a local VSIX,
install **Node.js 22 or newer** (with npm), then run from the repository root:

```sh
cd editors/vscode
npm ci
npm run package
code --install-extension sqgi-0.1.0.vsix
```

These commands work in a normal terminal, including Windows PowerShell; no MSYS2
shell is needed. If `code` is not on PATH, open VS Code's Command Palette, run
**Extensions: Install from VSIX…**, and choose `editors/vscode/sqgi-0.1.0.vsix`.
An already-built VSIX can be installed without Node.js. See VS Code's
[VSIX installation guide](https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_install-from-a-vsix).

### Highlighting and formatting

Open a `.nut` or `.sqk` file. The status bar should show **SQGI Squirrel** or
**SQGI Kernel**. Run **Format Document** from the Command Palette to format it.

For automatic formatting, open **Preferences: Open User Settings (JSON)** and
merge these settings into the existing object (or use `.vscode/settings.json`
for this project only):

```json
{
  "[sqgi-squirrel]": {
    "editor.defaultFormatter": "supercamel.sqgi",
    "editor.formatOnSave": true
  },
  "[sqgi-kernel]": {
    "editor.defaultFormatter": "supercamel.sqgi",
    "editor.formatOnSave": true
  }
}
```

The formatter uses the editor's indentation settings and preserves comments,
literals, and existing line breaks. See [formatting behavior](vscode/README.md#formatting-behavior)
for its scope.

### Troubleshooting

If another extension takes over the file, run **Change Language Mode** and choose
**SQGI Squirrel** or **SQGI Kernel**. To make the choice persistent, add:

```json
"files.associations": {
  "*.nut": "sqgi-squirrel",
  "*.sqk": "sqgi-kernel"
}
```

If formatting is unavailable, check the language mode, ensure the SQGI extension
is enabled, and use **Format Document With… → Configure Default Formatter** to
select SQGI. An incomplete string, comment, or delimiter produces a warning and
leaves the document unchanged. This extension supplies highlighting and formatting;
run `sqgicheck` separately for static analysis.

## Vim

The native Vim package highlights `.nut` scripts and `.sqk` kernels, including
SQGI's `async`/`await`, kernel types and math builtins, comments, and multiline
verbatim strings. Install from the repository root:

```sh
mkdir -p ~/.vim/pack/sqgi/start/sqgi
cp -R editors/vim/. ~/.vim/pack/sqgi/start/sqgi/
```

Enable `filetype on` and `syntax on` in your vimrc, then restart Vim. `.nut` uses
filetype `sqgi_squirrel`, replacing Vim's bundled `squirrel` highlighting; `.sqk`
uses `sqgi_kernel`. Other explicit filetype choices are preserved. Existing Vim
settings scoped to `squirrel` should also target `sqgi_squirrel`.

CMake installs the same package under
`share/vim/vimfiles/pack/sqgi/start/sqgi`. If your installation prefix is outside
Vim's runtime search paths, add `<prefix>/share/vim/vimfiles` to `packpath` in your
vimrc or use the user installation above. No Node.js or SQGI runtime is needed
for highlighting. The standalone formatter below can also format Vim buffers:
with `sqgifmt` on PATH, use `:%!sqgifmt` (Node.js required).

## Standalone formatter

The CLI uses the same engine as VS Code and requires **Node.js 18 or newer**:

```sh
tools/sqgifmt demo/kernels/geometry.nut          # formatted text on stdout
tools/sqgifmt --check demo/kernels/geometry.nut  # exit 1 if formatting differs
tools/sqgifmt --write path/to/app.nut path/to/kernel.sqk
tools/sqgifmt --indent 2 < input.nut > output.nut
```

Use `--tabs` for indentation with tabs, `--indent N` for a 1–16-column width, and
`--` before filenames beginning with a dash. Errors exit 2. `--write` formats all
inputs in memory before changing files, so a syntax/encoding error leaves the
entire input batch untouched. Comments, strings, line endings, BOMs, and existing
line breaks are preserved; formatting does not reflow or split statements.

`cmake --install` installs `sqgifmt` plus its engine. On Windows, invoke
`node <install-prefix>/bin/sqgifmt.js`; no MSYS2 shell is needed. Node is required
only for the standalone formatter, not for SQGI itself or formatting in VS Code.

## GtkSourceView

A normal CMake install puts the definitions into
`share/gtksourceview-{4,5}/language-specs`. For a user installation of GtkSourceView 5:

```sh
mkdir -p ~/.local/share/gtksourceview-5/language-specs
cp editors/gtksourceview/*.lang ~/.local/share/gtksourceview-5/language-specs/
```

Restart the editor after installing. Use `gtksourceview-4` for GtkSourceView 4.
Sandboxed applications may need the files bundled inside their sandbox or an
explicit language-manager search path.

For an embedded widget, add this repository's `editors/gtksourceview` directory
to `GtkSource.LanguageManager`'s search path **before** loading languages, then
select `sqgi-squirrel` or `sqgi-kernel` on the buffer. The
[complete SQGI demo](../demo/gtk4/source_editor.nut) shows the setup:

```sh
sqgi demo/gtk4/source_editor.nut
sqgi demo/gtk4/source_editor.nut --kernel
sqgi demo/gtk4/source_editor.nut --check
```

The **Format Document** button uses the shared
[async adapter](gtksourceview/format.nut). Pass an argv array such as
`["node", "/absolute/path/to/tools/sqgifmt"]`; the adapter invokes it without a
shell, sends the buffer over stdin, and applies the result as one undo action.
It discards stale results if the buffer changes while formatting. This adds a
formatter to an embedded widget; installing a `.lang` file alone adds highlighting,
not a formatting command to every GtkSourceView-based application.

## Tests and maintenance

From the repository root:

```sh
node --test editors/vscode/test/formatter.test.js
(cd editors/vscode && npm ci && npm test)
node test/editor/check_corpus.js /path/to/sqgi-with-llvm-kernels
/usr/bin/python3 test/editor/test_gtksource.py
vim -Nu NONE -i NONE -n -es -S test/editor/test_vim.vim
sqgi demo/gtk4/source_editor.nut --check
sqgi test/editor/test_source_adapter.nut
```

The GtkSourceView engine test needs Python GObject Introspection and GtkSourceView
5. The corpus test compiles formatted scripts without executing them and compiles
kernel modules. It also checks token/line preservation and formatter idempotence.
CMake registers the dependency-free formatter tests when Node is available and
the actual Vim highlighting tests when Vim is available.

For a real VS Code extension-host test, run the VS Code **executable** with
`--extensionDevelopmentPath=<repo>/editors/vscode` and
`--extensionTestsPath=<repo>/editors/vscode/test/extension-host.js`, using a
separate user-data directory. On Linux without a display, use `xvfb-run -a`.

All three editors’ grammars are generated from [one vocabulary](language-data.json):
`python3 editors/generate-languages.py`. Re-run the highlighting tests after edits.
The formats follow the [VS Code TextMate guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)
and [GtkSourceView language definition specification](https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/lang-reference.html).
