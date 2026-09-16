# Application migration candidates

These manifests use the current recipe interface. Copy each into its application
root; asset and source paths are relative to that directory. They are also
available as `sqgipkg.v2.json` beside the local application manifests used in this
review, so they can be exercised with `sqgipkg --manifest sqgipkg.v2.json`.

| Application | Previous lines | Candidate lines | Shell build commands in candidate |
| --- | ---: | ---: | ---: |
| RFDTool | 164 | 61 | 0 |
| FoamCutter | 231 | 117 | 0 |
| StlViewer | 153 | 69 | 0 |
| RouteTastic | 147 | 148 | 1 |

The script applications retain their original SQGI revision and explicitly
selected extra packages, icons and installer options. RFDTool and StlViewer use
the host-GI recipe instead of patch scripts. RouteTastic only opts into strict
schema validation: its application-specific runtime/provenance pipeline is
intentional, and remains intact.

All candidates pass configuration resolution with the current tool. Validate
all release architectures and application smoke tests before replacing an
existing release manifest. The gserial and StlViewer native recipes have been exercised as Linux to
Windows cross builds including host-GIR conversion. The gscenegraph recipe
also produced its Windows DLL and typelib. These component checks do not
establish full release-artifact equivalence.
