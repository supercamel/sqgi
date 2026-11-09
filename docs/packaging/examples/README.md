# Application manifest examples

These complete manifests show how SQGI applications combine native modules,
resources and platform settings. Their paths, icons, source revisions and
package choices belong to the named applications; adapt them to your project.

| Example | Features to look at |
| --- | --- |
| [RFDTool](RFDTool.sqgipkg.json) | GTK and a native GSerial module with host GI metadata |
| [FoamCutter](FoamCutter.sqgipkg.json) | Native libraries, resources and platform-specific settings |
| [StlViewer](StlViewer.sqgipkg.json) | A GTK application with a native module and Windows installer options |
| [RouteTastic](RouteTastic.sqgipkg.json) | Explicit runtime selection and custom build commands |

Copy a manifest to your application's root as `sqgipkg.json`, update its paths
and dependencies, then inspect it before building:

```sh
sqgipkg check
sqgipkg explain
sqgipkg build --write-lock
```

For a smaller starting point, use `sqgipkg init` or follow
[Package one script](../01-package-one-script.md). Check your app on each
selected target before distributing its packages.
