# GTK Theme Packaging Test

This project exercises `sqgipkg`'s GTK theme selection and staging support.

The manifest sets:

- `gtk_theme` to `SQGI-Violet-Dark`
- `gtk_icon_theme` to `Adwaita`
- `gtk_prefer_dark` to `true`
- a manual theme payload under `themes/SQGI-Violet-Dark`

For Linux AppImages, `sqgipkg` stages the theme under
`usr/share/themes/SQGI-Violet-Dark`, writes GTK 3 and GTK 4 `settings.ini`
files, and exports `GTK_THEME` from `AppRun`. For Windows packages, it stages
the same theme under `share/themes/SQGI-Violet-Dark`, writes the Windows GTK
settings files, and exports `GTK_THEME` from the generated `.bat` launcher.

Run the demo directly from this directory:

```sh
../../../build/sqgi main.nut --auto
```

Build and smoke-test the Linux AppImage:

```sh
sqgipkg --smoke-test "--auto"
```

From an uninstalled checkout, run from the repository root:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/gtk_themes/sqgipkg.json \
  --smoke-test "--auto"
```

Build both the Linux AppImage and Windows NSIS output:

```sh
sqgipkg --target all --smoke-test "--auto"
```

With the default AppImage target, outputs are written under `dist/`. With
`--target all`, Linux outputs are written under `dist-linux/` and Windows
outputs are written under `dist-windows/`.
