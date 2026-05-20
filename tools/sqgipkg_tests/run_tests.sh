#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: run_tests.sh /path/to/sqgi" >&2
  exit 2
fi

SQGI_BIN="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SQGIPKG="${ROOT_DIR}/tools/sqgipkg"
BUILD_DIR="$(cd "$(dirname "${SQGI_BIN}")" && pwd)"
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/sqgipkg-tests.XXXXXX")"

trap 'rm -rf "${WORK_DIR}"' EXIT

export LD_LIBRARY_PATH="${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

run_sqgipkg() {
  "${SQGI_BIN}" "${SQGIPKG}" "$@"
}

run_appimage() {
  APPIMAGE_EXTRACT_AND_RUN=1 "$@"
}

assert_file() {
  [[ -f "$1" ]] || fail "expected file: $1"
}

assert_not_file() {
  [[ ! -f "$1" ]] || fail "did not expect file: $1"
}

assert_executable() {
  [[ -x "$1" ]] || fail "expected executable: $1"
}

assert_contains() {
  local file="$1"
  local needle="$2"
  if ! grep -Fq -- "$needle" "$file"; then
    echo "--- ${file} ---" >&2
    sed -n '1,160p' "$file" >&2 || true
    fail "expected '$needle' in $file"
  fi
}

appimagetool_arch() {
  case "$(uname -m)" in
    amd64) echo "x86_64" ;;
    arm64) echo "aarch64" ;;
    *) uname -m ;;
  esac
}

APPIMAGETOOL_CACHE="${WORK_DIR}/tool-cache"
APPIMAGETOOL="${APPIMAGETOOL_CACHE}/appimagetool-$(appimagetool_arch).AppImage"

MAIN_SCRIPT="${WORK_DIR}/main.nut"
cat >"${MAIN_SCRIPT}" <<'EOF'
local helper = import("helper.nut")

if (vargv.len() != 2) {
    print("expected 2 args, got " + vargv.len() + "\n")
    return 10
}
if (vargv[0] != "alpha" || vargv[1] != "beta") {
    print("unexpected args\n")
    return 11
}
print(helper.message() + "\n")
EOF

cat >"${WORK_DIR}/helper.nut" <<'EOF'
function message() {
    return "sqgipkg packaged app ran"
}

return {
    message = message
}
EOF

mkdir -p "${WORK_DIR}/resources/sub"
printf 'asset\n' >"${WORK_DIR}/asset.txt"
printf 'manual file\n' >"${WORK_DIR}/manual-file.txt"
printf 'nested\n' >"${WORK_DIR}/resources/sub/nested.txt"
printf 'stat target\n' >"${WORK_DIR}/stat-target.txt"

HELP_OUT="${WORK_DIR}/help.out"
run_sqgipkg --help >"${HELP_OUT}"
assert_contains "${HELP_OUT}" "sqgipkg SCRIPT --name NAME --target appimage"
assert_contains "${HELP_OUT}" "sqgipkg --manifest sqgipkg.json"
assert_contains "${HELP_OUT}" "sqgipkg SCRIPT --name NAME --target all"
assert_contains "${HELP_OUT}" "--resource PATH"
assert_contains "${HELP_OUT}" "--refresh-appimagetool"
assert_contains "${HELP_OUT}" "--script-dir DIR"
assert_contains "${HELP_OUT}" "--no-compile-scripts"
assert_contains "${HELP_OUT}" "--file SPEC"
assert_contains "${HELP_OUT}" "--library PATH"
assert_contains "${HELP_OUT}" "--doctor"
assert_contains "${HELP_OUT}" "--smoke-test ARGS"
assert_contains "${HELP_OUT}" "--init TEMPLATE"
pass "custom help output"

INIT_DIR="${WORK_DIR}/init"
mkdir -p "${INIT_DIR}"
(cd "${INIT_DIR}" && run_sqgipkg --init gtk4 >"${WORK_DIR}/init.out")
assert_file "${INIT_DIR}/sqgipkg.json"
assert_contains "${INIT_DIR}/sqgipkg.json" "\"script_dirs\""
assert_contains "${INIT_DIR}/sqgipkg.json" "\"gdk_backend\""
assert_contains "${WORK_DIR}/init.out" "wrote sqgipkg.json"
pass "manifest init template"

NATIVE_INIT_DIR="${WORK_DIR}/init-native"
mkdir -p "${NATIVE_INIT_DIR}"
(cd "${NATIVE_INIT_DIR}" && run_sqgipkg --init native-gobject >"${WORK_DIR}/init-native.out")
assert_file "${NATIVE_INIT_DIR}/sqgipkg.json"
assert_contains "${NATIVE_INIT_DIR}/sqgipkg.json" "\"native_projects\""
assert_contains "${NATIVE_INIT_DIR}/sqgipkg.json" "\"libraries\""
assert_contains "${NATIVE_INIT_DIR}/sqgipkg.json" "\"typelibs\""
pass "native manifest init template"

if run_sqgipkg "${MAIN_SCRIPT}" --name Squrl --target appdir >"${WORK_DIR}/appdir.out" 2>&1; then
  fail "appdir placeholder unexpectedly succeeded"
fi
assert_contains "${WORK_DIR}/appdir.out" "--target appdir is reserved but not implemented yet"
pass "appdir placeholder"

if run_sqgipkg "${MAIN_SCRIPT}" --name Squrl --target tarball >"${WORK_DIR}/tarball.out" 2>&1; then
  fail "tarball placeholder unexpectedly succeeded"
fi
assert_contains "${WORK_DIR}/tarball.out" "--target tarball is reserved but not implemented yet"
pass "tarball placeholder"

OUT_DIR="${WORK_DIR}/out"
run_sqgipkg "${MAIN_SCRIPT}" \
  --name Squrl \
  --target appimage \
  --output "${OUT_DIR}" \
  --appimagetool-cache "${APPIMAGETOOL_CACHE}" \
  --refresh-appimagetool \
  --keep-appdir \
  --smoke-test-isolated \
  --smoke-test "alpha beta" \
  --script-dir "${WORK_DIR}" \
  --file "${WORK_DIR}/manual-file.txt=usr/share/sqgi/app/manual/file.txt" \
  --resource "${WORK_DIR}/resources" \
  --include "${WORK_DIR}/asset.txt=usr/share/sqgi/app/assets/asset.txt" \
  --gstreamer-plugin "${WORK_DIR}/asset.txt" \
  --typelib "${WORK_DIR}/asset.txt" \
  --gsettings-schema "${WORK_DIR}/asset.txt" \
  --gtk-data "${WORK_DIR}/resources" \
  --gio-module "${WORK_DIR}/asset.txt" \
  --gdk-pixbuf-loader "${WORK_DIR}/asset.txt" \
  >"${WORK_DIR}/package.out"

APPDIR="${OUT_DIR}/Squrl.AppDir"
APPIMAGE="${OUT_DIR}/Squrl.AppImage"

assert_executable "${APPIMAGETOOL}"
assert_executable "${APPDIR}/AppRun"
assert_executable "${APPIMAGE}"
assert_file "${APPDIR}/usr/share/sqgi/app/main.nut"
assert_file "${APPDIR}/usr/share/sqgi/app/main.cnut"
assert_file "${APPDIR}/usr/share/sqgi/app/helper.nut"
assert_file "${APPDIR}/usr/share/sqgi/app/helper.cnut"
assert_file "${APPDIR}/usr/share/sqgi/app/manual/file.txt"
assert_file "${APPDIR}/usr/share/sqgi/app/assets/asset.txt"
assert_file "${APPDIR}/usr/share/sqgi/app/resources/resources/sub/nested.txt"
assert_file "${APPDIR}/usr/lib/gstreamer-1.0/asset.txt"
assert_file "${APPDIR}/usr/lib/girepository-1.0/asset.txt"
assert_file "${APPDIR}/usr/share/glib-2.0/schemas/asset.txt"
assert_file "${APPDIR}/usr/share/resources/sub/nested.txt"
assert_file "${APPDIR}/usr/lib/gio/modules/asset.txt"
assert_file "${APPDIR}/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/asset.txt"
assert_contains "${APPDIR}/AppRun" "GST_PLUGIN_PATH"
assert_contains "${APPDIR}/AppRun" "GI_TYPELIB_PATH"
assert_contains "${APPDIR}/AppRun" "GSETTINGS_SCHEMA_DIR"
assert_contains "${APPDIR}/AppRun" "GDK_PIXBUF_MODULE_FILE"
assert_contains "${WORK_DIR}/package.out" "sqgipkg report"
assert_contains "${WORK_DIR}/package.out" "scripts:"
assert_contains "${WORK_DIR}/package.out" "manual files:"
assert_contains "${WORK_DIR}/package.out" "smoke test passed"
pass "real appimage build with extra payloads"

THEME_PROJECT="${WORK_DIR}/theme-project"
mkdir -p "${THEME_PROJECT}/themes/TestTheme/gtk-4.0"
cat >"${THEME_PROJECT}/main.nut" <<'EOF'
print("theme project\n")
EOF
cat >"${THEME_PROJECT}/themes/TestTheme/index.theme" <<'EOF'
[Theme]
Name=TestTheme
EOF
cat >"${THEME_PROJECT}/sqgipkg.json" <<'EOF'
{
  "name": "ThemeProject",
  "gtk_theme": "TestTheme",
  "gtk_icon_theme": "Adwaita",
  "gtk_font_name": "Cantarell 11",
  "gtk_prefer_dark": true,
  "gdk_backend": "x11",
  "files": [
    {
      "path": "themes/TestTheme",
      "dest": "usr/share/themes/TestTheme"
    }
  ]
}
EOF
THEME_OUT="${WORK_DIR}/theme-out"
(
  cd "${THEME_PROJECT}"
  run_sqgipkg \
    --output "${THEME_OUT}" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    >"${WORK_DIR}/theme-package.out"
)
THEME_APPDIR="${THEME_OUT}/ThemeProject.AppDir"
assert_file "${THEME_APPDIR}/usr/share/themes/TestTheme/index.theme"
assert_file "${THEME_APPDIR}/usr/etc/gtk-4.0/settings.ini"
assert_file "${THEME_APPDIR}/usr/etc/gtk-3.0/settings.ini"
assert_contains "${THEME_APPDIR}/usr/etc/gtk-4.0/settings.ini" "gtk-theme-name=TestTheme"
assert_contains "${THEME_APPDIR}/usr/etc/gtk-4.0/settings.ini" "gtk-icon-theme-name=Adwaita"
assert_contains "${THEME_APPDIR}/usr/etc/gtk-4.0/settings.ini" "gtk-font-name=Cantarell 11"
assert_contains "${THEME_APPDIR}/usr/etc/gtk-4.0/settings.ini" "gtk-application-prefer-dark-theme=true"
assert_contains "${THEME_APPDIR}/AppRun" "XDG_CONFIG_DIRS"
assert_contains "${THEME_APPDIR}/AppRun" "GTK_THEME='TestTheme'"
assert_contains "${THEME_APPDIR}/AppRun" "GDK_BACKEND='x11'"
pass "AppImage GTK theme selection"

run_appimage "${APPIMAGE}" alpha beta >"${WORK_DIR}/appimage.out"
assert_contains "${WORK_DIR}/appimage.out" "sqgipkg packaged app ran"
pass "real custom AppImage execution"

DEFAULT_PROJECT="${WORK_DIR}/default-project"
mkdir -p "${DEFAULT_PROJECT}"
cat >"${DEFAULT_PROJECT}/main.nut" <<'EOF'
print("default project packaged\n")
EOF
(
  cd "${DEFAULT_PROJECT}"
  PATH="${BUILD_DIR}:${PATH}" run_sqgipkg \
    --appimagetool "${APPIMAGETOOL}" \
    >"${WORK_DIR}/default-project-package.out"
)
assert_file "${DEFAULT_PROJECT}/dist/default-project.AppImage"
run_appimage "${DEFAULT_PROJECT}/dist/default-project.AppImage" >"${WORK_DIR}/default-project-run.out"
assert_contains "${WORK_DIR}/default-project-run.out" "default project packaged"
pass "default project packaging"

PATH="${BUILD_DIR}:${PATH}" LD_LIBRARY_PATH="${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
  "${SQGIPKG}" "${ROOT_DIR}/demo/glib/paths_env.nut" \
    --name DemoPathsDirect \
    --target appimage \
    --output "${WORK_DIR}/direct" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    >"${WORK_DIR}/direct.out"
assert_executable "${WORK_DIR}/direct/DemoPathsDirect.AppImage"
pass "direct shebang execution with real appimagetool"

DEMO_PATHS_OUT="${WORK_DIR}/demo-paths"
run_sqgipkg "${ROOT_DIR}/demo/glib/paths_env.nut" \
  --name DemoPaths \
  --target appimage \
  --output "${DEMO_PATHS_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/demo-paths-package.out"

run_appimage "${DEMO_PATHS_OUT}/DemoPaths.AppImage" >"${WORK_DIR}/demo-paths-run.out"
assert_contains "${WORK_DIR}/demo-paths-run.out" "== well-known directories =="
assert_contains "${WORK_DIR}/demo-paths-run.out" "== PATH lookup =="
pass "real AppImage for demo/glib/paths_env.nut"

DEMO_STAT_OUT="${WORK_DIR}/demo-stat"
run_sqgipkg "${ROOT_DIR}/demo/gio/stat.nut" \
  --name DemoStat \
  --target appimage \
  --output "${DEMO_STAT_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/demo-stat-package.out"

run_appimage "${DEMO_STAT_OUT}/DemoStat.AppImage" "${WORK_DIR}/stat-target.txt" >"${WORK_DIR}/demo-stat-run.out"
assert_contains "${WORK_DIR}/demo-stat-run.out" "path: ${WORK_DIR}/stat-target.txt"
assert_contains "${WORK_DIR}/demo-stat-run.out" "standard::name"
pass "real AppImage for demo/gio/stat.nut"

MANIFEST_APP_DIR="${WORK_DIR}/manifest-app"
mkdir -p "${MANIFEST_APP_DIR}/data"
cat >"${MANIFEST_APP_DIR}/main.nut" <<'EOF'
local GLib = import("GLib")
local Gio = import("Gio")
local manual = GLib.build_filenamev([GLib.getenv("SQGI_APP_SHARE"), "manual", "payload.txt"])
local data = Gio.File.new_for_path(manual).load_contents(null)
local text = (typeof(data) == "array") ? data[0] : data
print("manual payload: " + text)
EOF
printf 'manifest file works\n' >"${MANIFEST_APP_DIR}/data/payload.txt"
cat >"${MANIFEST_APP_DIR}/sqgipkg.json" <<'EOF'
{
  "script": "main.nut",
  "name": "ManifestFiles",
  "target": "appimage",
  "files": [
    {
      "path": "data/payload.txt",
      "dest": "usr/share/sqgi/app/manual/payload.txt"
    }
  ]
}
EOF

run_sqgipkg \
  --manifest "${MANIFEST_APP_DIR}/sqgipkg.json" \
  --doctor \
  >"${WORK_DIR}/manifest-files-doctor.out"
assert_contains "${WORK_DIR}/manifest-files-doctor.out" "Doctor: OK"
assert_contains "${WORK_DIR}/manifest-files-doctor.out" "OK: compiles entry script"
pass "manifest doctor"

MANIFEST_FILES_OUT="${WORK_DIR}/manifest-files"
run_sqgipkg \
  --manifest "${MANIFEST_APP_DIR}/sqgipkg.json" \
  --output "${MANIFEST_FILES_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/manifest-files-package.out"

assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/main.cnut"
assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/manual/payload.txt"
run_appimage "${MANIFEST_FILES_OUT}/ManifestFiles.AppImage" >"${WORK_DIR}/manifest-files-run.out"
assert_contains "${WORK_DIR}/manifest-files-run.out" "manual payload: manifest file works"
pass "manifest files payload"

NATIVE_ENTRY_PROJECT="${WORK_DIR}/native-entry-project"
mkdir -p "${NATIVE_ENTRY_PROJECT}/build-native"
cat >"${NATIVE_ENTRY_PROJECT}/build-native/native-entry" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
test -f "${SQGI_APP_SHARE}/helper.cnut"
echo "native entry ran with ${1:-none}"
EOF
chmod +x "${NATIVE_ENTRY_PROJECT}/build-native/native-entry"
cat >"${NATIVE_ENTRY_PROJECT}/helper.nut" <<'EOF'
return {
    message = "compiled nut payload"
}
EOF
cat >"${NATIVE_ENTRY_PROJECT}/sqgipkg.json" <<'EOF'
{
  "name": "NativeEntry",
  "entry": {
    "type": "native",
    "linux": "build-native/native-entry"
  },
  "script_dirs": [
    "."
  ]
}
EOF

NATIVE_ENTRY_OUT="${WORK_DIR}/native-entry"
(
  cd "${NATIVE_ENTRY_PROJECT}"
  run_sqgipkg \
    --output "${NATIVE_ENTRY_OUT}" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    >"${WORK_DIR}/native-entry-package.out"
)
assert_file "${NATIVE_ENTRY_OUT}/NativeEntry.AppDir/usr/bin/native-entry"
assert_not_file "${NATIVE_ENTRY_OUT}/NativeEntry.AppDir/usr/bin/sqgi"
assert_file "${NATIVE_ENTRY_OUT}/NativeEntry.AppDir/usr/share/sqgi/app/helper.cnut"
assert_contains "${NATIVE_ENTRY_OUT}/NativeEntry.AppDir/AppRun" 'exec "${HERE}/usr/bin/native-entry" "$@"'
run_appimage "${NATIVE_ENTRY_OUT}/NativeEntry.AppImage" alpha >"${WORK_DIR}/native-entry-run.out"
assert_contains "${WORK_DIR}/native-entry-run.out" "native entry ran with alpha"
pass "native AppImage entry with compiled nut payload"

if command -v meson >/dev/null 2>&1 &&
   command -v cc >/dev/null 2>&1; then
  NATIVE_ENTRY_PROJECT_OUT="${WORK_DIR}/native-entry-project"
  run_sqgipkg \
    --manifest "${ROOT_DIR}/tools/sqgipkg_tests/native_entry_project/sqgipkg.json" \
    --output "${NATIVE_ENTRY_PROJECT_OUT}" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    --smoke-test "project-arg" \
    >"${WORK_DIR}/native-entry-project-package.out"

  assert_file "${NATIVE_ENTRY_PROJECT_OUT}/NativeEntryProject.AppDir/usr/bin/sq-native-entry"
  assert_not_file "${NATIVE_ENTRY_PROJECT_OUT}/NativeEntryProject.AppDir/usr/bin/sqgi"
  assert_file "${NATIVE_ENTRY_PROJECT_OUT}/NativeEntryProject.AppDir/usr/share/sqgi/app/payload.cnut"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "native entry project ran"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "arg: project-arg"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "payload:"
  pass "native entry test project AppImage"
else
  echo "SKIP: native entry test project AppImage (missing meson/cc toolchain)"
fi

WIN_PROJECT="${WORK_DIR}/win-project"
WIN_BUILD="${WIN_PROJECT}/win-build"
WIN_MSYS2="${WIN_PROJECT}/msys64"
mkdir -p "${WIN_PROJECT}" "${WIN_BUILD}" \
  "${WIN_MSYS2}/mingw64/bin" \
  "${WIN_MSYS2}/mingw64/lib/girepository-1.0" \
  "${WIN_MSYS2}/mingw64/share/glib-2.0/schemas" \
  "${WIN_MSYS2}/var/lib/pacman/local/mingw-w64-x86_64-glib2-2.80.0-1"
printf 'fake exe\n' >"${WIN_BUILD}/sqgi.exe"
printf 'fake dll\n' >"${WIN_BUILD}/libsqgi-0.dll"
printf 'glib dll\n' >"${WIN_MSYS2}/mingw64/bin/libglib-2.0-0.dll"
printf 'gio typelib\n' >"${WIN_MSYS2}/mingw64/lib/girepository-1.0/Gio-2.0.typelib"
printf '<schemalist/>\n' >"${WIN_MSYS2}/mingw64/share/glib-2.0/schemas/org.example.gschema.xml"
cat >"${WIN_MSYS2}/var/lib/pacman/local/mingw-w64-x86_64-glib2-2.80.0-1/desc" <<EOF
%NAME%
mingw-w64-x86_64-glib2
EOF
cat >"${WIN_MSYS2}/var/lib/pacman/local/mingw-w64-x86_64-glib2-2.80.0-1/files" <<EOF
%FILES%
mingw64/bin/libglib-2.0-0.dll
mingw64/lib/girepository-1.0/Gio-2.0.typelib
mingw64/share/glib-2.0/schemas/org.example.gschema.xml
mingw64/include/glib-2.0/glib.h
EOF
cat >"${WIN_PROJECT}/main.nut" <<'EOF'
local helper = import("helper.nut")
print(helper.message() + "\n")
EOF
cat >"${WIN_PROJECT}/helper.nut" <<'EOF'
function message() {
    return "windows helper"
}
return { message = message }
EOF
mkdir -p "${WIN_PROJECT}/assets"
printf 'win asset\n' >"${WIN_PROJECT}/assets/data.txt"
cat >"${WIN_PROJECT}/sqgipkg.json" <<EOF
{
  "script": "main.nut",
  "name": "WinSqurl",
  "target": "win-dir",
  "gtk_theme": "SharedTheme",
  "gtk_icon_theme": "SharedIcons",
  "gtk_font_name": "Shared Font 9",
  "gtk_prefer_dark": true,
  "script_dirs": [
    "."
  ],
  "resources": [
    "assets"
  ],
  "windows": {
    "build_dir": "win-build",
    "msys2_root": "msys64",
    "msys2_prefix": "mingw64",
    "download_packages": false,
    "auto_packages": false,
    "gdk_backend": "win32",
    "packages": [
      "mingw-w64-x86_64-glib2"
    ]
  }
}
EOF

WIN_OUT="${WORK_DIR}/win-out"
run_sqgipkg \
  --manifest "${WIN_PROJECT}/sqgipkg.json" \
  --output "${WIN_OUT}" \
  >"${WORK_DIR}/win-dir-package.out"

WINDIR="${WIN_OUT}/WinSqurl"
assert_file "${WINDIR}/bin/sqgi.exe"
assert_file "${WINDIR}/bin/libsqgi-0.dll"
assert_file "${WINDIR}/bin/libglib-2.0-0.dll"
assert_file "${WINDIR}/lib/girepository-1.0/Gio-2.0.typelib"
assert_file "${WINDIR}/share/glib-2.0/schemas/org.example.gschema.xml"
assert_file "${WINDIR}/share/sqgi/app/main.cnut"
assert_file "${WINDIR}/share/sqgi/app/main.nut"
assert_file "${WINDIR}/share/sqgi/app/helper.cnut"
assert_file "${WINDIR}/share/sqgi/app/resources/assets/data.txt"
assert_file "${WINDIR}/etc/gtk-4.0/settings.ini"
assert_file "${WINDIR}/share/gtk-4.0/settings.ini"
assert_file "${WINDIR}/WinSqurl.bat"
assert_contains "${WINDIR}/WinSqurl.bat" "SQGI_APP_SHARE"
assert_contains "${WINDIR}/WinSqurl.bat" "GI_TYPELIB_PATH"
assert_contains "${WINDIR}/WinSqurl.bat" "XDG_CONFIG_DIRS"
assert_contains "${WINDIR}/WinSqurl.bat" "set \"GTK_THEME=SharedTheme\""
assert_contains "${WINDIR}/WinSqurl.bat" "set \"GDK_BACKEND=win32\""
assert_contains "${WINDIR}/etc/gtk-4.0/settings.ini" "gtk-theme-name=SharedTheme"
assert_contains "${WINDIR}/etc/gtk-4.0/settings.ini" "gtk-icon-theme-name=SharedIcons"
assert_contains "${WINDIR}/etc/gtk-4.0/settings.ini" "gtk-font-name=Shared Font 9"
assert_contains "${WINDIR}/etc/gtk-4.0/settings.ini" "gtk-application-prefer-dark-theme=true"
assert_contains "${WORK_DIR}/win-dir-package.out" "Windows dist directory"
pass "Windows dist directory staging"

WIN_NATIVE_PROJECT="${WORK_DIR}/win-native-project"
WIN_NATIVE_BUILD="${WIN_NATIVE_PROJECT}/win-build"
mkdir -p "${WIN_NATIVE_PROJECT}" "${WIN_NATIVE_BUILD}"
printf 'fake native exe\n' >"${WIN_NATIVE_BUILD}/native-entry.exe"
cat >"${WIN_NATIVE_PROJECT}/helper.nut" <<'EOF'
return {
    message = "windows native helper"
}
EOF
cat >"${WIN_NATIVE_PROJECT}/sqgipkg.json" <<'EOF'
{
  "name": "WinNativeEntry",
  "entry": {
    "type": "native",
    "windows": "win-build/native-entry.exe"
  },
  "target": "win-dir",
  "script_dirs": [
    "."
  ],
  "windows": {
    "download_packages": false,
    "auto_packages": false
  }
}
EOF
WIN_NATIVE_OUT="${WORK_DIR}/win-native-out"
run_sqgipkg \
  --manifest "${WIN_NATIVE_PROJECT}/sqgipkg.json" \
  --output "${WIN_NATIVE_OUT}" \
  >"${WORK_DIR}/win-native-package.out"
WIN_NATIVE_DIR="${WIN_NATIVE_OUT}/WinNativeEntry"
assert_file "${WIN_NATIVE_DIR}/bin/native-entry.exe"
assert_not_file "${WIN_NATIVE_DIR}/bin/sqgi.exe"
assert_file "${WIN_NATIVE_DIR}/share/sqgi/app/helper.cnut"
assert_contains "${WIN_NATIVE_DIR}/WinNativeEntry.bat" "\"%HERE%bin\\native-entry.exe\" %*"
pass "native Windows entry with compiled nut payload"

WIN_NSIS_OUT="${WORK_DIR}/win-nsis"
run_sqgipkg \
  --manifest "${WIN_PROJECT}/sqgipkg.json" \
  --target win-nsis \
  --output "${WIN_NSIS_OUT}" \
  --nsis definitely-not-makensis \
  >"${WORK_DIR}/win-nsis-package.out"
assert_file "${WIN_NSIS_OUT}/WinSqurl.nsi"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "File /r"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "WinSqurl/*"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "CreateShortcut"
assert_contains "${WORK_DIR}/win-nsis-package.out" "makensis not found"
pass "Windows NSIS script generation"

WIN_ALL_OUT="${WORK_DIR}/win-all"
run_sqgipkg \
  --manifest "${WIN_PROJECT}/sqgipkg.json" \
  --target all \
  --output "${WIN_ALL_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --nsis definitely-not-makensis \
  >"${WORK_DIR}/win-all-package.out"
assert_file "${WIN_ALL_OUT}-linux/WinSqurl.AppImage"
assert_file "${WIN_ALL_OUT}-windows/WinSqurl/WinSqurl.bat"
assert_file "${WIN_ALL_OUT}-windows/WinSqurl.nsi"
assert_contains "${WORK_DIR}/win-all-package.out" "building all distribution targets"
pass "all target builds AppImage and Windows NSIS"

WIN_REPO_PROJECT="${WORK_DIR}/win-repo-project"
WIN_REPO_BUILD="${WIN_REPO_PROJECT}/win-build"
WIN_REPO="${WIN_REPO_PROJECT}/repo/mingw64"
WIN_REPO_DB="${WIN_REPO_PROJECT}/repo-db"
WIN_REPO_PKGS="${WIN_REPO_PROJECT}/repo-pkgs"
WIN_REPO_SYSROOT="${WIN_REPO_PROJECT}/downloaded-msys64"
mkdir -p "${WIN_REPO_PROJECT}" "${WIN_REPO_BUILD}" "${WIN_REPO}" \
  "${WIN_REPO_DB}/mingw-w64-x86_64-fakeglib-1.0-1" \
  "${WIN_REPO_DB}/mingw-w64-x86_64-fakegtk-1.0-1"
printf 'fake exe\n' >"${WIN_REPO_BUILD}/sqgi.exe"
printf 'fake dll\n' >"${WIN_REPO_BUILD}/libsqgi-0.dll"
cat >"${WIN_REPO_DB}/mingw-w64-x86_64-fakeglib-1.0-1/desc" <<EOF
%NAME%
mingw-w64-x86_64-fakeglib

%FILENAME%
mingw-w64-x86_64-fakeglib-1.0-1-any.pkg.tar
EOF
cat >"${WIN_REPO_DB}/mingw-w64-x86_64-fakegtk-1.0-1/desc" <<EOF
%NAME%
mingw-w64-x86_64-fakegtk

%FILENAME%
mingw-w64-x86_64-fakegtk-1.0-1-any.pkg.tar

%DEPENDS%
mingw-w64-x86_64-fakeglib>=1.0
EOF
tar -C "${WIN_REPO_DB}" -cf "${WIN_REPO}/mingw64.db" .
mkdir -p "${WIN_REPO_PKGS}/glib/mingw64/bin" \
  "${WIN_REPO_PKGS}/gtk/mingw64/bin" \
  "${WIN_REPO_PKGS}/gtk/mingw64/share/gtk-4.0"
printf 'fake glib dll\n' >"${WIN_REPO_PKGS}/glib/mingw64/bin/libfakeglib-0.dll"
printf 'fake gtk dll\n' >"${WIN_REPO_PKGS}/gtk/mingw64/bin/libfakegtk-0.dll"
printf '[Settings]\n' >"${WIN_REPO_PKGS}/gtk/mingw64/share/gtk-4.0/settings.ini"
tar -C "${WIN_REPO_PKGS}/glib" -cf "${WIN_REPO}/mingw-w64-x86_64-fakeglib-1.0-1-any.pkg.tar" mingw64
tar -C "${WIN_REPO_PKGS}/gtk" -cf "${WIN_REPO}/mingw-w64-x86_64-fakegtk-1.0-1-any.pkg.tar" mingw64
cat >"${WIN_REPO_PROJECT}/main.nut" <<'EOF'
print("windows repo resolver\n")
EOF
cat >"${WIN_REPO_PROJECT}/sqgipkg.json" <<EOF
{
  "script": "main.nut",
  "name": "WinResolved",
  "target": "win-dir",
  "windows": {
    "build_dir": "win-build",
    "msys2_root": "downloaded-msys64",
    "msys2_prefix": "mingw64",
    "repo_url": "file://${WIN_REPO}",
    "package_cache": "pkg-cache",
    "auto_packages": false,
    "packages": [
      "mingw-w64-x86_64-fakegtk"
    ]
  }
}
EOF

WIN_RESOLVED_OUT="${WORK_DIR}/win-resolved"
run_sqgipkg \
  --manifest "${WIN_REPO_PROJECT}/sqgipkg.json" \
  --output "${WIN_RESOLVED_OUT}" \
  >"${WORK_DIR}/win-resolved-package.out"
WIN_RESOLVED_DIR="${WIN_RESOLVED_OUT}/WinResolved"
assert_file "${WIN_REPO_SYSROOT}/var/lib/pacman/local/mingw-w64-x86_64-fakeglib-1.0-1-any/desc"
assert_file "${WIN_REPO_SYSROOT}/var/lib/pacman/local/mingw-w64-x86_64-fakegtk-1.0-1-any/files"
assert_file "${WIN_RESOLVED_DIR}/bin/libfakeglib-0.dll"
assert_file "${WIN_RESOLVED_DIR}/bin/libfakegtk-0.dll"
assert_file "${WIN_RESOLVED_DIR}/share/gtk-4.0/settings.ini"
assert_contains "${WORK_DIR}/win-resolved-package.out" "installed MSYS2 package into sysroot: mingw-w64-x86_64-fakeglib"
pass "Windows MSYS2 package resolver"

if command -v git >/dev/null 2>&1; then
  GIT_BRANCH_PROJECT="${WORK_DIR}/git-branch-project"
  GIT_BRANCH_SRC="${WORK_DIR}/git-branch-src"
  GIT_BRANCH_BARE="${WORK_DIR}/git-branch-repo.git"
  mkdir -p "${GIT_BRANCH_PROJECT}" "${GIT_BRANCH_SRC}"
  git -C "${GIT_BRANCH_SRC}" init -q
  git -C "${GIT_BRANCH_SRC}" checkout -q -B master
  printf 'native dependency\n' >"${GIT_BRANCH_SRC}/README.md"
  git -C "${GIT_BRANCH_SRC}" add README.md
  git -C "${GIT_BRANCH_SRC}" \
    -c user.name='sqgipkg test' \
    -c user.email='sqgipkg@example.invalid' \
    commit -q -m 'initial'
  git clone -q --bare "${GIT_BRANCH_SRC}" "${GIT_BRANCH_BARE}"
  cat >"${GIT_BRANCH_PROJECT}/sqgipkg.json" <<EOF
{
  "name": "GitBranchFallback",
  "windows": {
    "msys2_root": "${WIN_MSYS2}",
    "msys2_prefix": "mingw64",
    "download_packages": false,
    "auto_packages": false,
    "packages": [],
    "native_dependencies": [
      {
        "name": "fallback",
        "repo": "file://${GIT_BRANCH_BARE}",
        "dir": ".sqgipkg/native/fallback",
        "branch": "main",
        "update": false,
        "build": [],
        "install": [],
        "stage": false
      }
    ]
  }
}
EOF
  run_sqgipkg \
    --manifest "${GIT_BRANCH_PROJECT}/sqgipkg.json" \
    --target win-sysroot \
    --output "${WORK_DIR}/git-branch-out" \
    >"${WORK_DIR}/git-branch-package.out"
  assert_file "${GIT_BRANCH_PROJECT}/.sqgipkg/native/fallback/README.md"
  assert_contains "${WORK_DIR}/git-branch-package.out" "requested branch 'main' was not found; using remote default branch 'master'"
  [[ "$(git -C "${GIT_BRANCH_PROJECT}/.sqgipkg/native/fallback" branch --show-current)" == "master" ]] ||
    fail "expected native dependency fallback checkout to use master"
  pass "Git native dependency branch fallback"
else
  echo "SKIP: Git native dependency branch fallback (missing git)"
fi

if command -v meson >/dev/null 2>&1 &&
   command -v g-ir-scanner >/dev/null 2>&1 &&
   command -v g-ir-compiler >/dev/null 2>&1 &&
   command -v cc >/dev/null 2>&1; then
  NATIVE_OUT="${WORK_DIR}/native-gi"
  run_sqgipkg \
    --manifest "${ROOT_DIR}/tools/sqgipkg_tests/native_gi_project/sqgipkg.json" \
    --output "${NATIVE_OUT}" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    --smoke-test "" \
    >"${WORK_DIR}/native-gi-package.out"

  assert_file "${NATIVE_OUT}/NativeGI.AppDir/usr/lib/libsqhello-1.0.so"
  assert_file "${NATIVE_OUT}/NativeGI.AppDir/usr/lib/girepository-1.0/SqHello-1.0.typelib"
  assert_contains "${WORK_DIR}/native-gi-package.out" "native projects: 1"
  assert_contains "${WORK_DIR}/native-gi-package.out" "shared libraries: 1"
  assert_contains "${WORK_DIR}/native-gi-package.out" "typelibs: 1"
  assert_contains "${WORK_DIR}/native-gi-package.out" "Hello, SQGI from native GI; sum=42"
  pass "native GI AppImage payload"
else
  echo "SKIP: native GI AppImage payload (missing meson/g-ir/cc toolchain)"
fi

if command -v meson >/dev/null 2>&1 &&
   command -v g-ir-compiler >/dev/null 2>&1 &&
   command -v valac >/dev/null 2>&1 &&
   command -v cc >/dev/null 2>&1; then
  NATIVE_VALA_OUT="${WORK_DIR}/native-vala"
  run_sqgipkg \
    --manifest "${ROOT_DIR}/tools/sqgipkg_tests/native_vala_project/sqgipkg.json" \
    --output "${NATIVE_VALA_OUT}" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    --smoke-test "" \
    >"${WORK_DIR}/native-vala-package.out"

  assert_file "${NATIVE_VALA_OUT}/NativeVala.AppDir/usr/lib/libsqvala-1.0.so"
  assert_file "${NATIVE_VALA_OUT}/NativeVala.AppDir/usr/lib/girepository-1.0/SqVala-1.0.typelib"
  assert_contains "${WORK_DIR}/native-vala-package.out" "native projects: 1"
  assert_contains "${WORK_DIR}/native-vala-package.out" "shared libraries: 1"
  assert_contains "${WORK_DIR}/native-vala-package.out" "typelibs: 1"
  assert_contains "${WORK_DIR}/native-vala-package.out" "caught expected Vala async error"
  assert_contains "${WORK_DIR}/native-vala-package.out" "async vala greets SQGI; sum=42; progress=3"
  pass "native Vala AppImage payload"
else
  echo "SKIP: native Vala AppImage payload (missing meson/valac/g-ir-compiler/cc toolchain)"
fi

MANIFEST_DEMO_OUT="${WORK_DIR}/manifest-image-viewer"
run_sqgipkg \
  --manifest "${ROOT_DIR}/demo/gtk4/image_viewer.sqgipkg.json" \
  --output "${MANIFEST_DEMO_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/manifest-image-viewer-package.out"

assert_file "${MANIFEST_DEMO_OUT}/ImageViewer.AppDir/usr/share/sqgi/app/resources/assets/blaue_blume_600.jpg"
run_appimage "${MANIFEST_DEMO_OUT}/ImageViewer.AppImage" --timeout=1 >"${WORK_DIR}/manifest-image-viewer-run.out"
assert_contains "${WORK_DIR}/manifest-image-viewer-run.out" "image_viewer: loaded"
assert_contains "${WORK_DIR}/manifest-image-viewer-run.out" "resources/assets/blaue_blume_600.jpg"
pass "manifest AppImage for demo/gtk4/image_viewer.nut"

GTK_THEMES_OUT="${WORK_DIR}/gtk-themes"
run_sqgipkg \
  --manifest "${ROOT_DIR}/tools/sqgipkg_tests/gtk_themes/sqgipkg.json" \
  --output "${GTK_THEMES_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/gtk-themes-package.out"

assert_file "${GTK_THEMES_OUT}/GtkWidgetThemes.AppDir/usr/share/themes/SQGI-Violet-Dark/gtk-4.0/gtk.css"
assert_contains "${GTK_THEMES_OUT}/GtkWidgetThemes.AppDir/usr/etc/gtk-4.0/settings.ini" "gtk-theme-name=SQGI-Violet-Dark"
assert_contains "${GTK_THEMES_OUT}/GtkWidgetThemes.AppDir/AppRun" 'APPDIR'
run_appimage "${GTK_THEMES_OUT}/GtkWidgetThemes.AppImage" --auto >"${WORK_DIR}/gtk-themes-run.out" 2>&1
assert_contains "${WORK_DIR}/gtk-themes-run.out" "window.close-request"
assert_contains "${WORK_DIR}/gtk-themes-run.out" "Gtk Application exited with code 0"
if grep -Fq "Theme parser error" "${WORK_DIR}/gtk-themes-run.out"; then
  sed -n '1,160p' "${WORK_DIR}/gtk-themes-run.out" >&2
  fail "gtk_themes emitted GTK theme parser errors"
fi
pass "gtk_themes AppImage uses bundled theme and closes cleanly"

echo "sqgipkg tests passed"
