/* Backend capability and calling convention selection. */
#ifndef _SQJIT_PLATFORM_H_
#define _SQJIT_PLATFORM_H_
#if defined(__x86_64__) || defined(_M_X64)
#define SQJIT_HAS_X64_NATIVE 1
#define SQJIT_HAS_EXTERNAL_NATIVE 0
#elif defined(__aarch64__) && defined(__linux__)
#define SQJIT_HAS_X64_NATIVE 0
#define SQJIT_HAS_EXTERNAL_NATIVE 1
#else
#define SQJIT_HAS_X64_NATIVE 0
#define SQJIT_HAS_EXTERNAL_NATIVE 0
#endif
#ifndef SQJIT_ABI_WIN64
#if defined(_WIN64)
#define SQJIT_ABI_WIN64 1
#else
#define SQJIT_ABI_WIN64 0
#endif
#endif
#endif
