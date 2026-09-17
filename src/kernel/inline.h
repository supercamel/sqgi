#pragma once
#include "kernel.h"
#include <squirrel.h>
// Internal snapshot. Owns kernel IR/code, not VM objects; all VM identity checks
// are repeated before using it. The monotonically assigned token prevents ABA.
struct SQKernelInline {
    std::shared_ptr<sqkernel::Module> module;
    size_t function=0;
    uint64_t identity=0;
    SQLEAFFUNCTION leaf=nullptr;
    void *context=nullptr;
    sqkernel::PreparedCall prepared{nullptr,true};
};
bool sqgi_kernel_describe_leaf(SQLEAFFUNCTION,void *,SQKernelInline &);

// Validate a live typed receiver without retaining its VM object.
bool sqgi_kernel_inline_receiver(const SQKernelInline &,const HSQOBJECT &,uint64_t *&);
