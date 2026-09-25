# Editor and guidance

Parent: [product requirements](README.md). Derived contract: [editor](../contracts/editor.md).

| ID | Requirement |
| --- | --- |
| R-EDIT-01 | New project setup guides project selection, application description, outputs, and review/save. Existing manifests open directly in the editor. |
| R-EDIT-02 | Application, Files, Targets, Runtime/native code, Appearance/installer, Review, and Manifest sections are directly navigable. |
| R-EDIT-03 | Common fields use friendly controls; advanced fields are grouped with their task and expose configured values. Search matches friendly names and schema keys. |
| R-EDIT-04 | Every schema property has a catalog entry and editable control or explicit alias/metadata classification. Every CLI option has a manifest control, invocation control, action, or documented alias. |
| R-EDIT-05 | Nested lists/objects, native recipes, file rules, arguments, and environment maps have structured editors. Raw JSON is an additional route, not the only route to advanced settings. |
| R-EDIT-06 | Optional settings distinguish unset/default, explicit values, and inherited target settings. Reset removes an override without flattening other settings. |
| R-EDIT-07 | File selectors and previews show path meaning. Detected imports/features are suggestions with evidence, and generated files are distinguishable from missing input. |
| R-EDIT-08 | Diagnostics identify a relevant field/file/target and can navigate to it. Error indicators do not depend solely on color. |
| R-EDIT-09 | JSON preview/edit, change summary, undo/redo, and a reproducible CLI command are accessible from the editor. |
| R-EDIT-10 | Keyboard navigation, labels, resizing/high-DPI layout, and responsive large-list/log handling remain usable. |

Application templates reuse CLI templates. JIT/kernel toggles do not belong in
the setup assistant. Runtime source/revision and existing explicit legacy
overrides remain available in their appropriate section.
