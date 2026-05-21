#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: run_cross_manifest_sweep.sh /path/to/sqgi [output-dir]" >&2
  exit 2
fi

SQGI_BIN="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_BASE="${2:-${TMPDIR:-/tmp}/sqgipkg-cross-manifest-sweep}"
SQGIPKG="${ROOT_DIR}/tools/sqgipkg"
APPIMAGETOOL_CACHE="${OUT_BASE}/tool-cache"
export SQGI_SOURCE_DIR="${ROOT_DIR}"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

require_tool() {
  command -v "$1" >/dev/null 2>&1 || fail "missing required tool: $1"
}

assert_file() {
  [[ -f "$1" ]] || fail "expected file: $1"
}

assert_dir() {
  [[ -d "$1" ]] || fail "expected directory: $1"
}

assert_not_contains() {
  local file="$1"
  local needle="$2"
  if grep -Fq -- "$needle" "$file"; then
    echo "--- ${file} ---" >&2
    grep -Fn -- "$needle" "$file" >&2 || true
    fail "did not expect '$needle' in $file"
  fi
}

appimage_arch_for_machine() {
  case "$(uname -m)" in
    amd64) echo "x86_64" ;;
    arm64) echo "aarch64" ;;
    *) uname -m ;;
  esac
}

cross_arch_for_host() {
  case "$1" in
    x86_64) echo "aarch64" ;;
    aarch64) echo "x86_64" ;;
    *) fail "unsupported host AppImage architecture for cross sweep: $1" ;;
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

qemu_user_binary_name() {
  case "$1" in
    x86_64) echo "qemu-x86_64" ;;
    aarch64) echo "qemu-aarch64" ;;
    i386|i686) echo "qemu-i386" ;;
    *) echo "qemu-$1" ;;
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
  local actual
  actual="$(elf_arch "$path")"
  [[ -n "${actual}" ]] || fail "could not determine ELF architecture: $path"
  [[ "${actual}" == "${expected}" ]] ||
    fail "ELF architecture mismatch for $path: expected ${expected}, got ${actual}"
}

assert_appdir_elf_arches() {
  local appdir="$1"
  local expected="$2"
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

pe_objdump_tool() {
  if command -v x86_64-w64-mingw32-objdump >/dev/null 2>&1; then
    echo x86_64-w64-mingw32-objdump
  else
    echo objdump
  fi
}

pe_arch() {
  local path="$1"
  "$(pe_objdump_tool)" -f "$path" 2>/dev/null | awk '
    /pei-x86-64|pe-x86-64|i386:x86-64/ { print "x86_64"; exit }
    /pei-i386|pe-i386|architecture: i386/ { print "i386"; exit }
    /pei-aarch64|pe-aarch64|AArch64/ { print "aarch64"; exit }' || true
}

assert_windows_pe_arches() {
  local windir="$1"
  local checked=0
  while IFS= read -r -d '' path; do
    local actual
    actual="$(pe_arch "$path")"
    [[ -n "${actual}" ]] || fail "could not determine PE architecture: $path"
    checked=$((checked + 1))
    [[ "${actual}" == "x86_64" ]] ||
      fail "PE architecture mismatch for $path: expected x86_64, got ${actual}"
  done < <(find "${windir}" -type f \( -iname '*.exe' -o -iname '*.dll' \) -print0)
  [[ "${checked}" -gt 0 ]] || fail "no Windows PE files inspected in ${windir}"
}

run_logged() {
  local label="$1"
  shift
  local log="${OUT_BASE}/${label//[^A-Za-z0-9_.-]/_}.log"
  echo "RUN ${label}"
  if "$@" >"${log}" 2>&1; then
    pass "${label}"
  else
    echo "--- ${log} ---" >&2
    tail -n 180 "${log}" >&2 || true
    fail "${label}"
  fi
}

linux_manifest() {
  local name="$1"
  local manifest="$2"
  local package="$3"
  local smoke="$4"
  local out="${OUT_BASE}/linux-${TARGET_LINUX_ARCH}-${name}"
  run_logged "linux-${TARGET_LINUX_ARCH}-${name}" \
    "${SQGI_BIN}" "${SQGIPKG}" \
      --manifest "${manifest}" \
      --target appimage \
      --appimage-arch "${TARGET_LINUX_ARCH}" \
      --output "${out}" \
      --appimagetool-cache "${APPIMAGETOOL_CACHE}" \
      --keep-appdir \
      --smoke-test "${smoke}"

  local appdir="${out}/${package}.AppDir"
  local appimage="${out}/${package}.AppImage"
  assert_dir "${appdir}"
  assert_file "${appimage}"
  assert_elf_arch "${appimage}" "${TARGET_LINUX_ARCH}"
  assert_appdir_elf_arches "${appdir}" "${TARGET_LINUX_ARCH}"
}

windows_manifest() {
  local name="$1"
  local manifest="$2"
  local package="$3"
  local out="${OUT_BASE}/windows-${name}"
  local log="${OUT_BASE}/windows-${name}.log"
  run_logged "windows-${name}" \
    "${SQGI_BIN}" "${SQGIPKG}" \
      --manifest "${manifest}" \
      --target win-nsis \
      --output "${out}" \
      --nsis definitely-not-makensis

  assert_file "${out}/${package}.nsi"
  assert_dir "${out}/${package}"
  assert_windows_pe_arches "${out}/${package}"
  assert_not_contains "${log}" "Windows DLL dependency could not be resolved"
}

require_tool readelf
require_tool "$(pe_objdump_tool)"
require_tool cmake
require_tool ninja
require_tool meson
require_tool g-ir-scanner
require_tool g-ir-compiler
require_tool valac
require_tool x86_64-w64-mingw32-gcc
require_tool x86_64-w64-mingw32-g++
require_tool x86_64-w64-mingw32-objdump

HOST_APPIMAGE_ARCH="$(appimage_arch_for_machine)"
TARGET_LINUX_ARCH="${SQGIPKG_CROSS_LINUX_ARCH:-$(cross_arch_for_host "${HOST_APPIMAGE_ARCH}")}"
TARGET_TRIPLET="$(linux_triplet_for_appimage_arch "${TARGET_LINUX_ARCH}")"
QEMU_BIN="$(qemu_user_binary_name "${TARGET_LINUX_ARCH}")"

require_tool "${TARGET_TRIPLET}-gcc"
require_tool "${TARGET_TRIPLET}-g++"
require_tool "${TARGET_TRIPLET}-ar"
require_tool "${TARGET_TRIPLET}-strip"
require_tool "${QEMU_BIN}"

if [[ ! -r "/proc/sys/fs/binfmt_misc/${QEMU_BIN}" ]] ||
   ! grep -Fq enabled "/proc/sys/fs/binfmt_misc/${QEMU_BIN}"; then
  fail "${QEMU_BIN} binfmt registration is not enabled"
fi

rm -rf "${OUT_BASE}"
mkdir -p "${OUT_BASE}"

linux_manifest native_entry "${ROOT_DIR}/tools/sqgipkg_tests/native_entry_project/sqgipkg.json" NativeEntryProject "demo-arg"
linux_manifest native_gi "${ROOT_DIR}/tools/sqgipkg_tests/native_gi_project/sqgipkg.json" NativeGI ""
linux_manifest native_vala "${ROOT_DIR}/tools/sqgipkg_tests/native_vala_project/sqgipkg.json" NativeVala ""
linux_manifest gtk_themes "${ROOT_DIR}/tools/sqgipkg_tests/gtk_themes/sqgipkg.json" GtkWidgetThemes "--auto"
linux_manifest gtk_gst_overlay "${ROOT_DIR}/tools/sqgipkg_tests/gtk_gst_overlay_project/sqgipkg.json" GtkGstOverlay "--analyse --timeout=2"

windows_manifest native_entry "${ROOT_DIR}/tools/sqgipkg_tests/native_entry_project/sqgipkg.json" NativeEntryProject
windows_manifest native_gi "${ROOT_DIR}/tools/sqgipkg_tests/native_gi_project/sqgipkg.json" NativeGI
windows_manifest native_vala "${ROOT_DIR}/tools/sqgipkg_tests/native_vala_project/sqgipkg.json" NativeVala
windows_manifest gtk_themes "${ROOT_DIR}/tools/sqgipkg_tests/gtk_themes/sqgipkg.json" GtkWidgetThemes
windows_manifest gtk_gst_overlay "${ROOT_DIR}/tools/sqgipkg_tests/gtk_gst_overlay_project/sqgipkg.json" GtkGstOverlay

echo "sqgipkg cross manifest sweep passed (${HOST_APPIMAGE_ARCH} host -> ${TARGET_LINUX_ARCH} Linux, Windows x86_64)"
