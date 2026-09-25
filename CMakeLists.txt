cmake_minimum_required(VERSION 3.16)
project(sqgi VERSION 0.1.7 LANGUAGES C CXX)
set(SQGI_VERSION "${PROJECT_VERSION}-alpha")

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(GNUInstallDirs)

option(SQGI_ENABLE_LTO "Optimize across translation units in Release builds" OFF)
if(SQGI_ENABLE_LTO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT SQGI_IPO_SUPPORTED OUTPUT SQGI_IPO_ERROR)
    if(NOT SQGI_IPO_SUPPORTED)
        message(FATAL_ERROR "SQGI LTO is unavailable: ${SQGI_IPO_ERROR}")
    endif()
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON)
endif()

set(SQGI_PGO_MODE "OFF" CACHE STRING "GCC profile mode: OFF, GENERATE or USE")
set_property(CACHE SQGI_PGO_MODE PROPERTY STRINGS OFF GENERATE USE)
set(SQGI_PGO_DIRECTORY "${CMAKE_BINARY_DIR}/profiles" CACHE PATH "GCC profile storage")
if(NOT SQGI_PGO_MODE MATCHES "^(OFF|GENERATE|USE)$")
    message(FATAL_ERROR "SQGI_PGO_MODE must be OFF, GENERATE or USE")
endif()
if(NOT SQGI_PGO_MODE STREQUAL "OFF")
    if(NOT CMAKE_C_COMPILER_ID STREQUAL "GNU" OR NOT CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        message(FATAL_ERROR "SQGI PGO currently requires GCC for C and C++")
    endif()
    if(SQGI_ENABLE_ASAN)
        message(FATAL_ERROR "Use separate builds for SQGI PGO and sanitizers")
    endif()
    if(SQGI_PGO_MODE STREQUAL "GENERATE")
        add_compile_options("-fprofile-generate=${SQGI_PGO_DIRECTORY}" -fprofile-update=atomic)
        add_link_options("-fprofile-generate=${SQGI_PGO_DIRECTORY}")
    else()
        file(GLOB_RECURSE SQGI_PGO_PROFILES "${SQGI_PGO_DIRECTORY}/*.gcda")
        if(NOT SQGI_PGO_PROFILES)
            message(FATAL_ERROR "No PGO training data in ${SQGI_PGO_DIRECTORY}; run the GENERATE build first")
        endif()
        add_compile_options("-fprofile-use=${SQGI_PGO_DIRECTORY}" -fprofile-correction -fprofile-partial-training)
    endif()
endif()

# ── Optional sanitizers (must be set before targets are created so the
# instrumentation flags propagate to libsqgi, sqgi-bin and all test binaries) ──
option(SQGI_ENABLE_ASAN "Build with AddressSanitizer + UndefinedBehaviorSanitizer" OFF)
if(SQGI_ENABLE_ASAN)
    message(STATUS "SQGI: AddressSanitizer + UBSan enabled")
    add_compile_options(-fsanitize=address,undefined -fno-omit-frame-pointer -g)
    add_link_options(-fsanitize=address,undefined)
endif()

# Checker-owned coverage is kept separate from the bundled compiler/runtime so
# its release gate measures sqgicheck behavior instead of third-party code.
option(SQGICHECK_ENABLE_COVERAGE
    "Instrument sqgicheck targets for GCC line/branch coverage" OFF)
option(SQGICHECK_ENABLE_MUTATION_TESTS
    "Build deliberate sqgicheck mutants and verify the suite kills them" OFF)
if(SQGICHECK_ENABLE_COVERAGE AND NOT CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    message(FATAL_ERROR "SQGICHECK_ENABLE_COVERAGE requires GCC/g++")
endif()

# ── Squirrel bytecode JIT and typed kernels ───────────────────────────────────
#
# LLVM powers the default JIT and typed kernel compiler. Explicitly disabling
# the bytecode JIT leaves ordinary Squirrel execution to the interpreter.
option(SQ_ENABLE_JIT "Build experimental Squirrel bytecode JIT support" ON)
option(SQGI_THREADED_DISPATCH "Use experimental GCC/Clang threaded interpreter dispatch" OFF)
option(SQGI_ENABLE_KERNELS "Build experimental typed kernel compiler" ON)
set(SQGI_KERNEL_BACKEND "LLVM" CACHE STRING "Kernel compiler backend: LLVM or NATIVE")
set_property(CACHE SQGI_KERNEL_BACKEND PROPERTY STRINGS LLVM NATIVE)
set(SQGI_BYTECODE_JIT_BACKEND "LLVM" CACHE STRING "Bytecode compiler: AUTO or LLVM")
set_property(CACHE SQGI_BYTECODE_JIT_BACKEND PROPERTY STRINGS AUTO LLVM)
if(NOT SQGI_BYTECODE_JIT_BACKEND MATCHES "^(AUTO|LLVM)$")
    message(FATAL_ERROR "SQGI_BYTECODE_JIT_BACKEND must be AUTO or LLVM")
endif()
set(SQGI_HAS_NATIVE_JIT OFF)
set(SQGI_JIT_BACKEND none)
if(SQ_ENABLE_JIT AND SQGI_BYTECODE_JIT_BACKEND STREQUAL "LLVM")
    if(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
        message(FATAL_ERROR "The LLVM bytecode backend requires a 64-bit host")
    endif()
    set(SQGI_HAS_NATIVE_JIT ON)
    set(SQGI_JIT_BACKEND llvm)
elseif(SQ_ENABLE_JIT AND (UNIX OR WIN32) AND CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|amd64)$")
    set(SQGI_HAS_NATIVE_JIT ON)
    set(SQGI_JIT_BACKEND x64)
elseif(SQ_ENABLE_JIT AND CMAKE_SYSTEM_NAME STREQUAL "Linux" AND
    CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$")
    set(SQGI_HAS_NATIVE_JIT ON)
    set(SQGI_JIT_BACKEND aarch64)
endif()
if(SQ_ENABLE_JIT)
    message(STATUS "SQGI: experimental Squirrel bytecode JIT enabled")
    if(SQGI_HAS_NATIVE_JIT)
        message(STATUS "SQGI: native Squirrel JIT backend ${SQGI_JIT_BACKEND} enabled for ${CMAKE_SYSTEM_PROCESSOR}")
    else()
        message(STATUS "SQGI: no native Squirrel JIT backend for ${CMAKE_SYSTEM_PROCESSOR}; using interpreter fallback")
    endif()
endif()

# ── Bundled Squirrel3 ─────────────────────────────────────────────────────────
set(DISABLE_STATIC ON CACHE BOOL "" FORCE)
set(SQ_DISABLE_INSTALLER ON CACHE BOOL "" FORCE)
add_subdirectory(Squirrel3)
add_library(sqgi-runtime-config INTERFACE)
if(SQGI_THREADED_DISPATCH)
    if(NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        message(FATAL_ERROR "SQGI_THREADED_DISPATCH requires GCC or Clang")
    endif()
    target_compile_definitions(sqgi-runtime-config INTERFACE SQGI_THREADED_DISPATCH)
endif()
if(SQGI_ENABLE_KERNELS)
    target_compile_definitions(sqgi-runtime-config INTERFACE SQGI_ENABLE_KERNELS)
endif()
if(SQ_ENABLE_JIT)
    # All consumers of sqgi-core's internal headers must share its layouts.
    # The independent bundled libsquirrel target above remains interpreter-only.
    target_compile_definitions(sqgi-runtime-config INTERFACE SQ_ENABLE_JIT)
endif()

# ── System Dependencies ───────────────────────────────────────────────────────
find_package(PkgConfig REQUIRED)
find_package(Threads REQUIRED)
find_program(G_IR_COMPILER_EXECUTABLE NAMES g-ir-compiler)
if((SQGICHECK_ENABLE_COVERAGE OR SQGICHECK_ENABLE_MUTATION_TESTS) AND
   NOT G_IR_COMPILER_EXECUTABLE)
    message(FATAL_ERROR
        "sqgicheck coverage/mutation tests require g-ir-compiler for their fixture typelib")
endif()

# Use imported pkg-config targets instead of hand-splicing *_LIBRARIES.
# This preserves -L search paths and any extra linker flags, which matters
# when cross-building against an MSYS2 sysroot from Linux.
pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(GOBJECT REQUIRED IMPORTED_TARGET gobject-2.0)
pkg_check_modules(GIO REQUIRED IMPORTED_TARGET gio-2.0)
pkg_check_modules(GI REQUIRED IMPORTED_TARGET gobject-introspection-1.0)
pkg_check_modules(FFI REQUIRED IMPORTED_TARGET libffi)
pkg_check_modules(CAIRO REQUIRED IMPORTED_TARGET cairo)

# ── MinGW runtime linking ─────────────────────────────────────────────────────
#
# Ubuntu/MinGW-built C++ binaries can otherwise depend on the host toolchain's
# libstdc++-6.dll/libgcc_s_seh-1.dll while sqgipkg bundles MSYS2 runtime DLLs.
# That mixture can fail at process start with missing C++ entry points such as
# std::ios_base_library_init().  Statically link the compiler runtime into SQGI
# targets by default when cross-building for Windows, while leaving normal
# GLib/GI/cairo dependencies dynamic.
option(SQGI_MINGW_STATIC_CXX_RUNTIME
    "Statically link libgcc/libstdc++ into SQGI MinGW targets" ON)
option(SQGI_WINDOWS_GUI
    "Build sqgi as a Windows GUI-subsystem executable instead of a console executable" OFF)

set(SQGI_MINGW_RUNTIME_LINK_OPTIONS)
if(MINGW AND SQGI_MINGW_STATIC_CXX_RUNTIME)
    message(STATUS "SQGI: statically linking MinGW libgcc/libstdc++ into SQGI targets")
    list(APPEND SQGI_MINGW_RUNTIME_LINK_OPTIONS
        -static-libgcc
        -static-libstdc++
    )
endif()

set(SQGI_DEPS
    sqgi-runtime-config
    PkgConfig::GLIB
    PkgConfig::GOBJECT
    PkgConfig::GIO
    PkgConfig::GI
    PkgConfig::FFI
    PkgConfig::CAIRO
    Threads::Threads
)

# ── libsqgi shared library ─────────────────────────────────────────────────────
# Isolate the C++17 locale-free numeric conversions from the C/C++11 runtime.
add_library(sqgi-json-numbers STATIC src/sqgi_json_numbers.cpp)
set_target_properties(sqgi-json-numbers PROPERTIES CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON POSITION_INDEPENDENT_CODE ON)
list(APPEND SQGI_DEPS sqgi-json-numbers)
set(LIBSQGI_SRC
    src/sqgi_vm.c
    src/sqgi_marshal.c
    src/sqgi_gi.c
    src/sqgi_gi_call_plan.c
    src/sqgi_gi_object.c
    src/sqgi_signal.c
    src/sqgi_import.c
    src/sqgi_async.c
    src/sqgi_gerror.c
    src/sqgi_subclass.c
    src/sqgi_json.cpp
    src/sqgi_cairo.c
    src/sqgi_system.c
)
if((SQGI_ENABLE_KERNELS AND SQGI_KERNEL_BACKEND STREQUAL "LLVM") OR SQGI_JIT_BACKEND STREQUAL "llvm")
    add_library(sqgi-llvm-backend INTERFACE)
    find_path(SQGI_LLVM_INCLUDE_DIR llvm-c/LLJIT.h
        HINTS "${LLVM_ROOT}/include" PATHS /usr/lib/llvm-18/include)
    find_library(SQGI_LLVM_LIBRARY NAMES LLVM-18 LLVM LLVM-C
        HINTS "${LLVM_ROOT}/lib")
    if(NOT SQGI_LLVM_INCLUDE_DIR OR NOT SQGI_LLVM_LIBRARY)
        message(FATAL_ERROR "LLVM backends require LLVM 18 development headers and library. Install llvm-18-dev or set SQGI_LLVM_INCLUDE_DIR/SQGI_LLVM_LIBRARY.")
    endif()
    file(STRINGS "${SQGI_LLVM_INCLUDE_DIR}/llvm/Config/llvm-config.h" SQGI_LLVM_MAJOR
        REGEX "^#define LLVM_VERSION_MAJOR 18$")
    if(NOT SQGI_LLVM_MAJOR)
        message(FATAL_ERROR "The LLVM backends require LLVM 18 headers and matching library")
    endif()
    target_include_directories(sqgi-llvm-backend SYSTEM INTERFACE "${SQGI_LLVM_INCLUDE_DIR}")
    target_link_libraries(sqgi-llvm-backend INTERFACE "${SQGI_LLVM_LIBRARY}" Threads::Threads)
endif()
if(SQGI_JIT_BACKEND STREQUAL "llvm")
    target_compile_definitions(sqgi-runtime-config INTERFACE SQJIT_BACKEND_LLVM)
    list(APPEND SQGI_DEPS sqgi-llvm-backend)
endif()
if(SQGI_ENABLE_KERNELS)
    add_library(sqgi-kernel-backend INTERFACE)
    if(SQGI_KERNEL_BACKEND STREQUAL "LLVM")
        target_link_libraries(sqgi-kernel-backend INTERFACE sqgi-llvm-backend)
        set(SQGI_KERNEL_ENGINE_SOURCES src/kernel/kernel.cpp src/kernel/llvm.cpp)
        if(NOT SQ_ENABLE_JIT)
            target_compile_definitions(sqgi-runtime-config INTERFACE SQGI_ENABLE_LLVM_SQUIRREL)
            list(APPEND LIBSQGI_SRC src/sqgi_llvm.cpp)
        endif()
    elseif(SQGI_KERNEL_BACKEND STREQUAL "NATIVE")
        set(SQGI_KERNEL_ENGINE_SOURCES src/kernel/kernel.cpp src/kernel/native_x64.cpp)
    else()
        message(FATAL_ERROR "SQGI_KERNEL_BACKEND must be LLVM or NATIVE")
    endif()
    list(APPEND SQGI_DEPS sqgi-kernel-backend)
    list(APPEND LIBSQGI_SRC src/sqgi_kernel.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
endif()


# ── Squirrel3 and sqstdlib sources ──
set(SQUIRREL3_SRC
    Squirrel3/squirrel/sqapi.cpp
    Squirrel3/squirrel/sqbaselib.cpp
    Squirrel3/squirrel/sqclass.cpp
    Squirrel3/squirrel/sqcompiler.cpp
    Squirrel3/squirrel/sqdebug.cpp
    Squirrel3/squirrel/sqfuncstate.cpp
    Squirrel3/squirrel/sqbytecode.cpp
    Squirrel3/squirrel/sqoptimizer.cpp
    Squirrel3/squirrel/sqlexer.cpp
    Squirrel3/squirrel/sqmem.cpp
    Squirrel3/squirrel/sqobject.cpp
    Squirrel3/squirrel/sqstate.cpp
    Squirrel3/squirrel/sqtable.cpp
    Squirrel3/squirrel/sqvm.cpp
    Squirrel3/sqstdlib/sqstdaux.cpp
    Squirrel3/sqstdlib/sqstdblob.cpp
    Squirrel3/sqstdlib/sqstdio.cpp
    Squirrel3/sqstdlib/sqstdmath.cpp
    Squirrel3/sqstdlib/sqstdrex.cpp
    Squirrel3/sqstdlib/sqstdstream.cpp
    Squirrel3/sqstdlib/sqstdstring.cpp
    Squirrel3/sqstdlib/sqstdsystem.cpp
)
if(SQ_ENABLE_JIT)
    list(APPEND SQUIRREL3_SRC
        Squirrel3/squirrel/jit/sqjit.cpp
        Squirrel3/squirrel/jit/sqjit_context.cpp
        Squirrel3/squirrel/jit/sqjit_policy.cpp
        Squirrel3/squirrel/jit/sqjit_observe.cpp
        Squirrel3/squirrel/jit/sqjit_compile.cpp
        Squirrel3/squirrel/jit/sqjit_diagnostics.cpp
        Squirrel3/squirrel/jit/sqjit_artifact.cpp
        Squirrel3/squirrel/jit/sqjit_code.cpp
        Squirrel3/squirrel/jit/sqjit_write_log.cpp
        Squirrel3/squirrel/jit/sqjit_member_plan.cpp
        Squirrel3/squirrel/jit/sqjit_intrinsics.cpp
        Squirrel3/squirrel/jit/sqjit_leaf.cpp
        Squirrel3/squirrel/jit/sqjit_object_plan.cpp
        Squirrel3/squirrel/jit/sqjit_specialize.cpp
    )
    if(SQGI_JIT_BACKEND STREQUAL "llvm")
        list(APPEND SQUIRREL3_SRC Squirrel3/squirrel/jit/sqjit_backend_llvm.cpp
            Squirrel3/squirrel/jit/sqjit_scalar_inline.cpp
            Squirrel3/squirrel/jit/sqjit_local_array.cpp
            Squirrel3/squirrel/jit/sqjit_local_graph.cpp
            Squirrel3/squirrel/jit/sqjit_numeric.cpp
            Squirrel3/squirrel/jit/sqjit_dynamic_array.cpp
            Squirrel3/squirrel/jit/sqjit_object_inline.cpp
            Squirrel3/squirrel/jit/sqjit_llvm_objects.cpp
            Squirrel3/squirrel/jit/sqjit_llvm_table_predicate.cpp)
    elseif(SQGI_JIT_BACKEND STREQUAL "x64")
        list(APPEND SQUIRREL3_SRC
            Squirrel3/squirrel/jit/sqjit_backend_x64.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_emit.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_calls.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_leaf.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_float_loops.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_memory.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_helpers.cpp)
    elseif(SQGI_JIT_BACKEND STREQUAL "aarch64")
        list(APPEND SQUIRREL3_SRC
            Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp
            Squirrel3/squirrel/jit/sqjit_backend_aarch64.cpp
        )
    else()
        list(APPEND SQUIRREL3_SRC Squirrel3/squirrel/jit/sqjit_backend_none.cpp)
    endif()
endif()

# ── SQGI core objects ─────────────────────────────────────────────────────────
#
# Build the runtime once as an OBJECT library, then reuse those objects for:
#   - libsqgi, the embeddable shared library
#   - sqgi-bin, the CLI executable
#
# sqgi-bin intentionally links the core objects directly instead of linking
# against libsqgi. That keeps the CLI self-contained with respect to SQGI itself
# (no runtime dependency on libsqgi.dll / libsqgi.so), while still linking the
# normal GLib/GI/cairo system libraries.
add_library(sqgi-core OBJECT ${LIBSQGI_SRC} ${SQUIRREL3_SRC})
set_target_properties(sqgi-core PROPERTIES
    POSITION_INDEPENDENT_CODE ON
)
target_include_directories(sqgi-core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
)
target_compile_definitions(sqgi-core PRIVATE
    SQGI_VERSION="${SQGI_VERSION}"
    SQGI_TARGET_ARCH="${CMAKE_SYSTEM_PROCESSOR}"
)
target_link_libraries(sqgi-core PUBLIC ${SQGI_DEPS})

# ── libsqgi shared library ────────────────────────────────────────────────────
add_library(sqgi SHARED $<TARGET_OBJECTS:sqgi-core>)
# The binary64 C API is incompatible with the original float32 ABI. Keep
# shared-library ABI versioning separate from the application release number.
set(SQGI_ABI_VERSION 1)
set_target_properties(sqgi PROPERTIES
    VERSION   ${SQGI_ABI_VERSION}.0.0
    SOVERSION ${SQGI_ABI_VERSION}
    LINKER_LANGUAGE CXX
)
target_include_directories(sqgi
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
)
target_link_libraries(sqgi PUBLIC ${SQGI_DEPS})
if(SQGI_MINGW_RUNTIME_LINK_OPTIONS)
    target_link_options(sqgi PRIVATE ${SQGI_MINGW_RUNTIME_LINK_OPTIONS})
endif()

# ── sqgicheck static-analysis engine and executable ─────────────────────────
#
# sqgicheck compiles source through the same bundled Squirrel compiler as the
# runtime, then abstractly interprets the resulting bytecode. Keeping the
# engine in a small static library lets the native unit tests exercise the exact
# implementation used by the installed command.
add_library(sqgicheck-core STATIC
    tools/sqgicheck/analyzer.cpp
    tools/sqgicheck/metadata.cpp
    tools/sqgicheck/project.cpp
)
target_include_directories(sqgicheck-core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/tools/sqgicheck
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
)
target_link_libraries(sqgicheck-core PUBLIC ${SQGI_DEPS})
if(SQGICHECK_ENABLE_COVERAGE)
    target_compile_options(sqgicheck-core PRIVATE
        --coverage -O0 -g -fno-exceptions -fno-inline
    )
    target_link_options(sqgicheck-core INTERFACE --coverage)
endif()

if(SQGICHECK_ENABLE_MUTATION_TESTS)
    function(add_sqgicheck_core_mutant mutant definition)
        add_library(sqgicheck-mutant-${mutant}-core STATIC
            tools/sqgicheck/analyzer.cpp
            tools/sqgicheck/metadata.cpp
            tools/sqgicheck/project.cpp
        )
        target_include_directories(sqgicheck-mutant-${mutant}-core
            PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/tools/sqgicheck
            PRIVATE
                ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
                ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
        )
        target_link_libraries(sqgicheck-mutant-${mutant}-core PUBLIC ${SQGI_DEPS})
        target_compile_definitions(sqgicheck-mutant-${mutant}-core PRIVATE
            ${definition})

        add_executable(sqgicheck-mutant-${mutant}-test
            test/cpp/test_sqgicheck.cpp
            $<TARGET_OBJECTS:sqgi-core>
        )
        if(G_IR_COMPILER_EXECUTABLE)
            add_dependencies(sqgicheck-mutant-${mutant}-test
                sqgicheck-test-typelib)
            target_compile_definitions(sqgicheck-mutant-${mutant}-test PRIVATE
                SQGICHECK_HAS_TEST_TYPELIB=1)
        endif()
        target_include_directories(sqgicheck-mutant-${mutant}-test PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
            ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
        )
        target_link_libraries(sqgicheck-mutant-${mutant}-test PRIVATE
            sqgicheck-mutant-${mutant}-core)
    endfunction()

    add_sqgicheck_core_mutant(arity SQGICHECK_MUTATE_ARITY_BOUNDARY)
    add_sqgicheck_core_mutant(merge SQGICHECK_MUTATE_STATE_MERGE)
    add_sqgicheck_core_mutant(precedence SQGICHECK_MUTATE_RESOLUTION_PRECEDENCE)
    add_sqgicheck_core_mutant(metadata SQGICHECK_MUTATE_METADATA_CATEGORY)

    add_executable(sqgicheck-mutant-exit
        tools/sqgicheck/main.cpp
        $<TARGET_OBJECTS:sqgi-core>
    )
    target_compile_definitions(sqgicheck-mutant-exit PRIVATE
        SQGI_VERSION="${SQGI_VERSION}"
        SQGICHECK_MUTATE_EXIT_STATUS)
    target_link_libraries(sqgicheck-mutant-exit PRIVATE sqgicheck-core)

    add_custom_target(sqgicheck-mutation
        COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/mutation.sh
            $<TARGET_FILE:sqgicheck-mutant-arity-test>
            $<TARGET_FILE:sqgicheck-mutant-merge-test>
            $<TARGET_FILE:sqgicheck-mutant-precedence-test>
            $<TARGET_FILE:sqgicheck-mutant-metadata-test>
            $<TARGET_FILE:sqgicheck-mutant-exit>
        DEPENDS
            sqgicheck-mutant-arity-test
            sqgicheck-mutant-merge-test
            sqgicheck-mutant-precedence-test
            sqgicheck-mutant-metadata-test
            sqgicheck-mutant-exit
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Verifying that sqgicheck tests kill all deliberate mutants"
    )
endif()

add_executable(sqgicheck-bin
    tools/sqgicheck/main.cpp
    $<TARGET_OBJECTS:sqgi-core>
)
set_target_properties(sqgicheck-bin PROPERTIES
    OUTPUT_NAME sqgicheck
)
target_link_libraries(sqgicheck-bin PRIVATE sqgicheck-core)
target_compile_definitions(sqgicheck-bin PRIVATE
    SQGI_VERSION="${SQGI_VERSION}"
)
if(SQGICHECK_ENABLE_COVERAGE)
    target_compile_options(sqgicheck-bin PRIVATE
        --coverage -O0 -g -fno-exceptions -fno-inline
    )
    target_link_options(sqgicheck-bin PRIVATE --coverage)
endif()
if(SQGI_MINGW_RUNTIME_LINK_OPTIONS)
    target_link_options(sqgicheck-bin PRIVATE ${SQGI_MINGW_RUNTIME_LINK_OPTIONS})
endif()

# ── sqgi executable ────────────────────────────────────────────────────────────
add_executable(sqgi-bin src/main.c $<TARGET_OBJECTS:sqgi-core>)
set_target_properties(sqgi-bin PROPERTIES
    OUTPUT_NAME sqgi
    LINKER_LANGUAGE CXX
)
if(WIN32 AND SQGI_WINDOWS_GUI)
    message(STATUS "SQGI: building sqgi.exe as a Windows GUI-subsystem executable")
    set_target_properties(sqgi-bin PROPERTIES WIN32_EXECUTABLE ON)
    target_compile_definitions(sqgi-bin PRIVATE SQGI_WINDOWS_GUI)
endif()
target_include_directories(sqgi-bin PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
)
target_link_libraries(sqgi-bin PRIVATE ${SQGI_DEPS})
if(SQGI_MINGW_RUNTIME_LINK_OPTIONS)
    target_link_options(sqgi-bin PRIVATE ${SQGI_MINGW_RUNTIME_LINK_OPTIONS})
endif()
target_compile_definitions(sqgi-bin PRIVATE
    SQGI_VERSION="${SQGI_VERSION}"
)

if(WIN32)
    add_executable(sqgipkg-bin src/sqgipkg_main.c)
    set_target_properties(sqgipkg-bin PROPERTIES OUTPUT_NAME sqgipkg)
    target_link_libraries(sqgipkg-bin PRIVATE ${SQGI_DEPS})
    file(RELATIVE_PATH SQGI_TOOL_SHARE_RELATIVE "${CMAKE_INSTALL_FULL_BINDIR}" "${CMAKE_INSTALL_FULL_DATADIR}/sqgi")
    target_compile_definitions(sqgipkg-bin PRIVATE SQGI_TOOL_SHARE_RELATIVE="${SQGI_TOOL_SHARE_RELATIVE}")
else()
configure_file(
    tools/sqgipkg.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/sqgipkg
    @ONLY
)
endif()

# Manifest authoring tool. GTK is loaded only when the GUI starts.
option(SQGI_BUILD_PACKAGER_GUI "Install the SQGI manifest authoring tool" ON)
if(SQGI_BUILD_PACKAGER_GUI)
    add_executable(sqgipkg-gui-bin tools/sqgipkg_gui/launcher.c)
    set_target_properties(sqgipkg-gui-bin PROPERTIES OUTPUT_NAME sqgipkg-gui)
    if(WIN32)
        set_target_properties(sqgipkg-gui-bin PROPERTIES WIN32_EXECUTABLE ON)
    endif()
    target_link_libraries(sqgipkg-gui-bin PRIVATE ${SQGI_DEPS})
    file(RELATIVE_PATH SQGI_GUI_SHARE_RELATIVE "${CMAKE_INSTALL_FULL_BINDIR}" "${CMAKE_INSTALL_FULL_DATADIR}/sqgi")
    target_compile_definitions(sqgipkg-gui-bin PRIVATE SQGI_TOOL_SHARE_RELATIVE="${SQGI_GUI_SHARE_RELATIVE}")
    install(TARGETS sqgipkg-gui-bin RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
    install(FILES tools/sqgipkg_gui/main.nut tools/sqgipkg_gui/catalog.json
        DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi/sqgipkg_gui)
    install(DIRECTORY tools/sqgipkg_gui/src DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi/sqgipkg_gui)
    if(NOT WIN32)
        install(FILES tools/sqgipkg_gui/assets/org.sqgi.ManifestStudio.desktop DESTINATION ${CMAKE_INSTALL_DATADIR}/applications)
        install(FILES tools/sqgipkg_gui/assets/org.sqgi.ManifestStudio.svg DESTINATION ${CMAKE_INSTALL_DATADIR}/icons/hicolor/scalable/apps)
    endif()
endif()

# ── Optional sanitizers ──────────────────────────────────────────────────────
# (Now declared above so flags reach all targets — kept here as a no-op
# anchor to preserve the prior file layout for diff readability.)

# Optional native baseline for the cross-runtime computational benchmarks.
add_executable(sqgi_bench_cpp_kernels EXCLUDE_FROM_ALL demo/benchmarks/cpp_jit_kernels.cpp)
set(SQGI_CPP_BENCH_OPTIONS)
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    list(APPEND SQGI_CPP_BENCH_OPTIONS -O3 -fno-fast-math -ffp-contract=off)
    if(NOT CMAKE_CROSSCOMPILING)
        list(APPEND SQGI_CPP_BENCH_OPTIONS -march=native)
    endif()
elseif(MSVC)
    list(APPEND SQGI_CPP_BENCH_OPTIONS /O2 /fp:strict)
endif()
target_compile_options(sqgi_bench_cpp_kernels PRIVATE ${SQGI_CPP_BENCH_OPTIONS})
string(JOIN " " SQGI_CPP_BENCH_FLAGS ${SQGI_CPP_BENCH_OPTIONS})
target_compile_definitions(sqgi_bench_cpp_kernels PRIVATE
    SQGI_CPP_BENCH_FLAGS="${SQGI_CPP_BENCH_FLAGS}")

# ── Tests (CTest) ────────────────────────────────────────────────────────────
enable_testing()

set(SQGI_TEST_ENV
    "LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/Squirrel3/squirrel:${CMAKE_BINARY_DIR}/Squirrel3/sqstdlib:${CMAKE_BINARY_DIR}"
    "SQGI_BIN=${CMAKE_BINARY_DIR}/sqgi"
    "ASAN_OPTIONS=detect_leaks=1:halt_on_error=1:abort_on_error=0")
if(EXISTS "${CMAKE_SOURCE_DIR}/.github/lsan.supp")
    list(APPEND SQGI_TEST_ENV
        "LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/.github/lsan.supp:print_suppressions=0")
endif()

# Under ASan, the heavy fuzz/soak tests dominate run time (json_fuzz ~6 min,
# marshal_fuzz ~75s) without finding much beyond what a single iteration
# would. Scale iteration counts down 10x — still exercises every code path,
# just with fewer samples. Override locally with `SQGI_FUZZ_SCALE=1 ctest`.
if(SQGI_ENABLE_ASAN)
    list(APPEND SQGI_TEST_ENV "SQGI_FUZZ_SCALE=10")
endif()

function(add_sqgi_nut_test test_name test_file)
    add_test(
        NAME ${test_name}
        COMMAND ${CMAKE_BINARY_DIR}/sqgi ${CMAKE_SOURCE_DIR}/test/${test_file}
    )
    set_tests_properties(${test_name} PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV}"
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    )
endfunction()

add_sqgi_nut_test(sqgi_test_glib                        test_glib.nut)
if(SQGI_ENABLE_KERNELS)
    # Keep the compiler's native tests independent of GI and the Squirrel VM.
    add_executable(sqgi_test_kernel_native test/kernel/test_kernel.cpp
        test/kernel/reference.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
    target_include_directories(sqgi_test_kernel_native PRIVATE src)
    target_link_libraries(sqgi_test_kernel_native PRIVATE sqgi-kernel-backend)
    add_executable(sqgi_kernel_benchmark EXCLUDE_FROM_ALL
        test/kernel/benchmark.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
    target_include_directories(sqgi_kernel_benchmark PRIVATE src)
    target_link_libraries(sqgi_kernel_benchmark PRIVATE sqgi-kernel-backend)
    # LLVM targets the running CPU. Give the comparison C++ loop the same
    # opportunity, while retaining separate multiply/add floating semantics.
    if(NOT CMAKE_CROSSCOMPILING AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(sqgi_kernel_benchmark PRIVATE -O3 -march=native -ffp-contract=off)
    endif()
    add_executable(sqgi_kernel_benchmark_suite EXCLUDE_FROM_ALL
        demo/benchmarks/kernels/suite.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
    target_include_directories(sqgi_kernel_benchmark_suite PRIVATE src test/kernel)
    target_link_libraries(sqgi_kernel_benchmark_suite PRIVATE sqgi-kernel-backend)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(sqgi_kernel_benchmark_suite PRIVATE -O3 -ffp-contract=off)
        if(NOT CMAKE_CROSSCOMPILING)
            target_compile_options(sqgi_kernel_benchmark_suite PRIVATE -march=native)
        endif()
    endif()
    add_executable(sqgi_kernel_call_boundary EXCLUDE_FROM_ALL
        demo/benchmarks/kernels/call_boundary.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
    target_include_directories(sqgi_kernel_call_boundary PRIVATE src)
    target_link_libraries(sqgi_kernel_call_boundary PRIVATE sqgi-kernel-backend)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(sqgi_kernel_call_boundary PRIVATE -ffp-contract=off)
    endif()
    foreach(kind workloads guard_pages generated typed prepared math calls)
        add_executable(sqgi_test_kernel_${kind} test/kernel/test_${kind}.cpp
            test/kernel/reference.cpp ${SQGI_KERNEL_ENGINE_SOURCES})
        target_include_directories(sqgi_test_kernel_${kind} PRIVATE src)
        target_link_libraries(sqgi_test_kernel_${kind} PRIVATE sqgi-kernel-backend)
        if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
            target_compile_options(sqgi_test_kernel_${kind} PRIVATE -ffp-contract=off)
        endif()
        add_test(NAME sqgi_test_kernel_${kind} COMMAND sqgi_test_kernel_${kind} "${CMAKE_SOURCE_DIR}")
        set_tests_properties(sqgi_test_kernel_${kind} PROPERTIES LABELS "kernel" SKIP_RETURN_CODE 77 TIMEOUT 120)
    endforeach()
    if(SQGI_KERNEL_BACKEND STREQUAL "LLVM")
        add_test(NAME sqgi_test_kernel_calls_noinline COMMAND sqgi_test_kernel_calls)
        set_tests_properties(sqgi_test_kernel_calls_noinline PROPERTIES
            LABELS "kernel" SKIP_RETURN_CODE 77 TIMEOUT 120 ENVIRONMENT "SQGI_KERNEL_NOINLINE=1")
    endif()
    add_test(NAME sqgi_test_kernel_native COMMAND sqgi_test_kernel_native)
    set_tests_properties(sqgi_test_kernel_native PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV}" LABELS "kernel" SKIP_RETURN_CODE 77 TIMEOUT 30)
    if(CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|amd64)$" OR
       (SQGI_KERNEL_BACKEND STREQUAL "LLVM" AND CMAKE_SYSTEM_NAME STREQUAL "Linux" AND
        CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$"))
        foreach(recurrence matrix vector math)
            add_test(NAME sqgi_demo_kernel_${recurrence}_recurrence COMMAND sqgi-bin
                "${CMAKE_SOURCE_DIR}/demo/benchmarks/kernels/${recurrence}_recurrence.nut")
            set_tests_properties(sqgi_demo_kernel_${recurrence}_recurrence PROPERTIES
                ENVIRONMENT "${SQGI_TEST_ENV}" WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                LABELS "kernel;demo" TIMEOUT 30)
        endforeach()
        foreach(demo geometry reductions particles image matrix routing histogram stencil astar typed_objects compiled_workflow math)
            add_test(NAME sqgi_demo_kernel_${demo} COMMAND sqgi-bin "${CMAKE_SOURCE_DIR}/demo/kernels/${demo}.nut")
            set_tests_properties(sqgi_demo_kernel_${demo} PROPERTIES
                ENVIRONMENT "${SQGI_TEST_ENV}" WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                LABELS "kernel;demo" TIMEOUT 30)
        endforeach()
        if(SQGI_KERNEL_BACKEND STREQUAL "LLVM" AND NOT SQ_ENABLE_JIT)
            add_sqgi_nut_test(sqgi_test_llvm_regions test_llvm_regions.nut)
            set_tests_properties(sqgi_test_llvm_regions PROPERTIES LABELS "kernel;llvm-squirrel" TIMEOUT 60)
            add_sqgi_nut_test(sqgi_test_llvm_methods test_llvm_methods.nut)
            set_tests_properties(sqgi_test_llvm_methods PROPERTIES LABELS "kernel;llvm-squirrel" TIMEOUT 60)
            add_sqgi_nut_test(sqgi_test_llvm_inline test_llvm_inline.nut)
            set_tests_properties(sqgi_test_llvm_inline PROPERTIES LABELS "kernel;llvm-squirrel" TIMEOUT 60)
            add_sqgi_nut_test(sqgi_test_llvm_scalars test_llvm_scalars.nut)
            set_tests_properties(sqgi_test_llvm_scalars PROPERTIES LABELS "kernel;llvm-squirrel" TIMEOUT 60)
            add_sqgi_nut_test(sqgi_test_llvm_squirrel test_llvm_squirrel.nut)
            set_tests_properties(sqgi_test_llvm_squirrel PROPERTIES LABELS "kernel;llvm-squirrel" TIMEOUT 60)
        endif()
        add_sqgi_nut_test(sqgi_test_kernel_small_calls test_kernel_small_calls.nut)
        set_tests_properties(sqgi_test_kernel_small_calls PROPERTIES LABELS "kernel" TIMEOUT 30)
        add_sqgi_nut_test(sqgi_test_kernel_locals test_kernel_locals.nut)
        set_tests_properties(sqgi_test_kernel_locals PROPERTIES LABELS "kernel" TIMEOUT 30)
        add_sqgi_nut_test(sqgi_test_typed_modules test_typed_modules.nut)
        set_tests_properties(sqgi_test_typed_modules PROPERTIES LABELS "kernel" TIMEOUT 30)
        add_sqgi_nut_test(sqgi_test_kernel_integration test_kernel.nut)
        set_tests_properties(sqgi_test_kernel_integration PROPERTIES LABELS "kernel" TIMEOUT 30)
    endif()
endif()
add_sqgi_nut_test(sqgi_test_gobject                     test_gobject.nut)
add_sqgi_nut_test(sqgi_test_signals                     test_signals.nut)
add_sqgi_nut_test(sqgi_test_import_nut                  test_import_nut.nut)
add_sqgi_nut_test(sqgi_test_async                       test_async.nut)
add_sqgi_nut_test(sqgi_test_async_jsstyle               test_async_jsstyle.nut)
add_sqgi_nut_test(sqgi_test_async_reentrancy            test_async_reentrancy.nut)
add_sqgi_nut_test(sqgi_test_async_stack_balance         test_async_stack_balance.nut)
add_sqgi_nut_test(sqgi_test_callback_async_lifetime     test_callback_async_lifetime.nut)
add_sqgi_nut_test(sqgi_test_numeric_arrays              test_numeric_arrays.nut)
add_sqgi_nut_test(sqgi_test_newthread                   test_newthread.nut)
add_sqgi_nut_test(sqgi_test_vget_download               test_vget_download.nut)
add_sqgi_nut_test(sqgi_test_application                 test_application.nut)
add_sqgi_nut_test(sqgi_test_application_run_regression  test_application_run_crash_regression.nut)
add_sqgi_nut_test(sqgi_test_application_command_line    test_application_command_line.nut)
add_sqgi_nut_test(sqgi_test_emit                        test_emit.nut)
add_sqgi_nut_test(sqgi_test_marshal_argcount            test_marshal_argcount.nut)
add_sqgi_nut_test(sqgi_test_gvalue                      test_gvalue.nut)
add_sqgi_nut_test(sqgi_test_gvariant                    test_gvariant.nut)
add_sqgi_nut_test(sqgi_test_unhandled_rejection         test_unhandled_rejection.nut)
add_sqgi_nut_test(sqgi_test_task_cancel                 test_task_cancel.nut)
add_sqgi_nut_test(sqgi_test_new_object                  test_new_object.nut)
add_sqgi_nut_test(sqgi_test_promise_combinators         test_promise_combinators.nut)
add_sqgi_nut_test(sqgi_test_stack_balance               test_stack_balance.nut)
add_sqgi_nut_test(sqgi_test_gerror                      test_gerror.nut)
add_sqgi_nut_test(sqgi_test_gio_async                   test_gio_async.nut)
add_sqgi_nut_test(sqgi_test_subclass                    test_subclass.nut)
add_sqgi_nut_test(sqgi_test_marshal_fuzz                test_marshal_fuzz.nut)
set_tests_properties(sqgi_test_marshal_fuzz PROPERTIES TIMEOUT 300 LABELS "slow;fuzz")
add_sqgi_nut_test(sqgi_test_soak                        test_soak.nut)
set_tests_properties(sqgi_test_soak PROPERTIES LABELS "slow")
foreach(mode simd scalar)
    add_executable(sqgi_test_json_fast_${mode} test/cpp/test_json_fast.cpp)
    target_include_directories(sqgi_test_json_fast_${mode} PRIVATE src)
    target_link_libraries(sqgi_test_json_fast_${mode} PRIVATE sqgi-json-numbers)
    if(mode STREQUAL "scalar")
        target_compile_definitions(sqgi_test_json_fast_${mode} PRIVATE SQGI_JSON_SCALAR)
    endif()
    add_test(NAME sqgi_test_json_fast_${mode} COMMAND sqgi_test_json_fast_${mode})
    set_tests_properties(sqgi_test_json_fast_${mode} PROPERTIES TIMEOUT 120)
endforeach()
add_sqgi_nut_test(sqgi_test_json                        test_json.nut)
add_sqgi_nut_test(sqgi_test_json_fast_paths             test_json_fast.nut)
add_sqgi_nut_test(sqgi_test_json_instance_cycles        test_json_instance_cycles.nut)
add_sqgi_nut_test(sqgi_test_json_fuzz                   test_json_fuzz.nut)
set_tests_properties(sqgi_test_json_fuzz PROPERTIES TIMEOUT 600 LABELS "slow;fuzz")
add_sqgi_nut_test(sqgi_test_gvariant_classes            test_gvariant_classes.nut)
add_sqgi_nut_test(sqgi_test_subclass_errors             test_subclass_errors.nut)
add_sqgi_nut_test(sqgi_test_signals_extended            test_signals_extended.nut)
add_sqgi_nut_test(sqgi_test_signal_async_connect        test_signal_async_connect.nut)
add_sqgi_nut_test(sqgi_test_edge_cases                  test_edge_cases.nut)
add_sqgi_nut_test(sqgi_test_coverage_extras             test_coverage_extras.nut)
add_sqgi_nut_test(sqgi_test_gvalue_types                test_gvalue_types.nut)
add_sqgi_nut_test(sqgi_test_subclass_vfuncs             test_subclass_vfuncs.nut)
add_sqgi_nut_test(sqgi_test_gi_multi_out                test_gi_multi_out.nut)
add_sqgi_nut_test(sqgi_test_bytes_converters            test_bytes_converters.nut)
add_sqgi_nut_test(sqgi_test_cairo                       test_cairo.nut)
set_tests_properties(sqgi_test_cairo PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=0")
add_sqgi_nut_test(sqgi_test_cairo_runtime               test_cairo.nut)
set_tests_properties(sqgi_test_cairo_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1")
add_sqgi_nut_test(sqgi_test_cairo_pixels                test_cairo_pixels.nut)
find_program(SQGI_XVFB_RUN NAMES xvfb-run)
if(SQGI_XVFB_RUN)
    add_test(NAME sqgi_test_cairo_gtk
        COMMAND ${SQGI_XVFB_RUN} -a $<TARGET_FILE:sqgi-bin>
                ${CMAKE_SOURCE_DIR}/test/test_cairo_gtk.nut)
    set_tests_properties(sqgi_test_cairo_gtk PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV};GSK_RENDERER=cairo;LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/test/cairo_gtk_lsan.supp:print_suppressions=0" TIMEOUT 15
        FAIL_REGULAR_EXPRESSION "AN ERROR HAS OCCURRED")
endif()
set_tests_properties(sqgi_test_cairo sqgi_test_cairo_runtime sqgi_test_cairo_pixels PROPERTIES
    TIMEOUT 30 FAIL_REGULAR_EXPRESSION "AN ERROR HAS OCCURRED")
add_sqgi_nut_test(sqgi_test_boxed_record_constructor    test_boxed_record_constructor.nut)
add_sqgi_nut_test(sqgi_test_math_extended               test_math_extended.nut)
add_sqgi_nut_test(sqgi_test_system_module               test_system_module.nut)
add_sqgi_nut_test(sqgi_test_jit_math                    test_jit_math.nut)
add_sqgi_nut_test(sqgi_test_jit_loop_regressions        test_jit_loop_regressions.nut)
set_tests_properties(sqgi_test_jit_loop_regressions PROPERTIES
    LABELS "jit"
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1"
    PASS_REGULAR_EXPRESSION "test_jit_loop_regressions.nut passed")
if(SQGI_JIT_BACKEND STREQUAL "aarch64")
    add_sqgi_nut_test(sqgi_test_jit_leaf_loop_native test_jit_loop_regressions.nut)
    set_tests_properties(sqgi_test_jit_leaf_loop_native PROPERTIES
        LABELS "jit"
        ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=1"
        FAIL_REGULAR_EXPRESSION "\\[FAIL\\];AN ERROR HAS OCCURRED"
        PASS_REGULAR_EXPRESSION "\\[sqjit\\] executed native loop in proto 'branch_join_loop'")
endif()
add_sqgi_nut_test(sqgi_test_jit_math_runtime            test_jit_math.nut)
add_sqgi_nut_test(sqgi_test_jit_fastpath                test_jit_fastpath.nut)
add_sqgi_nut_test(sqgi_test_jit_fastpath_runtime        test_jit_fastpath.nut)
add_sqgi_nut_test(sqgi_test_jit_correctness             test_jit_correctness.nut)
add_sqgi_nut_test(sqgi_test_jit_correctness_runtime     test_jit_correctness.nut)
add_sqgi_nut_test(sqgi_test_integer_edges test_integer_edges.nut)
add_sqgi_nut_test(sqgi_test_table_member_cache test_table_member_cache.nut)
set_tests_properties(sqgi_test_table_member_cache PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=0")
add_sqgi_nut_test(sqgi_test_table_member_cache_runtime test_table_member_cache.nut)
set_tests_properties(sqgi_test_table_member_cache_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1")
set_tests_properties(sqgi_test_table_member_cache sqgi_test_table_member_cache_runtime PROPERTIES
    PASS_REGULAR_EXPRESSION "table member cache tests passed"
    FAIL_REGULAR_EXPRESSION "AN ERROR HAS OCCURRED"
    TIMEOUT 30)
add_sqgi_nut_test(sqgi_test_interpreter_dispatch test_interpreter_dispatch.nut)
set_tests_properties(sqgi_test_interpreter_dispatch PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=0"
    PASS_REGULAR_EXPRESSION "interpreter dispatch tests passed")
add_sqgi_nut_test(sqgi_test_interpreter_dispatch_runtime test_interpreter_dispatch.nut)
set_tests_properties(sqgi_test_interpreter_dispatch_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1"
    PASS_REGULAR_EXPRESSION "interpreter dispatch tests passed")
set_tests_properties(sqgi_test_integer_edges PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=0"
    PASS_REGULAR_EXPRESSION "integer edge tests passed")
add_sqgi_nut_test(sqgi_test_integer_edges_runtime test_integer_edges.nut)
set_tests_properties(sqgi_test_integer_edges_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1"
    PASS_REGULAR_EXPRESSION "integer edge tests passed")
add_sqgi_nut_test(sqgi_test_jit_perf_correctness        test_jit_perf_correctness.nut)
add_sqgi_nut_test(sqgi_test_jit_perf_correctness_runtime test_jit_perf_correctness.nut)
set(JIT_TESTS
    sqgi_test_jit_math
    sqgi_test_jit_math_runtime
    sqgi_test_jit_fastpath
    sqgi_test_jit_fastpath_runtime
    sqgi_test_jit_correctness
    sqgi_test_jit_correctness_runtime
    sqgi_test_jit_perf_correctness
    sqgi_test_jit_perf_correctness_runtime)
if(SQGI_HAS_NATIVE_JIT)
    add_sqgi_nut_test(sqgi_test_jit_native_runtime      test_jit_fastpath.nut)
    list(APPEND JIT_TESTS sqgi_test_jit_native_runtime)
endif()
set_tests_properties(${JIT_TESTS} PROPERTIES
    LABELS "jit;math"
)
set_tests_properties(sqgi_test_jit_math_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=0"
)
set_tests_properties(sqgi_test_jit_fastpath_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=1"
)
set_tests_properties(sqgi_test_jit_correctness_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=0"
)
set_tests_properties(sqgi_test_jit_perf_correctness_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=0"
)
if(SQGI_HAS_NATIVE_JIT)
    set_tests_properties(sqgi_test_jit_fastpath_runtime PROPERTIES
        PASS_REGULAR_EXPRESSION "\\[sqjit\\] executed native proto 'numeric_variant_kernel'"
    )
endif()
if(SQGI_HAS_NATIVE_JIT)
    set_tests_properties(sqgi_test_jit_native_runtime PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1;SQGI_JIT_TRACE=1"
        PASS_REGULAR_EXPRESSION "\\[sqjit\\] executed native proto 'numeric_variant_kernel'"
    )
endif()
# Cover error/exit-code paths in main.c
add_test(
    NAME sqgi_test_cli_nonexistent_file
    COMMAND ${CMAKE_BINARY_DIR}/sqgi /nonexistent/script.nut
)
set_tests_properties(sqgi_test_cli_nonexistent_file PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WILL_FAIL TRUE
)

add_test(
    NAME sqgi_test_cli_dash_e_syntax_error
    COMMAND ${CMAKE_BINARY_DIR}/sqgi -e "this is not valid squirrel @"
)
set_tests_properties(sqgi_test_cli_dash_e_syntax_error PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WILL_FAIL TRUE
)

add_test(
    NAME sqgi_test_cli_gerror_report
    COMMAND bash ${CMAKE_SOURCE_DIR}/test/test_cli_gerror_report.sh ${CMAKE_BINARY_DIR}/sqgi
)
set_tests_properties(sqgi_test_cli_gerror_report PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)

add_test(
    NAME sqgi_test_shebang
    COMMAND bash ${CMAKE_SOURCE_DIR}/test/test_shebang.sh ${CMAKE_BINARY_DIR}/sqgi
)
set_tests_properties(sqgi_test_shebang PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)

find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_Interpreter_FOUND)
    if(SQGI_BUILD_PACKAGER_GUI)
        add_test(NAME sqgi_test_manifest_contracts
            COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/tools/sqgipkg_gui/tests/test_contracts.py $<TARGET_FILE:sqgi-bin>)
        add_test(NAME sqgi_test_manifest_delivery
            COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/tools/sqgipkg_gui/tests/test_delivery.py $<TARGET_FILE:sqgi-bin>)
        set_tests_properties(sqgi_test_manifest_contracts sqgi_test_manifest_delivery PROPERTIES
            LABELS "packaging;manifest" TIMEOUT 90 ENVIRONMENT "${SQGI_TEST_ENV}")
        # Installation writes CMake's install manifest; serialize with other install tests.
        set_tests_properties(sqgi_test_manifest_delivery PROPERTIES RUN_SERIAL TRUE)
        if(NOT WIN32)
            find_program(SQGI_XVFB_RUN xvfb-run)
            if(SQGI_XVFB_RUN)
                add_test(NAME sqgi_test_manifest_gtk
                    COMMAND ${SQGI_XVFB_RUN} -a ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/tools/sqgipkg_gui/tests/test_gtk.py $<TARGET_FILE:sqgi-bin>)
                set_tests_properties(sqgi_test_manifest_gtk PROPERTIES
                    LABELS "packaging;manifest;gtk" TIMEOUT 45 ENVIRONMENT "${SQGI_TEST_ENV}")
            endif()
        endif()
    endif()
    add_test(NAME sqgi_test_sqgipkg_ergonomics
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/tools/sqgipkg_tests/test_ergonomics.py $<TARGET_FILE:sqgi-bin>)
    if(SQGI_ENABLE_KERNELS)
        add_test(NAME sqgi_test_kernel_packaging
            COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/tools/sqgipkg_tests/test_kernel_packaging.py $<TARGET_FILE:sqgi-bin>)
        set_tests_properties(sqgi_test_kernel_packaging PROPERTIES LABELS "kernels;packaging" TIMEOUT 180)
    endif()
    if(SQGI_HAS_NATIVE_JIT)
        add_test(NAME sqgi_test_jit_defaults
            COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/test/test_jit_defaults.py $<TARGET_FILE:sqgi-bin>)
        set_tests_properties(sqgi_test_jit_defaults PROPERTIES LABELS "jit" TIMEOUT 60)
    endif()
endif()

add_test(
    NAME sqgi_test_sqgipkg
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgipkg_tests/run_tests.sh ${CMAKE_BINARY_DIR}/sqgi
)
set_tests_properties(sqgi_test_sqgipkg PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    # The fixtures repeatedly bundle LLVM and build a fresh runtime recipe.
    TIMEOUT 900
)

# sqgicheck has deterministic engine/unit coverage plus an end-to-end CLI
# suite for argument parsing, exit status, recursive imports, and install.
set(SQGICHECK_TEST_TYPELIB_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/sqgicheck-test-typelib)
set(SQGICHECK_TEST_TYPELIB
    ${SQGICHECK_TEST_TYPELIB_DIR}/SqgicheckTest-1.0.typelib)
# GI uses the native search-path separator. Escape semicolons so CTest keeps
# the entire Windows path list in one ENVIRONMENT entry.
set(SQGICHECK_TEST_TYPELIB_PATH "${SQGICHECK_TEST_TYPELIB_DIR}")
if(NOT "$ENV{GI_TYPELIB_PATH}" STREQUAL "")
    if(WIN32)
        string(APPEND SQGICHECK_TEST_TYPELIB_PATH ";$ENV{GI_TYPELIB_PATH}")
    else()
        string(APPEND SQGICHECK_TEST_TYPELIB_PATH ":$ENV{GI_TYPELIB_PATH}")
    endif()
endif()
string(REPLACE ";" "\\;" SQGICHECK_TEST_TYPELIB_PATH
    "${SQGICHECK_TEST_TYPELIB_PATH}")
if(G_IR_COMPILER_EXECUTABLE)
    add_custom_command(
        OUTPUT ${SQGICHECK_TEST_TYPELIB}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${SQGICHECK_TEST_TYPELIB_DIR}
        COMMAND ${G_IR_COMPILER_EXECUTABLE}
                ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/SqgicheckTest-1.0.gir
                --output=${SQGICHECK_TEST_TYPELIB}
        DEPENDS tools/sqgicheck_tests/SqgicheckTest-1.0.gir
        VERBATIM
    )
    add_custom_target(sqgicheck-test-typelib DEPENDS ${SQGICHECK_TEST_TYPELIB})
endif()

add_executable(sqgi_test_cpp_sqgicheck
    test/cpp/test_sqgicheck.cpp
    $<TARGET_OBJECTS:sqgi-core>
)
if(G_IR_COMPILER_EXECUTABLE)
    add_dependencies(sqgi_test_cpp_sqgicheck sqgicheck-test-typelib)
    target_compile_definitions(sqgi_test_cpp_sqgicheck PRIVATE
        SQGICHECK_HAS_TEST_TYPELIB=1)
endif()
target_link_libraries(sqgi_test_cpp_sqgicheck PRIVATE sqgicheck-core)
target_include_directories(sqgi_test_cpp_sqgicheck PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
    ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
)
if(SQGICHECK_ENABLE_COVERAGE)
    target_compile_options(sqgi_test_cpp_sqgicheck PRIVATE
        --coverage -O0 -g -fno-exceptions -fno-inline
    )
    target_link_options(sqgi_test_cpp_sqgicheck PRIVATE --coverage)
endif()
add_test(NAME sqgi_test_cpp_sqgicheck COMMAND sqgi_test_cpp_sqgicheck)
set_tests_properties(sqgi_test_cpp_sqgicheck PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};GI_TYPELIB_PATH=${SQGICHECK_TEST_TYPELIB_PATH};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    TIMEOUT 30
)

add_test(
    NAME sqgi_test_sqgicheck_cli
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/run_tests.sh
            ${CMAKE_BINARY_DIR}/sqgicheck
)
set_tests_properties(sqgi_test_sqgicheck_cli PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};GI_TYPELIB_PATH=${SQGICHECK_TEST_TYPELIB_PATH};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    TIMEOUT 60
)

add_test(
    NAME sqgi_test_sqgicheck_corpus
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/corpus.sh
            ${CMAKE_BINARY_DIR}/sqgicheck ${CMAKE_SOURCE_DIR}
)
set_tests_properties(sqgi_test_sqgicheck_corpus PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    TIMEOUT 60
)

add_test(
    NAME sqgi_test_sqgicheck_install
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/install.sh
            ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR}
)
set_tests_properties(sqgi_test_sqgicheck_install PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    RUN_SERIAL TRUE
    TIMEOUT 60
)

if(SQGICHECK_ENABLE_COVERAGE)
    add_custom_target(sqgicheck-coverage
        COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/coverage.sh
                ${CMAKE_BINARY_DIR}
        DEPENDS sqgi sqgi-bin sqgicheck-bin sqgi_test_cpp_sqgicheck
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Running sqgicheck tests and enforcing coverage thresholds"
    )
endif()

# ── In-tree C tests (test/c/) ────────────────────────────────────────────────
# These exercise internal libsqgi paths that pure-Squirrel tests cannot reach,
# such as cross-thread signal marshalling. Each test is a standalone C binary
# linked against libsqgi; they are NOT installed and are NOT part of the public
# API surface — they live only in the source tree.
function(add_sqgi_c_test test_name source_file)
    add_executable(${test_name} ${source_file})
    target_link_libraries(${test_name} PRIVATE sqgi)
    target_include_directories(${test_name} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/include
        ${CMAKE_CURRENT_SOURCE_DIR}/Squirrel3/squirrel
    )
    add_test(NAME ${test_name} COMMAND ${test_name} ${ARGN})
    set_tests_properties(${test_name} PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV}"
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        TIMEOUT 30
    )
endfunction()

add_sqgi_c_test(sqgi_test_c_signal_crossthread test/c/test_signal_crossthread.c)
add_sqgi_c_test(sqgi_test_c_signal_crossthread_sync test/c/test_signal_crossthread_sync.c)
add_sqgi_c_test(sqgi_test_c_signal_vm_closing test/c/test_signal_vm_closing.c)
add_sqgi_c_test(sqgi_test_c_gvalue_branches test/c/test_gvalue_branches.c)
pkg_check_modules(CAIRO_GOBJECT REQUIRED IMPORTED_TARGET cairo-gobject)
add_sqgi_c_test(sqgi_test_c_cairo test/c/test_cairo.c)
target_link_libraries(sqgi_test_c_cairo PRIVATE PkgConfig::CAIRO_GOBJECT)
add_sqgi_c_test(sqgi_test_c_gi_call_plan test/c/test_gi_call_plan.c)
add_sqgi_c_test(sqgi_test_c_list_ownership test/c/test_list_ownership.c)
add_sqgi_c_test(sqgi_test_c_squirrel_core_hardening test/c/test_squirrel_core_hardening.c)
add_sqgi_c_test(sqgi_test_c_numeric64 test/c/test_numeric64.c)
add_sqgi_c_test(sqgi_test_cpp_sqvm_hotpaths test/cpp/test_sqvm_hotpaths.cpp)
add_test(NAME sqgi_test_c_numeric64_runtime COMMAND sqgi_test_c_numeric64)
set_tests_properties(sqgi_test_c_numeric64_runtime PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    LABELS "jit;math")
add_sqgi_c_test(sqgi_test_cpp_sqvector test/cpp/test_sqvector.cpp)
add_sqgi_c_test(sqgi_test_cpp_sqbytecode test/cpp/test_sqbytecode.cpp)
add_sqgi_c_test(sqgi_test_cpp_sqoptimizer test/cpp/test_sqoptimizer.cpp)
add_sqgi_c_test(sqgi_test_cpp_sqmembercache test/cpp/test_sqmembercache.cpp)
if(SQGI_ENABLE_KERNELS AND SQGI_KERNEL_BACKEND STREQUAL "LLVM" AND NOT SQ_ENABLE_JIT)
    add_sqgi_c_test(sqgi_test_cpp_llvm_method_environment test/cpp/test_llvm_method_environment.cpp)
    set_tests_properties(sqgi_test_cpp_llvm_method_environment PROPERTIES LABELS "kernel;llvm-squirrel")
endif()
add_sqgi_c_test(sqgi_test_cpp_sqnativeleaf test/cpp/test_sqnativeleaf.cpp)
set_tests_properties(sqgi_test_cpp_sqnativeleaf PROPERTIES LABELS "kernel;runtime")
add_sqgi_c_test(sqgi_test_c_import_cache test/c/test_import_cache.c)
add_sqgi_c_test(sqgi_test_c_vm_lifecycle test/c/test_vm_lifecycle.c recreate)
add_test(NAME sqgi_test_c_vm_lifecycle_pending COMMAND sqgi_test_c_vm_lifecycle pending)
set_tests_properties(sqgi_test_c_vm_lifecycle_pending PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}" TIMEOUT 30)
add_test(NAME sqgi_test_c_vm_lifecycle_subclass COMMAND sqgi_test_c_vm_lifecycle subclass)
set_tests_properties(sqgi_test_c_vm_lifecycle_subclass PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}" TIMEOUT 30)
if(SQ_ENABLE_JIT)
    # Both encoders are pure byte generation, and run on every host architecture.
    foreach(arch x64 aarch64)
        add_executable(sqgi_test_cpp_sqjit_${arch}_emit
            test/cpp/test_sqjit_${arch}_emit.cpp
            Squirrel3/squirrel/jit/sqjit_backend_${arch}_emit.cpp)
        target_include_directories(sqgi_test_cpp_sqjit_${arch}_emit PRIVATE
            Squirrel3/include Squirrel3/squirrel)
        add_test(NAME sqgi_test_cpp_sqjit_${arch}_emit
            COMMAND sqgi_test_cpp_sqjit_${arch}_emit)
        set_tests_properties(sqgi_test_cpp_sqjit_${arch}_emit PROPERTIES LABELS "jit")
    endforeach()
    add_executable(sqgi_test_cpp_sqjit_x64_win64_emit
        test/cpp/test_sqjit_x64_emit.cpp
        Squirrel3/squirrel/jit/sqjit_backend_x64_emit.cpp)
    target_include_directories(sqgi_test_cpp_sqjit_x64_win64_emit PRIVATE
        Squirrel3/include Squirrel3/squirrel)
    target_compile_definitions(sqgi_test_cpp_sqjit_x64_win64_emit PRIVATE SQJIT_ABI_WIN64=1)
    add_test(NAME sqgi_test_cpp_sqjit_x64_win64_emit COMMAND sqgi_test_cpp_sqjit_x64_win64_emit)
    set_tests_properties(sqgi_test_cpp_sqjit_x64_win64_emit PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_contracts test/cpp/test_sqjit_contracts.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_contracts PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_side_exit test/cpp/test_sqjit_side_exit.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_side_exit PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_values test/cpp/test_sqjit_values.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_values PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_memory test/cpp/test_sqjit_memory.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_memory PROPERTIES LABELS "jit")
    if(SQGI_JIT_BACKEND STREQUAL "llvm")
        add_executable(sqgi_bench_bytecode_jit test/cpp/bench_sqjit_compile.cpp $<TARGET_OBJECTS:sqgi-core>)
        target_link_libraries(sqgi_bench_bytecode_jit PRIVATE ${SQGI_DEPS})
        target_include_directories(sqgi_bench_bytecode_jit PRIVATE Squirrel3/include Squirrel3/squirrel)
        add_sqgi_c_test(sqgi_test_cpp_sqjit_llvm test/cpp/test_sqjit_llvm.cpp)
        set_tests_properties(sqgi_test_cpp_sqjit_llvm PROPERTIES LABELS "jit;llvm")
    endif()
    add_sqgi_c_test(sqgi_test_cpp_sqjit_leaf test/cpp/test_sqjit_leaf.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_leaf PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_arithmetic test/cpp/test_sqjit_arithmetic.cpp)
    if(SQGI_JIT_BACKEND STREQUAL "llvm" AND CMAKE_SYSTEM_NAME STREQUAL "Linux" AND
       CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$")
        # This test executes AArch64 encoder output even with the LLVM backend.
        target_sources(sqgi_test_cpp_sqjit_arithmetic PRIVATE
            Squirrel3/squirrel/jit/sqjit_backend_aarch64_emit.cpp)
    endif()
    set_tests_properties(sqgi_test_cpp_sqjit_arithmetic PROPERTIES LABELS "jit;math")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_virtual_array test/cpp/test_sqjit_virtual_array.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_virtual_array PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_objects test/cpp/test_sqjit_objects.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_objects PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_object_plan test/cpp/test_sqjit_object_plan.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_object_plan PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_write_log test/cpp/test_sqjit_write_log.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_write_log PROPERTIES LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_member_plan test/cpp/test_sqjit_member_plan.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_member_plan PROPERTIES LABELS "jit")
    add_test(NAME sqgi_test_cpp_sqjit_release_order
        COMMAND sqgi_test_cpp_sqjit_member_plan --release-order-only)
    set_tests_properties(sqgi_test_cpp_sqjit_release_order PROPERTIES
        ENVIRONMENT "${SQGI_TEST_ENV}" WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" LABELS "jit")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_float_cache test/cpp/test_sqjit_float_cache.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_float_cache PROPERTIES LABELS "jit;math")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_intrinsics test/cpp/test_sqjit_intrinsics.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_intrinsics PROPERTIES LABELS "jit;math")
endif()
if(SQ_ENABLE_JIT AND CMAKE_SYSTEM_NAME STREQUAL "Linux" AND
    CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$")
    add_sqgi_c_test(sqgi_test_cpp_sqjit_aarch64_backend_invalid
        test/cpp/test_sqjit_aarch64_backend_invalid.cpp)
    set_tests_properties(sqgi_test_cpp_sqjit_aarch64_backend_invalid PROPERTIES LABELS "jit")
endif()

# Cover the -e / dobuffer path (sqgi_vm_dobuffer)
add_test(
    NAME sqgi_test_cli_dash_e
    COMMAND ${CMAKE_BINARY_DIR}/sqgi -e "print(\"cli-eval=\" + (40+2))"
)
set_tests_properties(sqgi_test_cli_dash_e PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    PASS_REGULAR_EXPRESSION "cli-eval=42"
)

add_custom_target(check
    COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure
    DEPENDS sqgi-bin sqgicheck-bin sqgi_test_cpp_sqgicheck
    COMMENT "Running SQGI test suite"
)

# Editor tools are optional: no Node.js dependency is added to the runtime.
find_program(SQGI_VIM_EXECUTABLE NAMES vim)
if(SQGI_VIM_EXECUTABLE)
    add_test(NAME sqgi_test_vim
        COMMAND ${SQGI_VIM_EXECUTABLE} -Nu NONE -i NONE -n -es -S ${CMAKE_SOURCE_DIR}/test/editor/test_vim.vim)
    set_tests_properties(sqgi_test_vim PROPERTIES LABELS "editor" TIMEOUT 30)
endif()

find_program(SQGI_NODE_EXECUTABLE NAMES node nodejs)
if(SQGI_NODE_EXECUTABLE)
    add_test(NAME sqgi_test_formatter
        COMMAND ${SQGI_NODE_EXECUTABLE} --test ${CMAKE_SOURCE_DIR}/editors/vscode/test/formatter.test.js)
    set_tests_properties(sqgi_test_formatter PROPERTIES LABELS "editor" TIMEOUT 30)
endif()

# ── Install ───────────────────────────────────────────────────────────────────
# Public C headers consumed by external embedders. The vm header is the
# canonical entry point; the marshal/async/signal/object headers are exposed
# as a public surface so out-of-tree extensions can use the same helpers.
set(SQGI_PUBLIC_HEADERS
    Squirrel3/include/squirrel.h
    Squirrel3/include/sqconfig.h
    Squirrel3/include/sqstdaux.h
    Squirrel3/include/sqstdio.h
    Squirrel3/include/sqstdmath.h
    Squirrel3/include/sqstdstring.h
    Squirrel3/include/sqstdblob.h
    Squirrel3/include/sqstdsystem.h
    src/sqgi_vm.h
    src/sqgi_marshal.h
    src/sqgi_async.h
    src/sqgi_signal.h
    src/sqgi_gi.h
    src/sqgi_gi_object.h
    src/sqgi_import.h
    src/sqgi_gerror.h
    src/sqgi_subclass.h
    src/sqgi_json.h
)

install(TARGETS sqgi
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(TARGETS sqgi-bin
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(TARGETS sqgicheck-bin
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(WIN32)
    install(TARGETS sqgipkg-bin RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
else()
install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/sqgipkg
    DESTINATION ${CMAKE_INSTALL_BINDIR}
)
endif()

install(PROGRAMS tools/sqgipkg
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi
    RENAME sqgipkg.nut
)

install(DIRECTORY tools/sqgipkg_lib
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi
)

install(FILES tools/sqgipkg.schema.json DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi)

install(DIRECTORY tools/sqgipkg_templates
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi
)

install(FILES ${SQGI_PUBLIC_HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/sqgi
)

# pkg-config file
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/sqgi.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/sqgi.pc
    @ONLY
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/sqgi.pc
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

# Standalone formatter and GtkSourceView 4/5 language definitions.
configure_file(tools/sqgifmt.in ${CMAKE_CURRENT_BINARY_DIR}/sqgifmt @ONLY)
install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/sqgifmt DESTINATION ${CMAKE_INSTALL_BINDIR})
if(WIN32)
    install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/sqgifmt DESTINATION ${CMAKE_INSTALL_BINDIR} RENAME sqgifmt.js)
endif()
install(FILES editors/vscode/src/formatter.js editors/vscode/src/cli.js
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi/editor)
install(FILES editors/gtksourceview/format.nut DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi/editor)
foreach(version 4 5)
    install(FILES editors/gtksourceview/sqgi-squirrel.lang editors/gtksourceview/sqgi-kernel.lang
        DESTINATION ${CMAKE_INSTALL_DATADIR}/gtksourceview-${version}/language-specs)
endforeach()

# Native Vim package; custom prefixes may need to be added to 'packpath'.
install(DIRECTORY editors/vim/
    DESTINATION ${CMAKE_INSTALL_DATADIR}/vim/vimfiles/pack/sqgi/start/sqgi)
