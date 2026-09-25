# Delivery and quality

Parent: [product requirements](README.md). Derived contract: [delivery](../contracts/delivery.md).

| ID | Requirement |
| --- | --- |
| R-DEL-01 | A source-tree launcher and installed sqgipkg-gui launcher work independently of the caller's working directory. |
| R-DEL-02 | CMake installs GUI modules/assets and a Linux desktop entry or native Windows GUI launcher. CLI-only use has no GTK requirement. |
| R-DEL-03 | The tool has its own sqgipkg manifest and can package itself with its backend, schema, templates, dependencies (deferred self-packaging). |
| R-DEL-04 | Contract tests cover document preservation, schema/CLI coverage, backend equivalence, inspection failure/cancellation, and actual GTK workflows. |
| R-DEL-05 | Test fixtures include bundled templates, existing application examples, spaces/Unicode paths, missing dependencies, stale defaults, and cancelled inspection. |
| R-DEL-06 | Runtime evidence names JIT/kernel configuration and platform. Native Windows CI runs the portable document/protocol tests; Windows GUI execution is reported separately. |
| R-DEL-07 | The requirement-to-contract-to-module-to-test map is checked for missing references. Verification records distinguish passed, failed, and not-executed checks. |

Automated GUI smoke tests run on a virtual display on Linux. Native Windows
validation is a separate acceptance obligation, not inferred from Linux tests.
