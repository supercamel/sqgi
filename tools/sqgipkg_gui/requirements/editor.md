# Editor and guidance

Parent: [product requirements](README.md). Derived contract: [editor](../contracts/editor.md).

| ID | Requirement |
| --- | --- |
| R-EDIT-01 | An empty launch presents Set up a project and Open a manifest. Setup guides project selection, application description, outputs, and a plain-language review/save. It starts with the simple CLI template; GTK/media/native templates are explicit, explained choices. Existing manifests open directly in the editor. |
| R-EDIT-02 | Application, Files, Targets, Runtime/native code, Appearance/installer, Review, and Manifest sections are directly navigable. |
| R-EDIT-03 | Common tasks use purpose-built controls with visible explanations. Advanced fields are collapsed within their task, including nested objects; configured values remain discoverable. Search matches friendly names, help, and schema keys. |
| R-EDIT-04 | Every schema property has a catalog entry and editable control or explicit alias/metadata classification. Every CLI option has a manifest control, invocation control, action, or documented alias. |
| R-EDIT-05 | Nested lists/objects, native recipes, file rules, arguments, and environment maps have structured editors. Raw JSON is an additional route, not the only route to advanced settings. |
| R-EDIT-06 | Optional settings distinguish authored values from omission. Show effective values through a current CLI plan where available; do not invent default or inheritance provenance. Removing an override explains that sqgipkg resolves the resulting value. Reset never flattens unrelated settings. |
| R-EDIT-07 | File selectors and previews show path meaning. Detected imports/features are suggestions with evidence, and generated files are distinguishable from missing input. |
| R-EDIT-08 | Diagnostics identify a relevant field/file/target and can navigate to it. Error indicators do not depend solely on color. |
| R-EDIT-09 | JSON preview/edit, change summary, undo/redo, and a reproducible CLI command are accessible from the editor. |
| R-EDIT-10 | Keyboard navigation, labels, resizing/high-DPI layout, and responsive large-list/log handling remain usable. |
| R-EDIT-11 | Naming the app, choosing its script/icon/output folder, selecting a supported package format, declaring known features, and adding/removing extra files or folders require no JSON type selection. File pickers occur only on path controls. Shared controls serve setup and later editing where those tasks overlap. |
| R-EDIT-12 | Common controls preserve existing alternate forms and aliases. Complex entrypoints, custom file rules, unknown features, and target overlays are visibly identified and remain editable without silently migrating or replacing their representation. |
| R-EDIT-13 | Setup and Targets allow multiple outputs: x86_64 AppImage, aarch64 AppImage, and Windows x86_64, with an installer/folder choice for Windows. New projects on Linux default to both AppImages and the Windows NSIS installer; Windows hosts default to their supported Windows installer and explain why Linux outputs need a Linux host. Any nonempty supported subset is selectable, including both AppImages without Windows. Setup review and resolved Review enumerate the selected outputs. Existing manifests retain their selection on open; automatic, unknown, or complex legacy selections are identified rather than silently replaced. Per-architecture build overrides remain preserved and use the advanced editor when the common controls cannot safely represent them. |
| R-EDIT-14 | Review separately reports Not checked, Checks passed, Checks passed with warnings, Needs attention, Plan resolved, and Changed since inspection. Explain success never implies Check success. Each result retains its action, draft and base directory. A failed or cancelled attempt cannot look like a newly successful inspection. |
| R-EDIT-15 | Setup ends with a readable launch/output/template summary and saves to Review with an explicit Check project next step. Semantic errors do not prevent draft saves. Review shows issues before technical details, distinguishes declarations from import evidence, and offers a packaging command only for a saved, unchanged valid document. Saving and inspection do not claim package execution success. |

Application templates reuse CLI templates. JIT/kernel toggles do not belong in
the setup assistant. Runtime source/revision and existing explicit legacy
overrides remain available in their appropriate section. R-EDIT-03/R-EDIT-11
also cover preparing a runtime for the selected outputs: Runtime/native code
offers existing binaries, a local source checkout, or a version/tag/commit
without JSON object/string dialogs. Explain that source builds produce a
runtime for each selected platform/CPU and need its toolchain/dependencies.
Review provides a direct route to this choice. Native executables explain
that they do not need a SQGI runtime.

Runtime choice changes preserve an explicit JIT override and unrelated
manifest data. Complex runtime declarations and legacy source aliases retain
their authored representation and a clearly labelled route to Advanced.

R-EDIT-05/R-EDIT-06 nested editors refresh their parent when a child closes.
Configured/default labels and list previews must reflect the current document;
a saved child value must not remain visibly labelled as an omitted default.

R-EDIT-01/R-EDIT-11 setup includes a native application (Vala, C or C++) choice,
separate from a Squirrel application using a native library. It asks for the
Meson/CMake build system and built executable name instead of a Squirrel script.
The same three default outputs apply. Users must not calculate target-specific
build directories to select the application entrypoint. Application editing
retains this simple native form while preserving custom executable paths and
legacy build hooks through Advanced. Native library dependencies remain separate
from the application's own build recipe.

R-EDIT-03/R-EDIT-11 native library setup is a common task. Users can add, edit
and remove a local Meson/CMake library using a name and source folder, with no
schema dialogs. Explain that it builds for every selected output and needs the
target's development dependencies. Optional GObject introspection asks for the
namespace, API version and Meson library target, with an example import. Explain
why cross builds generate metadata on the host and that this requires the same
API on both platforms. Do not imply that metadata conversion verifies that API.
Existing options, hooks, explicit outputs and custom data survive common edits;
unsupported recipe forms stay visibly available in Advanced. An application's
own recipe is identified separately and cannot be removed as a library. Adding
a dependency places it before that application recipe. Development dependency
installation and unusual multi-library metadata may still need Advanced.
GObject metadata guidance must also make sense for native Vala applications:
some libraries generate Vala bindings from introspection. Do not label this
choice as exclusively exposing a library to Squirrel or imply that selecting it
alone installs development files for downstream application builds.

R-EDIT-11 native-library setup offers an offline, read-only source example without
leaving the GUI. Show complete minimal source/build/import files, matching form
values, and the distinction between build dependencies and bundled runtime
libraries. Opening or closing help must not edit the manifest or create files.
Verify the displayed example by compiling it and exercising its GI API.
For new Squirrel projects, explain that the library recipe does not provide the
SQGI runtime and point to the visible runtime configuration step before building.

R-EDIT-11 validation recovery for a supported native-library recipe opens its
guided library form for fields that form can edit. A missing source folder must not force the user into schema
value editing. Unsupported/custom recipes retain the Advanced recovery route;
stale diagnostics cannot act on a changed draft.

Common help answers what a setting does, normal behavior, and why to change it.
Explicit GStreamer plugin settings explain additional Linux library files versus
element names, automatic plugin collection and target-architecture requirements.
String and list-item plugin paths offer a file picker, without implying that a
folder or an element name is a plugin binary. Custom platform recipes remain
available through Advanced.
Do not use a schema key plus “uses defaults” as the explanation for a common task.
For files, explain automatic literal imports, explicit script directories, and
assets; complete package contents may remain unknown until building. Native
recipe overrides, toolchains, caches, raw plans and CLI reference remain advanced.

R-EDIT-01/R-EDIT-07/R-EDIT-11 new Squirrel templates follow the entrypoint and
literal imports without scanning the whole project by default. Files offers
an opt-in list of folders for dynamically selected scripts, with add/remove
controls and an explanation of recursive inclusion. Warn that the project root
also includes unrelated examples/tests. Existing authored script directories
remain unchanged until edited, including an explicit dot or custom form.

Automated acceptance must exercise an ordinary script, explicit GTK selection,
assets, a Windows-format choice, a missing input, stale independent Check/Explain
results, and preservation of a complex manifest. These checks establish behavior,
not human comprehension; usability sessions and native Windows visual/keyboard
validation must be reported separately when performed.

The field-study handoff exposed a failure in R-EDIT-09/R-EDIT-15: activating
Copy packaging command must put the displayed command on the current display's
clipboard, with shell quoting and Unicode paths preserved. A success message
requires successful clipboard publication. Acceptance must read back the actual
clipboard, rather than checking only whether the button is enabled.

R-EDIT-03/R-EDIT-11 Runtime/native code offers a Windows package source and an
explicit prebuilt Windows SQGI choice, explaining that Linux keeps its runtime
selection. New GUI projects select Ooblerg; opened manifests preserve omission
and existing choices. A library's optional Windows package replaces its Windows
source build only. Explain this distinction next to the field, with validation
and undo. Complex or conflicting authored settings remain in Advanced.

R-EDIT-11 the Ooblerg picker searches package names, summaries and tags without
requiring prior package-name knowledge. Show version, description, dependencies
and Windows x86_64 scope before adding. Fetch catalog metadata only on an explicit
browse/refresh action; filtering remains local and responsive. Show loading,
empty results and recoverable network errors. Never install packages merely to
browse, and retain the draft if browsing fails.
Malformed catalog metadata is a recoverable browsing failure. Explain whether
the cached or downloaded catalog is unreadable, with an ordinary retry action;
do not expose a JSON parser error as the main explanation.

R-EDIT-15 Review keeps Save and Copy packaging command before potentially long
inspection diagnostics and resolved content. Each resolved output has a compact
format/architecture/destination summary; entry, resources, runtime, import
evidence and raw plan remain in collapsed per-output details. Target-specific
overrides must stay inspectable without flooding the ordinary review.

| ID | Requirement |
| --- | --- |
| R-EDIT-16 | Offer guided theme and translation selection in Appearance / languages, preserving unrelated settings and explaining runtime behavior. |

R-EDIT-16 Appearance exposes a GTK theme choice without opening Advanced: automatic,
Adwaita light, Adwaita dark, or an authored custom name. Explain application/theme
compatibility and retained platform overrides. A Languages action opens a folder
picker and named checkboxes for compiled gettext translations found there. Bundle
selected translations for Linux and Windows, show their destination, and explain
that the application must load its translations; this does not translate the app
or select an installer language. Preserve unrelated file rules and settings.
The navigation label explicitly names languages alongside appearance; the section
shows selected locale codes before opening the picker. Installer fields remain
available in the same section's Advanced controls.
Language discovery must behave consistently after folder edits and explicit Find
languages actions, including when the GUI is hosted by the study inspection bridge.
When existing resource folders already include the selected translation tree,
the language picker must explain that unchecked languages may still be bundled
by those rules. Preserve app-specific resource layouts rather than silently moving
or deleting translations the app already loads.

R-EDIT-11 native-library setup offers Local folder or Git repository. The Git path
asks for repository and full commit hash, explains that checkout/build happens
only during Build, and defaults to the packager-managed checkout directory.
Existing custom source aliases/branch/tag rules remain preserved in Advanced.
Users can save, reopen and edit common pinned recipes without JSON dialogs.
The library summary names the automatic Git checkout directory when no custom
directory is authored, so an intentional default does not appear as a blank path.

| ID | Requirement |
| --- | --- |
| R-EDIT-17 | Reuse an existing application's desktop metadata through a guided preview, preserving unrelated manifest settings. |

Offer Use an existing desktop file in Application. Read the base Application
entry without executing it. Preview editable name, desktop ID, description,
categories, terminal choice and icon file before Apply. Explain that executable
paths are generated by packaging, and localized entries/actions/custom keys are
not imported. Resolve a themed icon to an available image file with a visible
path, or require an explicit replacement if it cannot be found. Explain that an
external icon path depends on this machine and recommend a project-local asset.
Loading/cancelling is non-mutating; Apply is one undoable change and Save remains
explicit. Preserve other settings, including platform overrides. Packaging must
serialize the description as a desktop Comment without permitting line injection.
After editing or choosing a replacement icon, update the preview guidance so it
does not continue claiming that the old source icon must still be replaced.

R-EDIT-11 Linux prebuilt integration is optional alongside Local folder and pinned
Git library recipes. Runtime/native code exposes searchable Ooblerg packages for
Linux x86_64 and aarch64, naming the selected catalog's platform and CPU. Explain
Ubuntu's normal role and that published packages are already compiled. Browsing
and adding Linux packages must preserve Windows choices and source recipes.
Explicit Linux library replacements are editable/removable without losing source
settings, and unavailable packages on a selected CPU must not be presented as
universally available. No catalog request installs packages or starts a build.

Platform package controls should follow the selected outputs: do not show a full
Windows package form for a Linux-only project (or vice versa). Preserve inactive
platform settings and explain that Targets enables the other platform.
