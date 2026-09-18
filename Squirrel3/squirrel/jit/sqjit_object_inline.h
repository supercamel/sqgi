#ifndef SQJIT_OBJECT_INLINE_H
#define SQJIT_OBJECT_INLINE_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
struct SQClosure;
struct SQJitClassBinding {
    SQObjectPtr key,target;
    std::vector<SQObjectPtr> fields,defaults,methods,metamethods,root_keys,root_methods;
    SQInteger constructor;
};
bool sqjit_class_bindings_match(const std::vector<SQJitClassBinding> &,SQObjectPtr *,SQClosure *);
class SQJitObjectInlinePlan {
public:
    bool Build(SQFunctionProto *,SQObjectPtr *,SQClosure *,const std::vector<SQInteger> &);
    SQFunctionProto *Lowered() const;
    bool retry=false;
    std::vector<SQJitClassBinding> bindings;
    std::vector<SQInteger> temporary_writes;
private:
    SQObjectPtr lowered;
};
#endif
