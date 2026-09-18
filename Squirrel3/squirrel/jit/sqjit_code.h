/* Unique ownership of executable mappings/external resources, or borrowed stubs. */
#ifndef _SQJIT_CODE_H_
#define _SQJIT_CODE_H_
#include "squirrel.h"
#include <vector>
struct SQWeakRef;

class SQJitCode {
public:
    SQJitCode() : entry(NULL), size(0), owner(NULL), dispose(NULL) {}
    ~SQJitCode();
    SQJitCode(const SQJitCode &) = delete;
    SQJitCode &operator=(const SQJitCode &) = delete;
    bool Install(const unsigned char *bytes, SQInteger length);
    void SetStub(void *stub);
    void SetExternal(void *code, void *resource, void (*release)(void *));
    void Reset();
    void RetainWeakReference(SQWeakRef *reference);
    void *Entry() const { return entry; }
    SQInteger MappedSize() const { return size; }
    explicit operator bool() const { return entry != NULL; }
private:
    void *entry;
    SQInteger size; // Zero for stubs/external code; positive for an owned mapping.
    void *owner;
    void (*dispose)(void *);
    std::vector<SQWeakRef *> weak_references;
};
#endif
