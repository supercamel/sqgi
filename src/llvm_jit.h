#ifndef SQGI_LLVM_JIT_H
#define SQGI_LLVM_JIT_H

#include <llvm-c/LLJIT.h>

#if defined(_WIN32) && (defined(__x86_64__) || defined(_M_X64))
#include <llvm-c/Core.h>
#include <llvm-c/OrcEE.h>
#include <windows.h>
#include <new>
#include <vector>

namespace sqgi_llvm {
namespace detail {

// LLVM 18's default SectionMemoryManager allocates code and data separately.
// COFF RuntimeDyld caches the lowest section address as ImageBase while loading
// relocations: later sections below that address, or more than 4 GiB away,
// cause a fatal IMAGE_REL_AMD64_ADDR32NB error. Allocate every section of an
// object in increasing order inside one reservation, including unwind data.
class ObjectMemory {
    // Only virtual address space is reserved. Physical pages are committed on
    // demand. This allows ample space for stubs/alignment beyond the kernel's
    // 16 MiB object budget and the bounded bytecode plans, while keeping every
    // intra-object displacement within signed 32-bit range as well.
    static const uintptr_t capacity = 256 * 1024 * 1024;
    struct Section { void *address; SIZE_T size; DWORD protection; };
    unsigned char *base;
    uintptr_t used = 0;
    uintptr_t page_size;
    std::vector<Section> sections;

public:
    ObjectMemory() {
        SYSTEM_INFO info;
        GetSystemInfo(&info);
        page_size = info.dwPageSize;
        base = static_cast<unsigned char *>(VirtualAlloc(
            nullptr, capacity, MEM_RESERVE, PAGE_NOACCESS));
    }
    ~ObjectMemory() { if(base) VirtualFree(base, 0, MEM_RELEASE); }

    uint8_t *allocate(uintptr_t size, unsigned alignment, DWORD protection) noexcept {
        if(!base) return nullptr;
        uintptr_t align = alignment > page_size ? alignment : page_size;
        if((align & (align - 1)) || size > capacity) return nullptr;
        uintptr_t address = (reinterpret_cast<uintptr_t>(base) + used + align - 1) & ~(align - 1);
        uintptr_t offset = address - reinterpret_cast<uintptr_t>(base);
        uintptr_t bytes = ((size ? size : 1) + page_size - 1) & ~(page_size - 1);
        if(offset > capacity || bytes > capacity - offset) return nullptr;
        // Never let a C++ exception cross LLVM's C callbacks (the Windows LLVM
        // DLL may use a different C++ runtime from the SQGI executable).
        try { sections.push_back({reinterpret_cast<void *>(address), bytes, protection}); }
        catch(...) { return nullptr; }
        auto result = static_cast<uint8_t *>(VirtualAlloc(
            reinterpret_cast<void *>(address), bytes, MEM_COMMIT, PAGE_READWRITE));
        if(!result) { sections.pop_back(); return nullptr; }
        used = offset + bytes;
        return result;
    }

    LLVMBool finalize(char **error) {
        for(const auto &section : sections) {
            DWORD previous;
            if(!VirtualProtect(section.address, section.size, section.protection, &previous) ||
               (section.protection == PAGE_EXECUTE_READ &&
                !FlushInstructionCache(GetCurrentProcess(), section.address, section.size))) {
                // LLVM frees this message using its own C runtime.
                if(error) *error = LLVMCreateMessage("Unable to finalize Windows LLVM section memory");
                return 1;
            }
        }
        return 0;
    }
};

inline LLVMOrcObjectLayerRef object_layer(void *, LLVMOrcExecutionSessionRef session, const char *) {
    return LLVMOrcCreateRTDyldObjectLinkingLayerWithMCJITMemoryManagerLikeCallbacks(
        session, nullptr,
        [](void *) -> void * { return new(std::nothrow) ObjectMemory; },
        [](void *) {},
        [](void *context, uintptr_t size, unsigned alignment, unsigned, const char *) -> uint8_t * {
            return context ? static_cast<ObjectMemory *>(context)->allocate(size, alignment, PAGE_EXECUTE_READ) : nullptr;
        },
        [](void *context, uintptr_t size, unsigned alignment, unsigned, const char *, LLVMBool read_only) -> uint8_t * {
            return context ? static_cast<ObjectMemory *>(context)->allocate(size, alignment, read_only ? PAGE_READONLY : PAGE_READWRITE) : nullptr;
        },
        [](void *context, char **error) -> LLVMBool {
            return context ? static_cast<ObjectMemory *>(context)->finalize(error) : 1;
        },
        [](void *context) { delete static_cast<ObjectMemory *>(context); });
}
} // namespace detail
} // namespace sqgi_llvm
#endif

namespace sqgi_llvm {
inline LLVMErrorRef create_jit(LLVMOrcLLJITRef *jit) {
#if defined(_WIN32) && (defined(__x86_64__) || defined(_M_X64))
    auto builder = LLVMOrcCreateLLJITBuilder();
    LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator(builder, detail::object_layer, nullptr);
    // LLVM takes ownership of the builder even if creation fails.
    return LLVMOrcCreateLLJIT(jit, builder);
#else
    return LLVMOrcCreateLLJIT(jit, nullptr);
#endif
}

// Takes ownership of the module on both success and failure, like LLJIT's
// AddLLVMIRModule. On Windows, submit a complete object so ORC's responsibility
// set includes codegen-created COFF symbols (notably MSVC __real@ constants).
// LLVM 18's C API cannot set the custom layer's AutoClaimObjectSymbols flag.
inline LLVMErrorRef add_module(LLVMOrcLLJITRef jit, LLVMOrcThreadSafeModuleRef module) {
#if defined(_WIN32) && (defined(__x86_64__) || defined(_M_X64))
    struct Emission { LLVMOrcLLJITRef jit; LLVMMemoryBufferRef object; } emission{jit, nullptr};
    auto error = LLVMOrcThreadSafeModuleWithModuleDo(module,
        [](void *context, LLVMModuleRef ir) -> LLVMErrorRef {
            auto &out = *static_cast<Emission *>(context);
            const char *triple = LLVMOrcLLJITGetTripleString(out.jit);
            LLVMTargetRef target;
            char *message = nullptr;
            if(LLVMGetTargetFromTriple(triple, &target, &message)) {
                auto error = LLVMCreateStringError(message);
                LLVMDisposeMessage(message);
                return error;
            }
            char *cpu = LLVMGetHostCPUName(), *features = LLVMGetHostCPUFeatures();
            auto machine = LLVMCreateTargetMachine(target, triple, cpu, features,
                LLVMCodeGenLevelDefault, LLVMRelocDefault, LLVMCodeModelJITDefault);
            LLVMDisposeMessage(cpu);
            LLVMDisposeMessage(features);
            if(!machine) return LLVMCreateStringError("Unable to create Windows LLVM target machine");
            auto failed = LLVMTargetMachineEmitToMemoryBuffer(machine, ir, LLVMObjectFile, &message, &out.object);
            LLVMDisposeTargetMachine(machine);
            if(!failed) return LLVMErrorSuccess;
            auto error = LLVMCreateStringError(message);
            LLVMDisposeMessage(message);
            return error;
        }, &emission);
    LLVMOrcDisposeThreadSafeModule(module);
    if(error) return error;
    return LLVMOrcLLJITAddObjectFile(jit, LLVMOrcLLJITGetMainJITDylib(jit), emission.object);
#else
    return LLVMOrcLLJITAddLLVMIRModule(jit, LLVMOrcLLJITGetMainJITDylib(jit), module);
#endif
}
} // namespace sqgi_llvm

#endif
