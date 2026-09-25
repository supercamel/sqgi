# C-EDIT: catalog and GTK editor

Requirements: R-EDIT-01 through R-EDIT-10; R-SCOPE-01 through R-SCOPE-04.

## Interface

The catalog consumes the packaged schema plus explicit presentation metadata.
It returns fields with definition/key, label, section, common/advanced, JSON
schema, alias identity, and help. A field reference includes its actual path in
the authored document. The application binds controls to Document operations;
it never owns another independently serialized manifest.

**C-EDIT-01 Coverage:** every schema property can be reached by a typed editor.
References and unions offer their supported forms; object maps and ordered lists
support add/edit/remove. Known nested objects expose individual fields. Aliases
are searchable and existing spelling is retained. Exact unknown values remain
available in JSON. A field coverage audit and a CLI-option classification audit
must report no unclassified entries.

**C-EDIT-02 Guidance:** a four-stage assistant selects project, application,
targets, and review. CLI templates seed sparse v2 manifests. Existing documents
open directly. Common controls apply edits without requiring JSON knowledge.
JIT/kernels are assumed; no first-use toggle disables them.

**C-EDIT-03 Navigation:** seven planned sections, a search entry, advanced groups,
and JSON/diff views are reachable by keyboard. Searching a key selects the field
and makes advanced controls visible. Reset removes the authored property.
Explicit false is not represented as unset.

**C-EDIT-04 Actions:** New/Open/Save/Save As/Undo/Redo/Check/Explain/Cancel
have defined enabled states. Invalid JSON disables form changes and inspection.
Unsaved inspection passes JSON to the CLI with an explicit base directory. Unsaved closing/opening prompts for Save,
Discard, or Cancel. Native file choosers use document-relative display paths.

**C-EDIT-05 Feedback:** diagnostics navigate to paths; discovered imports and
previews are visibly separate from authored choices. Target summary shows
effective data. Large logs are bounded; errors include text and preserve detail.
Labels associate with controls and layout expands at larger font/display scale.

Acceptance IDs: `EDIT-coverage`, `EDIT-structured-values`, `EDIT-guidance`,
`EDIT-navigation`, `EDIT-actions`, `EDIT-feedback`. GTK tests operate widgets and
observe the document/job outcomes, including save/reopen and invalid drafts.
