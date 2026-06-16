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
  "${SQGI_BIN}" "${SQGIPKG}" --build-dir "${BUILD_DIR}" "$@"
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

assert_not_contains() {
  local file="$1"
  local needle="$2"
  if grep -Fq -- "$needle" "$file"; then
    echo "--- ${file} ---" >&2
    sed -n '1,160p' "$file" >&2 || true
    fail "did not expect '$needle' in $file"
  fi
}

appimagetool_arch() {
  case "$(uname -m)" in
    amd64) echo "x86_64" ;;
    arm64) echo "aarch64" ;;
    *) uname -m ;;
  esac
}

deb_arch_for_appimage_arch() {
  case "$1" in
    x86_64) echo "amd64" ;;
    aarch64) echo "arm64" ;;
    i386|i686) echo "i386" ;;
    *) echo "$1" ;;
  esac
}

linux_triplet_for_appimage_arch() {
  case "$1" in
    x86_64) echo "x86_64-linux-gnu" ;;
    aarch64) echo "aarch64-linux-gnu" ;;
    i386|i686) echo "i386-linux-gnu" ;;
    *) echo "$1-linux-gnu" ;;
  esac
}

elf_arch() {
  local path="$1"
  readelf -h "$path" 2>/dev/null | awk '
    /Machine:/ {
      if ($0 ~ /AArch64/) { print "aarch64"; exit }
      if ($0 ~ /X86-64/) { print "x86_64"; exit }
      if ($0 ~ /80386/) { print "i386"; exit }
    }' || true
}

assert_elf_arch() {
  local path="$1"
  local expected="$2"
  if ! command -v readelf >/dev/null 2>&1; then
    echo "SKIP: ELF arch assertion for ${path} (missing readelf)"
    return
  fi
  local actual
  actual="$(elf_arch "$path")"
  [[ -n "${actual}" ]] || fail "could not determine ELF architecture: $path"
  [[ "${actual}" == "${expected}" ]] ||
    fail "ELF architecture mismatch for $path: expected ${expected}, got ${actual}"
}

assert_appdir_elf_arches() {
  local appdir="$1"
  local expected="$2"
  if ! command -v readelf >/dev/null 2>&1; then
    echo "SKIP: AppDir ELF arch assertion for ${appdir} (missing readelf)"
    return
  fi
  local checked=0
  while IFS= read -r -d '' path; do
    local actual
    actual="$(elf_arch "$path")"
    if [[ -z "${actual}" ]]; then
      continue
    fi
    checked=$((checked + 1))
    [[ "${actual}" == "${expected}" ]] ||
      fail "staged ELF architecture mismatch for $path: expected ${expected}, got ${actual}"
  done < <(find "${appdir}/usr/bin" "${appdir}/usr/lib" -type f -print0 2>/dev/null || true)
  [[ "${checked}" -gt 0 ]] || fail "no ELF files inspected in ${appdir}"
}

APPIMAGETOOL_CACHE="${WORK_DIR}/tool-cache"
APPIMAGETOOL="${APPIMAGETOOL_CACHE}/appimagetool-$(appimagetool_arch).AppImage"
HOST_APPIMAGE_ARCH="$(appimagetool_arch)"
HOST_DEB_ARCH="$(deb_arch_for_appimage_arch "${HOST_APPIMAGE_ARCH}")"
HOST_LINUX_TRIPLET="$(linux_triplet_for_appimage_arch "${HOST_APPIMAGE_ARCH}")"

MAIN_SCRIPT="${WORK_DIR}/main.nut"
cat >"${MAIN_SCRIPT}" <<'EOF'
local GLib = import("GLib")
local Gio = import("Gio")
local helper = import("helper.nut")

function read_text(path) {
    local result = Gio.File.new_for_path(path).load_contents(null)
    return typeof(result) == "array" ? result[0] : result
}

if (vargv.len() != 2) {
    print("expected 2 args, got " + vargv.len() + "\n")
    return 10
}
if (vargv[0] != "alpha" || vargv[1] != "beta") {
    print("unexpected args\n")
    return 11
}
print(helper.message() + "\n")
print("resource payload: " + read_text(GLib.build_filenamev([
    GLib.getenv("SQGI_APP_RESOURCES"),
    "resources",
    "sub",
    "nested.txt"
])))
print("manual payload: " + read_text(GLib.build_filenamev([
    GLib.getenv("SQGI_APP_SHARE"),
    "manual",
    "file.txt"
])))
print("include payload: " + read_text(GLib.build_filenamev([
    GLib.getenv("SQGI_APP_SHARE"),
    "assets",
    "asset.txt"
])))
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

"${SQGI_BIN}" "${ROOT_DIR}/tools/sqgipkg_tests/test_modules.nut" >"${WORK_DIR}/modules.out"
assert_contains "${WORK_DIR}/modules.out" "sqgipkg module tests passed"
pass "module-level sqgipkg tests"

export SQGI_SOURCE_DIR="${ROOT_DIR}"

HELP_OUT="${WORK_DIR}/help.out"
run_sqgipkg --help >"${HELP_OUT}"
assert_contains "${HELP_OUT}" "Usage:"
assert_contains "${HELP_OUT}" "sqgipkg [OPTION?]"
assert_contains "${HELP_OUT}" "Help Options:"
assert_contains "${HELP_OUT}" "Application Options:"
assert_contains "${HELP_OUT}" "--help-gapplication"
assert_contains "${HELP_OUT}" "--resource=PATH"
assert_contains "${HELP_OUT}" "--refresh-appimagetool"
assert_contains "${HELP_OUT}" "--sqgi-source=DIR"
assert_contains "${HELP_OUT}" "--sqgi-source-repo=URL"
assert_contains "${HELP_OUT}" "--appimage-arch=ARCH"
assert_contains "${HELP_OUT}" "--linux-arch=ARCH"
assert_contains "${HELP_OUT}" "--linux-deb-package=PACKAGE"
assert_contains "${HELP_OUT}" "--linux-package=PACKAGE"
assert_contains "${HELP_OUT}" "--linux-deb-download"
assert_contains "${HELP_OUT}" "--linux-deb-package-cache=DIR"
assert_contains "${HELP_OUT}" "--linux-deb-suite=SUITE"
assert_contains "${HELP_OUT}" "--no-linux-deb-download"
assert_contains "${HELP_OUT}" "linux-sysroot"
assert_contains "${HELP_OUT}" "--clean"
assert_contains "${HELP_OUT}" "--windows-console"
assert_contains "${HELP_OUT}" "--no-windows-console"
assert_contains "${HELP_OUT}" "--windows-build-package=PACKAGE"
assert_contains "${HELP_OUT}" "--windows-font=SPEC"
assert_contains "${HELP_OUT}" "--nsis-header-image=FILE"
assert_contains "${HELP_OUT}" "--nsis-welcome-image=FILE"
assert_contains "${HELP_OUT}" "--script-dir=DIR"
assert_contains "${HELP_OUT}" "--no-compile-scripts"
assert_contains "${HELP_OUT}" "--file=SPEC"
assert_contains "${HELP_OUT}" "--library=PATH"
assert_contains "${HELP_OUT}" "--doctor"
assert_contains "${HELP_OUT}" "--smoke-test=ARGS"
assert_contains "${HELP_OUT}" "--init=TEMPLATE"
pass "Gio.Application help output"

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
  --appimage-arch "${HOST_APPIMAGE_ARCH}" \
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
assert_elf_arch "${APPIMAGE}" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${APPDIR}" "${HOST_APPIMAGE_ARCH}"
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
assert_contains "${WORK_DIR}/package.out" "appimage arch: ${HOST_APPIMAGE_ARCH}"
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
assert_elf_arch "${THEME_OUT}/ThemeProject.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${THEME_APPDIR}" "${HOST_APPIMAGE_ARCH}"
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
assert_contains "${WORK_DIR}/appimage.out" "resource payload: nested"
assert_contains "${WORK_DIR}/appimage.out" "manual payload: manual file"
assert_contains "${WORK_DIR}/appimage.out" "include payload: asset"
pass "real custom AppImage execution"

IMPLICIT_PROJECT="${WORK_DIR}/implicit-imports"
mkdir -p "${IMPLICIT_PROJECT}/lib/more"
cat >"${IMPLICIT_PROJECT}/main.nut" <<'EOF'
local helper = import("lib/helper.nut")
print(helper.message() + "\n")
EOF
cat >"${IMPLICIT_PROJECT}/lib/helper.nut" <<'EOF'
local deep = import("more/deep.nut")

function message() {
    return "implicit " + deep.message()
}

return {
    message = message
}
EOF
cat >"${IMPLICIT_PROJECT}/lib/more/deep.nut" <<'EOF'
function message() {
    return "imports worked"
}

return {
    message = message
}
EOF
IMPLICIT_OUT="${WORK_DIR}/implicit-out"
run_sqgipkg "${IMPLICIT_PROJECT}/main.nut" \
  --name ImplicitImports \
  --target appimage \
  --output "${IMPLICIT_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/implicit-package.out"
IMPLICIT_APPDIR="${IMPLICIT_OUT}/ImplicitImports.AppDir"
assert_elf_arch "${IMPLICIT_OUT}/ImplicitImports.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${IMPLICIT_APPDIR}" "${HOST_APPIMAGE_ARCH}"
assert_file "${IMPLICIT_APPDIR}/usr/share/sqgi/app/main.cnut"
assert_file "${IMPLICIT_APPDIR}/usr/share/sqgi/app/lib/helper.cnut"
assert_file "${IMPLICIT_APPDIR}/usr/share/sqgi/app/lib/helper.nut"
assert_file "${IMPLICIT_APPDIR}/usr/share/sqgi/app/lib/more/deep.cnut"
assert_file "${IMPLICIT_APPDIR}/usr/share/sqgi/app/lib/more/deep.nut"
run_appimage "${IMPLICIT_OUT}/ImplicitImports.AppImage" >"${WORK_DIR}/implicit-run.out"
assert_contains "${WORK_DIR}/implicit-run.out" "implicit imports worked"
pass "implicit local script imports are packaged recursively"

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
assert_file "${DEFAULT_PROJECT}/dist-linux-${HOST_APPIMAGE_ARCH}/default-project.AppImage"
assert_elf_arch "${DEFAULT_PROJECT}/dist-linux-${HOST_APPIMAGE_ARCH}/default-project.AppImage" "${HOST_APPIMAGE_ARCH}"
run_appimage "${DEFAULT_PROJECT}/dist-linux-${HOST_APPIMAGE_ARCH}/default-project.AppImage" >"${WORK_DIR}/default-project-run.out"
assert_contains "${WORK_DIR}/default-project-run.out" "default project packaged"
pass "default project packaging"

mkdir -p "${DEFAULT_PROJECT}/dist" \
  "${DEFAULT_PROJECT}/dist-linux-${HOST_APPIMAGE_ARCH}" \
  "${DEFAULT_PROJECT}/dist-windows-x86_64" \
  "${DEFAULT_PROJECT}/build" \
  "${DEFAULT_PROJECT}/build-linux-${HOST_APPIMAGE_ARCH}" \
  "${DEFAULT_PROJECT}/build-windows-x86_64"
(
  cd "${DEFAULT_PROJECT}"
  PATH="${BUILD_DIR}:${PATH}" run_sqgipkg --clean >"${WORK_DIR}/default-project-clean.out"
)
assert_not_file "${DEFAULT_PROJECT}/dist-linux-${HOST_APPIMAGE_ARCH}/default-project.AppImage"
[[ ! -d "${DEFAULT_PROJECT}/dist" ]] || fail "expected clean to remove legacy dist"
[[ ! -d "${DEFAULT_PROJECT}/dist-windows-x86_64" ]] || fail "expected clean to remove Windows dist"
[[ ! -d "${DEFAULT_PROJECT}/build" ]] || fail "expected clean to remove legacy build"
[[ ! -d "${DEFAULT_PROJECT}/build-linux-${HOST_APPIMAGE_ARCH}" ]] || fail "expected clean to remove Linux build"
[[ ! -d "${DEFAULT_PROJECT}/build-windows-x86_64" ]] || fail "expected clean to remove Windows build"
pass "clean target removes project build and dist directories"

PATH="${BUILD_DIR}:${PATH}" LD_LIBRARY_PATH="${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
  "${SQGIPKG}" "${ROOT_DIR}/demo/glib/paths_env.nut" \
    --build-dir "${BUILD_DIR}" \
    --name DemoPathsDirect \
    --target appimage \
    --output "${WORK_DIR}/direct" \
    --appimagetool "${APPIMAGETOOL}" \
    --keep-appdir \
    >"${WORK_DIR}/direct.out"
assert_executable "${WORK_DIR}/direct/DemoPathsDirect.AppImage"
assert_elf_arch "${WORK_DIR}/direct/DemoPathsDirect.AppImage" "${HOST_APPIMAGE_ARCH}"
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
assert_elf_arch "${DEMO_PATHS_OUT}/DemoPaths.AppImage" "${HOST_APPIMAGE_ARCH}"
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
assert_elf_arch "${DEMO_STAT_OUT}/DemoStat.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_contains "${WORK_DIR}/demo-stat-run.out" "path: ${WORK_DIR}/stat-target.txt"
assert_contains "${WORK_DIR}/demo-stat-run.out" "standard::name"
pass "real AppImage for demo/gio/stat.nut"

MANIFEST_APP_DIR="${WORK_DIR}/manifest-app"
mkdir -p "${MANIFEST_APP_DIR}/data" \
  "${MANIFEST_APP_DIR}/data/locale/en/LC_MESSAGES" \
  "${MANIFEST_APP_DIR}/data/icons"
cat >"${MANIFEST_APP_DIR}/main.nut" <<'EOF'
local GLib = import("GLib")
local Gio = import("Gio")
local manual = GLib.build_filenamev([GLib.getenv("SQGI_APP_SHARE"), "manual", "payload.txt"])
local data = Gio.File.new_for_path(manual).load_contents(null)
local text = (typeof(data) == "array") ? data[0] : data
print("manual payload: " + text)
EOF
printf 'manifest file works\n' >"${MANIFEST_APP_DIR}/data/payload.txt"
printf 'locale rule works\n' >"${MANIFEST_APP_DIR}/data/locale/en/LC_MESSAGES/app.mo"
printf 'icon rule works\n' >"${MANIFEST_APP_DIR}/data/icons/16.png"
cat >"${MANIFEST_APP_DIR}/sqgipkg.json" <<'EOF'
{
  "script": "main.nut",
  "name": "ManifestFiles",
  "target": "appimage",
  "files": [
    {
      "path": "data/payload.txt",
      "dest": "usr/share/sqgi/app/manual/payload.txt"
    },
    {
      "from": "data/locale",
      "to": "usr/share/sqgi/app/locale",
      "include": "*/LC_MESSAGES/app.mo"
    },
    {
      "from": "data/icons",
      "match": "^(\\d+)\\.png$",
      "dest": "usr/share/sqgi/app/icons/$1x$1/app.png"
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

LINT_PROJECT="${WORK_DIR}/manifest-lint"
mkdir -p "${LINT_PROJECT}"
cat >"${LINT_PROJECT}/main.nut" <<'EOF'
print("manifest lint\n")
EOF
cat >"${LINT_PROJECT}/sqgipkg.json" <<'EOF'
{
  "script": "main.nut",
  "name": "ManifestLint",
  "linux": {
    "arches": [
      "x86_64",
      "x86_64"
    ]
  }
}
EOF
if run_sqgipkg \
  --manifest "${LINT_PROJECT}/sqgipkg.json" \
  --doctor \
  >"${WORK_DIR}/manifest-lint-doctor.out" 2>&1; then
  fail "duplicate linux.arches doctor unexpectedly succeeded"
fi
assert_contains "${WORK_DIR}/manifest-lint-doctor.out" "duplicate linux.arches target: x86_64"
pass "manifest doctor catches duplicate Linux arch entries"

MANIFEST_FILES_OUT="${WORK_DIR}/manifest-files"
run_sqgipkg \
  --manifest "${MANIFEST_APP_DIR}/sqgipkg.json" \
  --output "${MANIFEST_FILES_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --keep-appdir \
  >"${WORK_DIR}/manifest-files-package.out"

assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/main.cnut"
assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/manual/payload.txt"
assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/locale/en/LC_MESSAGES/app.mo"
assert_file "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir/usr/share/sqgi/app/icons/16x16/app.png"
assert_elf_arch "${MANIFEST_FILES_OUT}/ManifestFiles.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${MANIFEST_FILES_OUT}/ManifestFiles.AppDir" "${HOST_APPIMAGE_ARCH}"
run_appimage "${MANIFEST_FILES_OUT}/ManifestFiles.AppImage" >"${WORK_DIR}/manifest-files-run.out"
assert_contains "${WORK_DIR}/manifest-files-run.out" "manual payload: manifest file works"
pass "manifest files payload"

LINUX_PKG_PROJECT="${WORK_DIR}/linux-pkg-project"
LINUX_PKG_ROOT="${WORK_DIR}/linux-pkg-root"
LINUX_PKG_BIN="${WORK_DIR}/linux-pkg-bin"
mkdir -p "${LINUX_PKG_PROJECT}" \
  "${LINUX_PKG_ROOT}/usr/lib/${HOST_LINUX_TRIPLET}" \
  "${LINUX_PKG_ROOT}/usr/share/fakepkg" \
  "${LINUX_PKG_ROOT}/usr/include" \
  "${LINUX_PKG_BIN}"
cat >"${LINUX_PKG_PROJECT}/main.nut" <<'EOF'
print("linux package staging\n")
EOF
printf 'fake shared library\n' >"${LINUX_PKG_ROOT}/usr/lib/${HOST_LINUX_TRIPLET}/libfakepkg.so.1"
printf 'fake data\n' >"${LINUX_PKG_ROOT}/usr/share/fakepkg/data.txt"
printf 'not runtime\n' >"${LINUX_PKG_ROOT}/usr/include/fakepkg.h"
cat >"${LINUX_PKG_BIN}/dpkg-query" <<EOF
#!/usr/bin/env bash
set -euo pipefail
if [[ "\${1:-}" == "-L" && "\${2:-}" == "fakepkg:${HOST_DEB_ARCH}" ]]; then
  printf '%s\n' \\
    "/usr/lib/${HOST_LINUX_TRIPLET}/libfakepkg.so.1" \\
    "/usr/share/fakepkg/data.txt" \\
    "/usr/include/fakepkg.h"
  exit 0
fi
exit 1
EOF
chmod +x "${LINUX_PKG_BIN}/dpkg-query"
LINUX_PKG_OUT="${WORK_DIR}/linux-pkg-out"
PATH="${LINUX_PKG_BIN}:${PATH}" run_sqgipkg \
  "${LINUX_PKG_PROJECT}/main.nut" \
  --name LinuxPkg \
  --output "${LINUX_PKG_OUT}" \
  --appimagetool "${APPIMAGETOOL}" \
  --linux-package fakepkg \
  --linux-sysroot "${LINUX_PKG_ROOT}" \
  --no-linux-deps \
  --keep-appdir \
  >"${WORK_DIR}/linux-pkg-package.out"
assert_file "${LINUX_PKG_OUT}/LinuxPkg.AppDir/usr/lib/libfakepkg.so.1"
assert_file "${LINUX_PKG_OUT}/LinuxPkg.AppDir/usr/share/fakepkg/data.txt"
assert_not_file "${LINUX_PKG_OUT}/LinuxPkg.AppDir/usr/include/fakepkg.h"
assert_elf_arch "${LINUX_PKG_OUT}/LinuxPkg.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${LINUX_PKG_OUT}/LinuxPkg.AppDir" "${HOST_APPIMAGE_ARCH}"
assert_contains "${WORK_DIR}/linux-pkg-package.out" "copied 2 file(s) from fakepkg:${HOST_DEB_ARCH}"
pass "Linux Debian package runtime staging"

CROSS_APPIMAGE_ARCH="aarch64"
if [[ "${HOST_APPIMAGE_ARCH}" == "aarch64" ]]; then
  CROSS_APPIMAGE_ARCH="x86_64"
fi
CROSS_DEB_ARCH="$(deb_arch_for_appimage_arch "${CROSS_APPIMAGE_ARCH}")"
LINUX_SYSROOT_TARGET_ROOT="${WORK_DIR}/linux-sysroot-explicit"
LINUX_SYSROOT_OUT="${WORK_DIR}/linux-sysroot-out"
mkdir -p "${LINUX_SYSROOT_TARGET_ROOT}"
run_sqgipkg \
  --target linux-sysroot \
  --name LinuxSysrootProbe \
  --appimage-arch "${CROSS_APPIMAGE_ARCH}" \
  --linux-sysroot "${LINUX_SYSROOT_TARGET_ROOT}" \
  --output "${LINUX_SYSROOT_OUT}" \
  >"${WORK_DIR}/linux-sysroot.out"
assert_file "${LINUX_SYSROOT_OUT}/_cross/${CROSS_APPIMAGE_ARCH}/toolchain-${CROSS_APPIMAGE_ARCH}.cmake"
assert_file "${LINUX_SYSROOT_OUT}/_cross/${CROSS_APPIMAGE_ARCH}/${CROSS_APPIMAGE_ARCH}.ini"
assert_contains "${WORK_DIR}/linux-sysroot.out" "Linux sysroot ready"
assert_contains "${WORK_DIR}/linux-sysroot.out" "target arch: ${CROSS_APPIMAGE_ARCH}"
assert_contains "${WORK_DIR}/linux-sysroot.out" "Debian arch: ${CROSS_DEB_ARCH}"
assert_contains "${WORK_DIR}/linux-sysroot.out" "target triplet: $(linux_triplet_for_appimage_arch "${CROSS_APPIMAGE_ARCH}")"
assert_contains "${WORK_DIR}/linux-sysroot.out" "sysroot: ${LINUX_SYSROOT_TARGET_ROOT}"
assert_contains "${WORK_DIR}/linux-sysroot.out" "SQGI_LINUX_SYSROOT=${LINUX_SYSROOT_TARGET_ROOT}"
assert_contains "${LINUX_SYSROOT_OUT}/_cross/${CROSS_APPIMAGE_ARCH}/toolchain-${CROSS_APPIMAGE_ARCH}.cmake" "$(linux_triplet_for_appimage_arch "${CROSS_APPIMAGE_ARCH}")-gcc"
pass "Linux sysroot target writes cross build files"

CROSS_MISSING_PROJECT="${WORK_DIR}/cross-missing-project"
mkdir -p "${CROSS_MISSING_PROJECT}/empty-root" "${CROSS_MISSING_PROJECT}/build-${CROSS_APPIMAGE_ARCH}"
cat >"${CROSS_MISSING_PROJECT}/main.nut" <<'EOF'
local Gtk = import("Gtk", "4.0")
local Gst = import("Gst")
print("cross preflight should stop before build\n")
EOF
cat >"${CROSS_MISSING_PROJECT}/sqgipkg.json" <<EOF
{
  "script": "main.nut",
  "name": "CrossMissing",
  "appimage_arch": "${CROSS_APPIMAGE_ARCH}",
  "build_dir": "build-${CROSS_APPIMAGE_ARCH}",
  "linux": {
    "sysroot": "empty-root",
    "build": [
      "echo should-not-run"
    ]
  }
}
EOF
set +e
run_sqgipkg \
  --manifest "${CROSS_MISSING_PROJECT}/sqgipkg.json" \
  --target appimage \
  --output "${WORK_DIR}/cross-missing-out" \
  >"${WORK_DIR}/cross-missing-package.out" 2>&1
CROSS_MISSING_STATUS=$?
set -e
[[ ${CROSS_MISSING_STATUS} -ne 0 ]] || fail "expected missing ${CROSS_APPIMAGE_ARCH} build requirements to fail"
assert_contains "${WORK_DIR}/cross-missing-package.out" "missing Linux ${CROSS_APPIMAGE_ARCH} build requirements"
assert_contains "${WORK_DIR}/cross-missing-package.out" "PKG_CONFIG_SYSROOT_DIR"
assert_contains "${WORK_DIR}/cross-missing-package.out" "PKG_CONFIG_LIBDIR"
assert_contains "${WORK_DIR}/cross-missing-package.out" "glib-2.0"
assert_contains "${WORK_DIR}/cross-missing-package.out" "gtk4"
assert_contains "${WORK_DIR}/cross-missing-package.out" "gstreamer-1.0"
assert_contains "${WORK_DIR}/cross-missing-package.out" "libglib2.0-dev:${CROSS_DEB_ARCH}"
assert_contains "${WORK_DIR}/cross-missing-package.out" "libgtk-4-dev:${CROSS_DEB_ARCH}"
assert_not_contains "${WORK_DIR}/cross-missing-package.out" "should-not-run"
if grep -Fq "Apt cannot currently see" "${WORK_DIR}/cross-missing-package.out"; then
  if [[ "${CROSS_DEB_ARCH}" == "arm64" ]]; then
    assert_contains "${WORK_DIR}/cross-missing-package.out" "ports.ubuntu.com"
    assert_contains "${WORK_DIR}/cross-missing-package.out" "ubuntu-arm64.sources"
  elif [[ "${CROSS_DEB_ARCH}" == "amd64" ]]; then
    assert_contains "${WORK_DIR}/cross-missing-package.out" "archive.ubuntu.com"
    assert_contains "${WORK_DIR}/cross-missing-package.out" "ubuntu-amd64.sources"
  fi
fi
pass "Linux cross build preflight reports missing target packages"

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
  assert_elf_arch "${NATIVE_ENTRY_PROJECT_OUT}/NativeEntryProject.AppImage" "${HOST_APPIMAGE_ARCH}"
  assert_appdir_elf_arches "${NATIVE_ENTRY_PROJECT_OUT}/NativeEntryProject.AppDir" "${HOST_APPIMAGE_ARCH}"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "native entry project ran"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "arg: project-arg"
  assert_contains "${WORK_DIR}/native-entry-project-package.out" "payload:"
  pass "native entry test project AppImage"
else
  echo "SKIP: native entry test project AppImage (missing meson/cc toolchain)"
fi

WIN_PROJECT="${WORK_DIR}/win-project"
WIN_BUILD="${WIN_PROJECT}/build-windows-x86_64"
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
local Gtk = import("Gtk", "4.0")
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
  "linux": {
    "copy_dependencies": false,
    "arches": [
      {
        "arch": "${HOST_APPIMAGE_ARCH}",
        "build_dir": "${BUILD_DIR}"
      }
    ]
  },
  "windows": {
    "build_dir": "build-windows-x86_64",
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
assert_not_file "${WINDIR}/WinSqurl.vbs"
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
CROSS_FILE="${WIN_OUT}/_cross/mingw64/mingw64.ini"
TOOLCHAIN_FILE="${WIN_OUT}/_cross/mingw64/toolchain-mingw64.cmake"
assert_file "${CROSS_FILE}"
assert_file "${TOOLCHAIN_FILE}"
assert_contains "${CROSS_FILE}" "pkg-config = 'pkg-config'"
assert_contains "${CROSS_FILE}" "pkgconfig = 'pkg-config'"
assert_contains "${TOOLCHAIN_FILE}" "set(SQGI_WINDOWS_GUI ON"
if command -v g-ir-scanner >/dev/null 2>&1; then
  assert_file "${WIN_OUT}/_cross/mingw64/g-ir-scanner-wrapper.sh"
  assert_contains "${CROSS_FILE}" "g-ir-scanner = '${WIN_OUT}/_cross/mingw64/g-ir-scanner-wrapper.sh'"
  assert_contains "${WIN_OUT}/_cross/mingw64/g-ir-scanner-wrapper.sh" "exec '$(command -v g-ir-scanner)'"
fi
if command -v g-ir-compiler >/dev/null 2>&1; then
  assert_contains "${CROSS_FILE}" "g-ir-compiler = '$(command -v g-ir-compiler)'"
fi
if { command -v wine >/dev/null 2>&1 || command -v wine64 >/dev/null 2>&1; } &&
   command -v g-ir-scanner >/dev/null 2>&1; then
  assert_file "${WIN_OUT}/_cross/mingw64/wine-wrapper.sh"
  assert_file "${WIN_OUT}/_cross/mingw64/g-ir-ldd-wrapper.sh"
  assert_contains "${CROSS_FILE}" "exe_wrapper = '${WIN_OUT}/_cross/mingw64/wine-wrapper.sh'"
  assert_contains "${WIN_OUT}/_cross/mingw64/g-ir-scanner-wrapper.sh" "--use-binary-wrapper='${WIN_OUT}/_cross/mingw64/wine-wrapper.sh'"
  assert_contains "${WIN_OUT}/_cross/mingw64/g-ir-scanner-wrapper.sh" "--use-ldd-wrapper='${WIN_OUT}/_cross/mingw64/g-ir-ldd-wrapper.sh'"
fi
pass "Windows dist directory staging"

WIN_CONSOLE_OUT="${WORK_DIR}/win-console-out"
run_sqgipkg \
  --manifest "${WIN_PROJECT}/sqgipkg.json" \
  --target win-dir \
  --windows-console \
  --output "${WIN_CONSOLE_OUT}" \
  >"${WORK_DIR}/win-console-package.out"
assert_file "${WIN_CONSOLE_OUT}/WinSqurl/WinSqurl.bat"
assert_not_file "${WIN_CONSOLE_OUT}/WinSqurl/WinSqurl.vbs"
assert_contains "${WIN_CONSOLE_OUT}/_cross/mingw64/toolchain-mingw64.cmake" "set(SQGI_WINDOWS_GUI OFF"
pass "Windows console launcher override"

WIN_MISSING_PROJECT="${WORK_DIR}/win-missing-runtime"
mkdir -p "${WIN_MISSING_PROJECT}"
cat >"${WIN_MISSING_PROJECT}/main.nut" <<'EOF'
print("missing runtime\n")
EOF
cat >"${WIN_MISSING_PROJECT}/sqgipkg.json" <<'EOF'
{
  "script": "main.nut",
  "name": "WinMissingRuntime",
  "target": "win-dir",
  "windows": {
    "build_dir": "build-windows-x86_64",
    "download_packages": false,
    "auto_packages": false
  }
}
EOF
if PATH="/usr/bin:/bin" run_sqgipkg \
  --manifest "${WIN_MISSING_PROJECT}/sqgipkg.json" \
  --output "${WORK_DIR}/win-missing-out" \
  >"${WORK_DIR}/win-missing-package.out" 2>&1; then
  fail "Windows package without sqgi.exe unexpectedly succeeded"
fi
assert_contains "${WORK_DIR}/win-missing-package.out" "Windows sqgi.exe not found"
assert_contains "${WORK_DIR}/win-missing-package.out" "no windows.build command is configured"
pass "Windows sqgi.exe is required for script entry packages"

WIN_NATIVE_PROJECT="${WORK_DIR}/win-native-project"
WIN_NATIVE_BUILD="${WIN_NATIVE_PROJECT}/build-windows-x86_64"
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
    "windows": "build-windows-x86_64/native-entry.exe"
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
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "!include MUI2.nsh"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "!insertmacro MUI_PAGE_WELCOME"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "!insertmacro MUI_PAGE_DIRECTORY"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "!insertmacro MUI_PAGE_FINISH"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "File /r"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "WinSqurl/*"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "CreateShortcut"
assert_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "WinSqurl.exe"
assert_not_contains "${WIN_NSIS_OUT}/WinSqurl.nsi" "WinSqurl.vbs"
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
assert_file "${WIN_ALL_OUT}-linux-${HOST_APPIMAGE_ARCH}/WinSqurl.AppImage"
assert_file "${WIN_ALL_OUT}-windows-x86_64/WinSqurl/WinSqurl.bat"
assert_file "${WIN_ALL_OUT}-windows-x86_64/WinSqurl.nsi"
assert_contains "${WORK_DIR}/win-all-package.out" "building all distribution targets"
assert_contains "${WORK_DIR}/win-all-package.out" "appimage arch: ${HOST_APPIMAGE_ARCH}"
pass "all target builds native AppImage and Windows NSIS"

WIN_REPO_PROJECT="${WORK_DIR}/win-repo-project"
WIN_REPO_BUILD="${WIN_REPO_PROJECT}/build-windows-x86_64"
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
    "build_dir": "build-windows-x86_64",
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
  assert_elf_arch "${NATIVE_OUT}/NativeGI.AppImage" "${HOST_APPIMAGE_ARCH}"
  assert_appdir_elf_arches "${NATIVE_OUT}/NativeGI.AppDir" "${HOST_APPIMAGE_ARCH}"
  assert_contains "${WORK_DIR}/native-gi-package.out" "native projects: 1"
  assert_contains "${WORK_DIR}/native-gi-package.out" "shared libraries:"
  assert_contains "${WORK_DIR}/native-gi-package.out" "recursively resolved Linux ELF"
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
    --no-linux-deb-download \
    --keep-appdir \
    --smoke-test "" \
    >"${WORK_DIR}/native-vala-package.out"

  assert_file "${NATIVE_VALA_OUT}/NativeVala.AppDir/usr/lib/libsqvala-1.0.so"
  assert_file "${NATIVE_VALA_OUT}/NativeVala.AppDir/usr/lib/girepository-1.0/SqVala-1.0.typelib"
  assert_elf_arch "${NATIVE_VALA_OUT}/NativeVala.AppImage" "${HOST_APPIMAGE_ARCH}"
  assert_appdir_elf_arches "${NATIVE_VALA_OUT}/NativeVala.AppDir" "${HOST_APPIMAGE_ARCH}"
  assert_contains "${WORK_DIR}/native-vala-package.out" "native projects: 1"
  assert_contains "${WORK_DIR}/native-vala-package.out" "shared libraries:"
  assert_contains "${WORK_DIR}/native-vala-package.out" "recursively resolved Linux ELF"
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
assert_elf_arch "${MANIFEST_DEMO_OUT}/ImageViewer.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${MANIFEST_DEMO_OUT}/ImageViewer.AppDir" "${HOST_APPIMAGE_ARCH}"
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
assert_elf_arch "${GTK_THEMES_OUT}/GtkWidgetThemes.AppImage" "${HOST_APPIMAGE_ARCH}"
assert_appdir_elf_arches "${GTK_THEMES_OUT}/GtkWidgetThemes.AppDir" "${HOST_APPIMAGE_ARCH}"
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
