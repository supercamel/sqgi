#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: tools/install-msys2-prereqs.sh [ucrt64|mingw64|clang64|clangarm64|mingw32]

Installs the MSYS2 packages needed to build and install SQGI natively.

Examples:
  tools/install-msys2-prereqs.sh          # use current MSYSTEM when possible
  tools/install-msys2-prereqs.sh ucrt64
  tools/install-msys2-prereqs.sh mingw64
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if ! command -v pacman >/dev/null 2>&1; then
  echo "error: pacman not found; run this from an MSYS2 shell" >&2
  exit 1
fi

target="${1:-${MSYSTEM:-ucrt64}}"
target="$(printf '%s' "$target" | tr '[:upper:]' '[:lower:]')"

case "$target" in
  ucrt64)
    package_prefix="mingw-w64-ucrt-x86_64"
    install_prefix="/ucrt64"
    shell_name="MSYS2 UCRT64"
    ;;
  mingw64)
    package_prefix="mingw-w64-x86_64"
    install_prefix="/mingw64"
    shell_name="MSYS2 MINGW64"
    ;;
  clang64)
    package_prefix="mingw-w64-clang-x86_64"
    install_prefix="/clang64"
    shell_name="MSYS2 CLANG64"
    ;;
  clangarm64)
    package_prefix="mingw-w64-clang-aarch64"
    install_prefix="/clangarm64"
    shell_name="MSYS2 CLANGARM64"
    ;;
  mingw32)
    package_prefix="mingw-w64-i686"
    install_prefix="/mingw32"
    shell_name="MSYS2 MINGW32"
    ;;
  msys)
    echo "error: native MSYS packages are not supported for SQGI; use ucrt64 or mingw64" >&2
    exit 1
    ;;
  *)
    echo "error: unknown MSYS2 target: $target" >&2
    usage >&2
    exit 1
    ;;
esac

packages=(
  git
  "${package_prefix}-cmake"
  "${package_prefix}-gcc"
  "${package_prefix}-pkgconf"
  "${package_prefix}-glib2"
  "${package_prefix}-gobject-introspection"
  "${package_prefix}-libffi"
  "${package_prefix}-cairo"
)

echo "Installing SQGI MSYS2 prerequisites for $shell_name..."
pacman -S --needed "${packages[@]}"

cat <<EOF

Done.

Build SQGI from a $shell_name shell with:

  cmake -S . -B build-${target} -G Ninja \\
    -DCMAKE_BUILD_TYPE=Release \\
    -DCMAKE_INSTALL_PREFIX=${install_prefix}
  cmake --build build-${target}
  cmake --install build-${target}

EOF
