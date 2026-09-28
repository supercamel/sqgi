# C-EDIT: catalog and GTK editor

Requirements: R-EDIT-01 through R-EDIT-15; R-SCOPE-01 through R-SCOPE-04.

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
targets, and a readable review. Empty launch offers setup/open. The simple CLI
template is initially selected; other templates have human labels and explanations.
Host-supported outputs have friendly names and descriptions. Creation saves a
sparse v2 manifest and opens Review with Not checked and Check project visible.
Existing documents open directly. Common controls apply edits without JSON knowledge.
JIT/kernels are assumed; no first-use toggle disables them.

The shared CLI `native-application` template describes a native executable built
by a named Meson recipe in the project directory. Its setup choice is labelled
Native application (Vala / C / C++), explains the compiled entrypoint, and replaces
the Main script prompt with Executable name and a Meson/CMake choice. It authors
`entry.type=native`, `entry.project`, `entry.executable` and the matching native
recipe without adding Squirrel script directories or a SQGI runtime. Review
names the executable and all selected outputs. Application editing provides
equivalent controls for this representable form; changing those controls
preserves other native dependencies and custom fields. Complex native paths or
conflicting selectors remain in Advanced. Test a real saved native setup and
CLI plans for all three outputs; old native-path manifests retain their values.

**C-EDIT-03 Navigation:** seven task sections, a search entry, advanced groups,
and JSON/diff views are reachable by keyboard. Search includes labels/help and
keys, identifies the matching root, and makes that field or containing object
editable. Nested editors collapse unset advanced fields and retain configured
fields. Reset removes the authored property and explains that the CLI resolves omission.
Explicit false is not represented as unset.
Closing a nested field/item dialog redraws its still-open parent from the
current document, including configured/default labels and array previews.
Child edits and resets retain the existing immediate-apply/undo semantics.
`EDIT-structured-values` checks the parent's control after setting an omitted
child, without closing or reopening the parent.

**C-EDIT-04 Actions:** New/Open/Save/Save As/Undo/Redo/Check/Explain/Cancel
have defined enabled states. Invalid JSON disables form changes and inspection.
Unsaved inspection passes JSON to the CLI with an explicit base directory. Unsaved closing/opening prompts for Save,
Discard, or Cancel. Native file choosers use document-relative display paths.

**C-EDIT-05 Feedback:** diagnostics navigate to paths; discovered imports and
previews are visibly separate from authored choices. Target summary shows
effective data. Large logs are bounded; errors include text and preserve detail.
Labels associate with controls and layout expands at larger font/display scale.

**C-EDIT-06 Common tasks:** application name, simple script entry, icon, output
folder, target format, feature declarations and resource paths have purpose-built
controls with inline help. Shared text/path and target helpers serve setup and
editing. Applying a scalar is one document edit; assets support add/remove with
a picker or text path. No JSON type/null controls appear on these paths. Only
path controls have pickers. Unset and authored values remain distinguishable.
Reset removes only that field. Editing a legacy `script` does not introduce an
`entry`; complex/conflicting entry forms route to the full editor. Resource
string/array variants and unknown feature entries survive unrelated edits.
New Squirrel CLI/GUI templates omit `script_dirs`: entrypoint and literal imports
define the initial script set. Files provides a folder picker/text entry with
Add script folder and per-item Remove controls for dynamically chosen scripts.
Explain recursive inclusion and the root-dot risk of bundling examples/tests.
Accept existing string and string-array forms without rewriting them on open;
custom forms retain Advanced. Add/remove are individual undoable edits, reject
empty/duplicate additions, and never change resource/custom-file rules. Native
applications show this section only if script directories are already authored.
Acceptance checks actual import discovery with an unrelated native example,
explicit opt-in inclusion and preservation, plus GTK add/remove/undo behavior.
The shared output control presents independent x86_64 AppImage, aarch64 AppImage,
and Windows checkboxes, plus Windows installer/folder format. On a Linux host,
new-project defaults select all three with installer format. Windows hosts expose
Windows installer by default and explain the Linux-host requirement. Reject an
empty selection before changing the document or advancing setup. Setup summary
lists each output, and the saved manifest alone defines the selection.

The authoring adapter maps Windows-only to `win-nsis`/`win-dir`, one AppImage-only
to `appimage` plus `appimage_arch`, two AppImages-only to `appimage-all`, and Linux
plus Windows to `all`. Matrix targets write `platforms.linux.architectures` and
use `platforms.windows.format` for their Windows output. Preserve unrelated
platform settings, unknown data, and inactive settings. A no-change Apply does
not normalize aliases or rewrite an existing manifest. Apply is one undoable edit.
Existing automatic/unknown architectures or legacy per-architecture recipe lists
are shown as custom configuration with the full editor available; opening or
unrelated editing must not replace them with the new-project defaults.

Test all seven nonempty combinations of the two AppImages and Windows installer
against the real CLI, including exact target/architecture sets and distinct output
paths. Test Windows directory selection, default save/reopen, empty-selection
recovery, undo, and preserving complex existing configuration. The full
schema editor remains available through Advanced; opening it alone never mutates
the document. Common and advanced editors share the same document history.

Runtime preparation is a common task in Runtime/native code. An absent runtime
selects existing binaries; a sole `runtime.source` selects a local checkout;
a sole `runtime.sqgi` selects a version/tag/commit. The local choice has a folder
picker and explains manifest-relative paths; the revision choice has no picker.
Applying validates a nonempty selection and performs one undoable document edit.
No-change Apply leaves the document unchanged. Switching source/revision changes
only those selector keys and preserves an authored `runtime.jit`. Switching to
existing binaries removes a simple runtime recipe, but refuses to discard an
explicit override silently. Invalid/custom runtime objects, both source selectors,
and legacy `sqgi_source` declarations route to Advanced without mutation.
Native entrypoints show that a SQGI runtime is unnecessary. Review includes a
Configure runtime action; this is navigation, not inspection or a build.
Runtime help describes existing target binaries versus per-output source builds,
toolchain/dependency requirements, and retained overrides without adding JIT or
kernel toggles. `EDIT-runtime-choice` verifies preservation, rejection without
mutation, undo, actual GTK editing and real CLI resolution.

Native libraries are listed below runtime preparation with Add native library,
Edit and Remove actions. A scrolled modal form edits recipe name, local source
folder and Meson/CMake selection; an optional GObject section edits namespace,
version and the Meson target used for host GI. Examples distinguish a namespace
such as GSerial from its gserial-1.0 build target. Cross-GI help describes host
development prerequisites, the same-API assumption and remaining target tests.
No host GI option is accepted for CMake. Required fields and duplicate names
(including generated -gi-host names) show an inline error and keep the dialog
open. Cancel leaves the document unchanged; Apply is one undoable edit. Editing
an existing recipe changes only the form's fields, retaining omitted names on
no-change Apply, options, hooks, outputs and unknown data. Unknown GI selectors,
source aliases and non-array recipes are preserved with an Advanced route.
The application recipe has an Application link instead of Edit/Remove; new
libraries are inserted immediately before it. Removing a library never removes
the application recipe. `EDIT-native-library` tests real widgets, invalid-input
recovery, atomic undo, save/reopen and preservation of a recipe's extra fields.
Label the optional section "Prepare GObject introspection metadata". Help names
Squirrel imports and library-generated Vala bindings, while preserving the
existing host-build caveat and separate development-dependency guidance.

C-EDIT-06 Native module example opens a modal read-only guide from the library
form. Keep source text selectable and scrollable; closing returns to the unchanged
form. Include a minimal Vala GObject library, Meson GIR/typelib generation, a
Squirrel property/method/signal consumer, and explicit matching library fields.
Explain source creation versus packaging, development versus runtime dependencies,
and the Windows prebuilt alternative. `EDIT-native-library` exercises opening and
closing without a document edit; compile and run the exact displayed files as
separate source-example acceptance. This is not cross-target package acceptance.
The guide directs new script projects to Runtime/native code to choose an existing
target runtime or a SQGI source build; mention the independent Windows prebuilt
runtime choice. Do not imply Add library supplies the script interpreter.

C-EDIT-06/C-EDIT-07 Fix setting routes `native[index]` diagnostics to Edit library
only for fields owned by that form, when the indexed recipe is supported by the common library reader and is
not the application recipe. Preserve existing advanced editing for custom recipes,
platform overrides and unrelated paths. Opening recovery does not mutate the draft;
Apply uses the normal atomic library edit and invalidates earlier inspections.
Exercise the recovery route in GTK acceptance and a real missing-folder walkthrough.

**C-EDIT-07 Review states:** keep independent `check` and `explain` records with
action, exact text, base directory, result or failure. A record is current only
when its text and base directory match the valid document. Check success is
labelled with warning counts; Explain success is only Plan resolved. New attempts
replace that action's old record with a pending state; failure/cancellation is
visible and cannot expose its previous success as current. Edits retain records
for stale feedback, including invalid JSON edits. Information diagnostics are
collapsed; errors/warnings and field actions lead. Resolved plans show launch,
target/architecture/output and runtime summary; raw plans, import evidence,
editor runtime and CLI options are expandable. Declared features are labelled as
declared and `used_*` flags do not create detection claims. Copy command is enabled
only for valid, saved, unchanged documents, with a final saved-revision check.
Publication uses an introspectable GDK content provider on the window's own
clipboard; non-introspectable convenience methods cannot be assumed available
to SQGI. Publish UTF-8 text matching the displayed command and report a rejected
publication as an error. `EDIT-review-states` must activate Copy and read the
clipboard back through GDK, including the test's Unicode/space-containing path.
Checking or saving does not imply a successful build. Drafts remain saveable.

Acceptance IDs: `EDIT-native-application`, `EDIT-coverage`, `EDIT-structured-values`, `EDIT-guidance`,
`EDIT-navigation`, `EDIT-actions`, `EDIT-feedback`, `EDIT-common-tasks`,
`EDIT-review-states`, `EDIT-architecture`, `EDIT-output-matrix`, `EDIT-runtime-choice`. GTK tests operate widgets and
observe the document/job outcomes, including save/reopen and invalid drafts.

C-EDIT-03 plugin-path recovery: the gstreamer_plugins scalar and its string list
items expose Choose file, not Choose folder. Help names an example .so filename,
distinguishes element names and additional-file semantics, and explains that
automatic feature-based collection remains active. Choosing a file fills the
field; Apply remains the document mutation. Retain arbitrary non-path options
without file pickers. Exercise the rendered scalar/list controls in EDIT-guidance.

Revision rationale: field reachability did not establish an understandable common
workflow. Requirements v3 makes that workflow independently testable. Search to
a containing object remains an explicit limitation, not deep-field focus.

C-EDIT-06 Windows provider controls author `windows.package_source` and
`windows.runtime` through ordinary document edits. Omitted provider remains
MSYS2 when an existing manifest is opened; only new project creation sets
Ooblerg. The prebuilt runtime choice is hidden for native entries. Changing
provider must not silently delete packages, recipe selections or overrides;
Check reports incompatible combinations. Library forms preserve and edit
`windows_package`, with a description of the Windows-only source replacement.
Exercise actual controls, save/reopen and undo in the private GTK session and
inspect screenshots at the ordinary window size. Acceptance:
`EDIT-windows-provider`, `PKG-ooblerg-provider`.

The common Windows dependency section provides Search Ooblerg packages, opening
a modal catalog fetched asynchronously through `sqgipkg packages --json`.
The same picker can fill `native[].windows_package` in the library form.
Filtering is case-insensitive over name, summary, description and tags, with
selectable results and a details panel. Add prevents duplicates; Cancel changes
nothing. Explicit Refresh updates metadata only. Closing cancels the outstanding
job. Search/browse is distinct from local Check/Explain. Save/reopen preserves
selected names; tests cover search, no matches, selection/add, cancellation,
errors and retry. Acceptance: `EDIT-package-search`.

Exercise failure/retry and closing during an outstanding request through the real
GUI subprocess boundary with a deterministic test catalog response. A late
response must not reopen a closed picker, alter the draft or overwrite a newer
picker's state. Keep these transport-fixture checks distinct from real repository
and cached-catalog acceptance.
Validate search metadata before delivering it to GTK: package names/versions are
strings, dependencies/tags are string arrays, and descriptions/summaries are
strings when present. Omitted optional arrays become empty arrays. A malformed
cache reports that the cached catalog cannot be read and that Refresh can replace
it; the draft stays intact throughout error and recovery.

C-EDIT-07 review layout places the saved-command handoff immediately after the
inspection controls and before diagnostics. Resolved configurations show one
compact output summary each, followed by an initially collapsed details expander.
Move existing launch/runtime/resources/import suggestions and complete plan into
that expander without dropping target-specific data. `EDIT-review-states` checks
the real three-output widgets, collapsed defaults and handoff ordering; inspect
a private-display screenshot of the resulting review.

**C-EDIT-08 Appearance and languages.** Theme controls author only gtk_theme (automatic removes that key).
Opening controls never changes the document. Existing custom names remain visible;
Windows/platform overrides remain intact and are called out. Language selection
recognizes immediate locale/LC_MESSAGES/*.mo catalogs, retaining locale codes in
labels. Apply writes paired file rules: root files to usr/share/locale and
windows.files to share/locale, with matching locale/LC_MESSAGES/*.mo includes.
Only exact simple rules produced by this control may be replaced. Other rules
remain intact; unsupported list/container representations must fail without any
partial mutation. Empty selection removes the recognized pair. All changes use
one Document.set for undo. Headless GTK acceptance checks selection, preservation,
reopening and screenshots; backend rule expansion checks the actual staged paths.
Keep the stable internal Appearance/installer section ID, but display
Appearance / languages in navigation and the page heading. Summarize recognized
language rules in the page. Acceptance: EDIT-appearance-languages.
C-EDIT-08 helper functions must be module-local: shared Squirrel root-table symbols
from host scripts must not replace discovery, selection or mutation helpers.
Exercise explicit Find languages with a host-defined scan function, rather than
only the initial automatic scan.
C-EDIT-08 compare canonical resource paths against the chosen locale root before
Apply. Display overlapping resource paths and explain that this selection only
controls the added gettext copies; Files manages existing resources. Keep the
notice visible with the language checkboxes. Test parent, exact and child resource
paths and unrelated paths.

C-EDIT-06 common native libraries recognize canonical repo/ref recipes as well as
local dir recipes. Git authoring requires a nonempty repository and full40- or
64-digit hexadecimal commit; use repo/ref, omit empty dir to keep the backend's
.sqgipkg/native/<name> default. Preserve authored checkout dirs, custom build
options/hooks and all unrelated recipes. Source mode changes remove only repo/ref
or dir as required by the explicit form; aliases git/branch/tag/commit stay on the
Advanced route. Opening/cancelling never fetches or mutates sources. Acceptance
covers save/reopen, mode switching, no-change preservation and invalid commits,
plus a visible private GUI walkthrough with a local Git fixture.
C-EDIT-06 displays .sqgipkg/native/<name> as an automatic checkout in the common
library summary for Git recipes without dir. Authored directories display
unchanged; rendering this default never adds dir to the manifest. GTK acceptance
checks the displayed default alongside saved/reopened omission of dir.
C-EDIT-06/C-EDIT-08 GTK notify::selected callbacks accept the signal's property
argument. Assert Git/custom-theme inputs become mapped after changing their source
selector; direct writes to hidden widgets do not establish GUI usability.

**C-EDIT-09 Desktop metadata reuse.** The Application action opens a modal preview.
GLib KeyFile reads only the base Desktop Entry group of a Type=Application file.
The filename without .desktop supplies the proposed ID. Map Name, Comment,
Categories, Terminal and a resolved Icon to name, desktop_comment,
desktop_categories, desktop_terminal and desktop_icon. Require a valid nonempty
name/ID and an existing supported icon image if the input declares an icon;
provide a replacement file picker for unresolved themed icons. Show all proposed
values before replacing corresponding root fields; preserve all unrelated keys
and platform overrides. No shell commands or Exec/Actions are imported. No files
are copied by the editor; packaging copies the selected icon. The dialog explains
base-only import and external-path portability. Cancel/loading do not mutate;
Apply validates all fields before one Document.set. Backend desktop serialization
escapes string values with KeyFile, including Comment. Acceptance
EDIT-desktop-metadata covers malformed/non-Application input, unresolved icons,
atomic preservation/undo, rendered preview/apply and generated desktop values.
Editing the icon path replaces stale source-icon warnings with review/apply
validation guidance. Validate the actual edited file again on Apply.

C-EDIT-06 Linux package browsing supplies an explicit CLI package target and shows
that target in the title/details. Ubuntu and optional Ooblerg lists stay separate.
Adding a prebuilt package mutates only Linux package declarations; editing a
library's optional Linux replacement mutates only that override while retaining
its local/Git settings and independent Windows replacement. Cancel and search
must not mutate manifests. Changing catalog/CPU clears an old selected result;
errors preserve user state and offer retry. Save/reopen retains choices.

C-EDIT-06 package panels use the representable output selection to show the
active platforms. Inactive platforms show a short Targets hint without mutating
saved settings. Custom/automatic output configurations retain both panels.
