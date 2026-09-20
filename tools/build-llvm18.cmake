# Build the pinned C API SDK needed by SQGI using the active native toolchain.
# Usage: cmake -DLLVM_INSTALL_PREFIX=<prefix> [-DLLVM_BOOTSTRAP_DIR=<cache>]
#              -P tools/build-llvm18.cmake
cmake_minimum_required(VERSION 3.20)
if(NOT LLVM_INSTALL_PREFIX)
    message(FATAL_ERROR "Set LLVM_INSTALL_PREFIX to the toolchain's installation prefix")
endif()
if(NOT LLVM_BOOTSTRAP_DIR)
    set(LLVM_BOOTSTRAP_DIR "${CMAKE_CURRENT_LIST_DIR}/../build-llvm18")
endif()
get_filename_component(LLVM_BOOTSTRAP_DIR "${LLVM_BOOTSTRAP_DIR}" ABSOLUTE)
get_filename_component(LLVM_INSTALL_PREFIX "${LLVM_INSTALL_PREFIX}" ABSOLUTE)
set(version 18.1.8)
set(tree "llvm-project-${version}.src")
set(archive "${LLVM_BOOTSTRAP_DIR}/${tree}.tar.xz")
set(source "${LLVM_BOOTSTRAP_DIR}/${tree}")
set(build "${LLVM_BOOTSTRAP_DIR}/build")
file(MAKE_DIRECTORY "${LLVM_BOOTSTRAP_DIR}")
file(DOWNLOAD
    "https://github.com/llvm/llvm-project/releases/download/llvmorg-${version}/${tree}.tar.xz"
    "${archive}"
    EXPECTED_HASH SHA256=0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a
    TLS_VERIFY ON SHOW_PROGRESS)
if(NOT EXISTS "${source}/.sqgi-extracted")
    # Omit tests/docs and their symlinks: Windows extraction must not require
    # Developer Mode or administrator privileges.
    file(ARCHIVE_EXTRACT INPUT "${archive}" DESTINATION "${LLVM_BOOTSTRAP_DIR}"
        PATTERNS "${tree}/cmake/*" "${tree}/third-party/*"
        "${tree}/llvm/CMakeLists.txt" "${tree}/llvm/LICENSE.TXT" "${tree}/llvm/llvm.spec.in"
        "${tree}/llvm/cmake/*" "${tree}/llvm/include/*" "${tree}/llvm/lib/*"
        "${tree}/llvm/tools/*" "${tree}/llvm/projects/*" "${tree}/llvm/resources/*"
        "${tree}/llvm/utils/TableGen/*" "${tree}/llvm/utils/extract_symbols.py")
    file(WRITE "${source}/.sqgi-extracted" "${version}\n")
endif()
execute_process(COMMAND "${CMAKE_COMMAND}" -S "${source}/llvm" -B "${build}" -G Ninja
    -DCMAKE_BUILD_TYPE=Release "-DCMAKE_INSTALL_PREFIX=${LLVM_INSTALL_PREFIX}"
    -DLLVM_TARGETS_TO_BUILD=Native -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_INCLUDE_UTILS=OFF -DLLVM_INCLUDE_RUNTIMES=OFF
    -DLLVM_ENABLE_BINDINGS=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_ZSTD=OFF
    -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_LIBEDIT=OFF
    -DLLVM_ENABLE_FFI=OFF -DLLVM_ENABLE_CURL=OFF
    COMMAND_ERROR_IS_FATAL ANY)
# Only the shared library and headers are needed; omit compiler tools and the
# thousands of tests from the build and installation.
execute_process(COMMAND "${CMAKE_COMMAND}" --build "${build}" --target LLVM
    COMMAND_ERROR_IS_FATAL ANY)
foreach(component LLVM llvm-headers)
    execute_process(COMMAND "${CMAKE_COMMAND}" --install "${build}" --component "${component}"
        COMMAND_ERROR_IS_FATAL ANY)
endforeach()
