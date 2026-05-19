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

run_appimage "${APPIMAGE}" alpha beta >"${WORK_DIR}/appimage.out"
assert_contains "${WORK_DIR}/appimage.out" "sqgipkg packaged app ran"
pass "real custom AppImage execution"

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

echo "sqgipkg tests passed"
