# C-DEL: delivery and acceptance evidence

Requirements: R-DEL-01 through R-DEL-07; R-SCOPE-01, R-SCOPE-05, R-SCOPE-06.

**C-DEL-01 Launch/install:** `tools/sqgipkg-gui` works with a selected SQGI runtime
from any working directory. CMake installs the launcher, modules, schema and
CLI templates, icon and desktop integration. A GUI install option defaults
ON; CLI remains usable without GTK installed. Windows uses a native GUI launcher.

**C-DEL-02 Self-package (deferred):** a checked-in manifest packages the GUI and runtime
dependencies, shared sqgipkg backend/data, and runner. Packaged resource lookup
uses application resource paths, never a developer checkout path.

**C-DEL-03 Traceability:** a machine-readable map covers each requirement ID,
contract clause, implementation module and acceptance test ID. Tests verify
references exist; semantic contract tests establish behavior independently.
Changing schema/CLI options fails coverage checks until classified.

**C-DEL-04 Evidence:** CTest runs document/protocol and virtual-display GTK
tests. Native Windows CI runs supported Windows tests. Verification records
exact commands/results and build configuration. Native Windows execution is
never claimed from cross-compilation or mocks. Existing packaging tests remain the packaging engine acceptance suite.

Current acceptance IDs: `DEL-launch`, `DEL-install`,
`DEL-traceability`, `DEL-platform-evidence`.

Deferred acceptance ID: `DEL-self-package`.
