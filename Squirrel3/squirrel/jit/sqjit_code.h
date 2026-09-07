/* Unique ownership of an executable mapping or a borrowed C++ stub. */
#ifndef _SQJIT_CODE_H_
#define _SQJIT_CODE_H_
#include "squirrel.h"

class SQJitCode {
public:
    SQJitCode() : entry(NULL), size(0) {}
    ~SQJitCode();
    SQJitCode(const SQJitCode &) = delete;
    SQJitCode &operator=(const SQJitCode &) = delete;
    bool Install(const unsigned char *bytes, SQInteger length);
    void SetStub(void *stub);
    void Reset();
    void *Entry() const { return entry; }
    SQInteger MappedSize() const { return size; }
    explicit operator bool() const { return entry != NULL; }
private:
    void *entry;
    SQInteger size; // Zero for borrowed C++ code; positive for an owned mapping.
};
#endif
