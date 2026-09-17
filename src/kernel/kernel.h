#pragma once
#include <cstdint>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

namespace sqkernel {
constexpr size_t MaxParameters = 32;
enum class Type { Void, I64, F64, Bool };
struct Field { std::string name; Type type; };
struct Record { std::string name; std::vector<Field> fields; bool is_class = false; };
struct Parameter {
    std::string name, record;
    Type type = Type::Void;
    size_t extent = 0; // positive: borrowed fixed array or one class instance
    bool dynamic = false;
    bool instance = false;
    int length_slot = -1; // hidden ABI argument for runtime-sized arrays
    bool borrowed() const { return extent != 0 || dynamic || instance; }
    bool writable = false;
    size_t stride = 1; // 8-byte cells; prototype records contain i64/f64 only
};
enum class Op { Constant, Copy, Add, Sub, Mul, Div, Rem, Math, Neg, Eq, Ne, Lt, Le, Gt, Ge,
                LocalAddress, Load, Store, Bounds, Require, Jump, JumpFalse, Tick, Return };
struct Instruction {
    Op op;
    Type type;
    int dst, a, b;
    uint64_t immediate;
    int line;
};
struct LocalStorage { int first; size_t cells; };
struct Function {
    std::string name;
    Type result = Type::Void;
    std::vector<Parameter> parameters;
    std::vector<Instruction> code;
    std::vector<LocalStorage> local_storage;
    int slots = 0;
    bool exported = false;
    std::string owner; // class name for an instance method
    size_t argument_slots() const {
        size_t n = parameters.size();
        for (const auto &p : parameters) if (p.dynamic) ++n;
        return n;
    }
};
struct Call {
    const uint64_t *arguments;
    uint64_t result;
    uint64_t fuel;
    uint64_t error_line;
};
enum Status { Success, BoundsError, RequirementError, BudgetError, ArithmeticError };
class Executable;
struct Module {
    std::string filename;
    std::vector<Record> records;
    std::vector<Function> functions;
    std::vector<std::shared_ptr<Executable>> native;
};
bool supported();
const char *backend_name();
std::shared_ptr<Module> compile(const std::string &source, const std::string &filename);
// Prepared entries borrow executable storage: retain the Module while using one.
struct PreparedCall { int (*entry)(Call *); bool floating; };
PreparedCall prepare(const Module &, size_t function);
Status execute(PreparedCall, Call &);
Status execute(const Module &, size_t function, Call &);
bool uses_floating_environment(const Function &);
// Test oracle only; never used as automatic native fallback.
Status interpret(const Function &, Call &);
const char *status_name(Status);
}
