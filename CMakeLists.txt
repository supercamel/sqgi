cmake_minimum_required(VERSION 3.16)
project(sqgi VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(GNUInstallDirs)

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

# ── Optional Squirrel bytecode JIT ────────────────────────────────────────────
#
# The JIT is experimental and defaults off. When disabled, no JIT sources are
# compiled and the interpreter remains the only execution engine.
option(SQ_ENABLE_JIT "Build experimental Squirrel bytecode JIT support" OFF)
set(SQGI_HAS_NATIVE_JIT OFF)
set(SQGI_JIT_BACKEND none)
if(SQ_ENABLE_JIT AND (UNIX OR WIN32) AND CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|amd64)$")
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
        message(STATUS "SQGI: native Squirrel JIT backend enabled for ${CMAKE_SYSTEM_PROCESSOR}")
    else()
        message(STATUS "SQGI: no native Squirrel JIT backend for ${CMAKE_SYSTEM_PROCESSOR}; using interpreter fallback")
    endif()
endif()

# ── Bundled Squirrel3 ─────────────────────────────────────────────────────────
set(DISABLE_STATIC ON CACHE BOOL "" FORCE)
set(SQ_DISABLE_INSTALLER ON CACHE BOOL "" FORCE)
add_subdirectory(Squirrel3)
add_library(sqgi-runtime-config INTERFACE)
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
set(LIBSQGI_SRC
    src/sqgi_vm.c
    src/sqgi_marshal.c
    src/sqgi_gi.c
    src/sqgi_gi_object.c
    src/sqgi_signal.c
    src/sqgi_import.c
    src/sqgi_async.c
    src/sqgi_gerror.c
    src/sqgi_subclass.c
    src/sqgi_json.c
    src/sqgi_cairo.c
    src/sqgi_system.c
)


# ── Squirrel3 and sqstdlib sources ──
set(SQUIRREL3_SRC
    Squirrel3/squirrel/sqapi.cpp
    Squirrel3/squirrel/sqbaselib.cpp
    Squirrel3/squirrel/sqclass.cpp
    Squirrel3/squirrel/sqcompiler.cpp
    Squirrel3/squirrel/sqdebug.cpp
    Squirrel3/squirrel/sqfuncstate.cpp
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
        Squirrel3/squirrel/jit/sqjit_specialize.cpp
    )
    if(SQGI_JIT_BACKEND STREQUAL "x64")
        list(APPEND SQUIRREL3_SRC
            Squirrel3/squirrel/jit/sqjit_backend_x64.cpp
            Squirrel3/squirrel/jit/sqjit_backend_x64_emit.cpp
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
    SQGI_VERSION="${PROJECT_VERSION}"
    SQGI_TARGET_ARCH="${CMAKE_SYSTEM_PROCESSOR}"
)
target_link_libraries(sqgi-core PUBLIC ${SQGI_DEPS})

# ── libsqgi shared library ────────────────────────────────────────────────────
add_library(sqgi SHARED $<TARGET_OBJECTS:sqgi-core>)
set_target_properties(sqgi PROPERTIES
    VERSION   ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
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
        SQGI_VERSION="${PROJECT_VERSION}"
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
    SQGI_VERSION="${PROJECT_VERSION}"
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
    SQGI_VERSION="${PROJECT_VERSION}"
)

configure_file(
    tools/sqgipkg.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/sqgipkg
    @ONLY
)

# ── Optional sanitizers ──────────────────────────────────────────────────────
# (Now declared above so flags reach all targets — kept here as a no-op
# anchor to preserve the prior file layout for diff readability.)

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
add_sqgi_nut_test(sqgi_test_json                        test_json.nut)
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
add_sqgi_nut_test(sqgi_test_boxed_record_constructor    test_boxed_record_constructor.nut)
add_sqgi_nut_test(sqgi_test_math_extended               test_math_extended.nut)
add_sqgi_nut_test(sqgi_test_system_module               test_system_module.nut)
add_sqgi_nut_test(sqgi_test_jit_math                    test_jit_math.nut)
add_sqgi_nut_test(sqgi_test_jit_loop_regressions        test_jit_loop_regressions.nut)
set_tests_properties(sqgi_test_jit_loop_regressions PROPERTIES
    LABELS "jit"
    ENVIRONMENT "${SQGI_TEST_ENV};SQGI_JIT=1;SQGI_JIT_THRESHOLD=1")
add_sqgi_nut_test(sqgi_test_jit_math_runtime            test_jit_math.nut)
add_sqgi_nut_test(sqgi_test_jit_fastpath                test_jit_fastpath.nut)
add_sqgi_nut_test(sqgi_test_jit_fastpath_runtime        test_jit_fastpath.nut)
add_sqgi_nut_test(sqgi_test_jit_correctness             test_jit_correctness.nut)
add_sqgi_nut_test(sqgi_test_jit_correctness_runtime     test_jit_correctness.nut)
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

add_test(
    NAME sqgi_test_sqgipkg
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgipkg_tests/run_tests.sh ${CMAKE_BINARY_DIR}/sqgi
)
set_tests_properties(sqgi_test_sqgipkg PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    TIMEOUT 300
)

# sqgicheck has deterministic engine/unit coverage plus an end-to-end CLI
# suite for argument parsing, exit status, recursive imports, and install.
set(SQGICHECK_TEST_TYPELIB_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/sqgicheck-test-typelib)
set(SQGICHECK_TEST_TYPELIB
    ${SQGICHECK_TEST_TYPELIB_DIR}/SqgicheckTest-1.0.typelib)
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
    ENVIRONMENT "${SQGI_TEST_ENV};GI_TYPELIB_PATH=${SQGICHECK_TEST_TYPELIB_DIR}:$ENV{GI_TYPELIB_PATH};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    TIMEOUT 30
)

add_test(
    NAME sqgi_test_sqgicheck_cli
    COMMAND bash ${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/run_tests.sh
            ${CMAKE_BINARY_DIR}/sqgicheck
)
set_tests_properties(sqgi_test_sqgicheck_cli PROPERTIES
    ENVIRONMENT "${SQGI_TEST_ENV};GI_TYPELIB_PATH=${SQGICHECK_TEST_TYPELIB_DIR}:$ENV{GI_TYPELIB_PATH};LSAN_OPTIONS=suppressions=${CMAKE_SOURCE_DIR}/tools/sqgicheck_tests/lsan.supp:print_suppressions=0"
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
add_sqgi_c_test(sqgi_test_c_list_ownership test/c/test_list_ownership.c)
add_sqgi_c_test(sqgi_test_c_squirrel_core_hardening test/c/test_squirrel_core_hardening.c)
add_sqgi_c_test(sqgi_test_cpp_sqvector test/cpp/test_sqvector.cpp)
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

# ── Install ───────────────────────────────────────────────────────────────────
# Public C headers consumed by external embedders. The vm header is the
# canonical entry point; the marshal/async/signal/object headers are exposed
# as a public surface so out-of-tree extensions can use the same helpers.
set(SQGI_PUBLIC_HEADERS
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

install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/sqgipkg
    DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(PROGRAMS tools/sqgipkg
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi
    RENAME sqgipkg.nut
)

install(DIRECTORY tools/sqgipkg_lib
    DESTINATION ${CMAKE_INSTALL_DATADIR}/sqgi
)

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
