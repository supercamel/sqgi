# Document integrity

Parent: [product requirements](README.md). Derived contract: [document](../contracts/document.md).

| ID | Requirement |
| --- | --- |
| R-DOC-01 | Opening and editing preserve unknown keys, aliases, nested values, array order, explicit false/null, and string/object/array variants. Resolved defaults and absolute paths never overwrite the authored document. |
| R-DOC-02 | An unchanged save leaves original bytes untouched. Changed documents use deterministic readable JSON. Only deliberate edits change semantics. |
| R-DOC-03 | Form and JSON edits share undo/redo. Invalid JSON stays editable and never replaces the last valid model or permits inspection from stale data. |
| R-DOC-04 | Saves replace files atomically and detect external changes. Failed/conflicting saves preserve the existing file and unsaved work. |
| R-DOC-05 | Save As retains the meaning of relative references. The user sees a relocation preview or an explicit choice before paths change. |
| R-DOC-06 | A semantically invalid but syntactically valid manifest may be saved as a draft. Validation errors remain visible without preventing authoring. |
| R-DOC-07 | Opening a manifest does not execute its hooks, fetch sources, download packages, or build anything. |
| R-DOC-08 | Inspection results retain the exact draft and base directory inspected; later edits are visibly out of date. A future build action must retain the saved manifest digest. |

JSON formatting may normalize after a deliberate edit. Semantic preservation is
mandatory. Migration from legacy fields is an explicit edit, never an open/save
side effect. A missing value and an explicit null are distinct.
