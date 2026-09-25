# C-DOC: authored document and file transactions

Requirements: R-DOC-01 through R-DOC-08; R-SCOPE-01, R-SCOPE-06.

## Interface

`Document(text = "{}", path = null)` parses a top-level JSON object and retains
original bytes. `value`, `text`, `path`, `dirty`, `valid`, and `error` describe
the editor state. JSON paths are arrays of string keys and integer indices.

- `get(path)` and `has(path)` distinguish absent values from null.
- `set(path, value)` and `unset(path)` make a single undoable semantic change.
- `edit_json(text)` retains a draft and atomically updates the model on valid
  object JSON. Invalid drafts set `valid=false` and retain the last valid model.
- `undo()` / `redo()` restore text, model validity, and values together.
- `changes()` returns authored changes, not expanded resolver defaults.
- `save(path = current, relocation = null)` atomically saves valid object JSON.
  A new path in another directory requires an explicit relocation policy.
- `digest()` identifies exact current saved bytes; no-op saves preserve bytes.

## Invariants

**C-DOC-01 Preservation:** editing one path cannot change unrelated JSON values;
arrays retain order, false/null and legacy/unknown data survive. A no-op save
does not touch the file. Deterministic pretty formatting applies after edits.

**C-DOC-02 History:** invalid JSON has no partial effect on `value`. Undo/redo
restores both invalid drafts and valid edits. Form mutation is refused while
an invalid draft is active. Undo after save recomputes dirty state correctly.

**C-DOC-03 Save:** compare the file's current bytes/etag with the opened/saved
baseline immediately before atomic replacement. A conflict or IO failure leaves
the original file and draft intact. Saving syntactically valid schema-invalid
JSON is permitted. A no-op file check must still detect external modification.

**C-DOC-04 Relocation:** default Save As is within the same project directory.
A move to another directory requires a preview of rebased path values, using
known path semantics (including project-relative native outputs). If an unknown
field prevents reliable rebasing, refuse automatic rebasing and let the user
save a literal copy explicitly. Never silently reinterpret relative paths.

**C-DOC-05 Build revision:** only valid, saved object JSON is buildable. Return
its file path/digest; recorded results carry that identity. No open/save operation
can invoke a hook, process, or network operation.

Acceptance IDs: `DOC-preservation`, `DOC-history`, `DOC-atomic-save`,
`DOC-relocation`, `DOC-build-revision`. Tests include all existing manifests,
invalid JSON, arrays, explicit null/false, external modification, and Unicode.
