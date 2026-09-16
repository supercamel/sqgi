#pragma once
#include <cstdint>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

namespace sqkernel {
enum class Type { Void, I64, F64, Bool };
struct Field { std::string name; Type type; };
struct Record { std::string name; std::vector<Field> fields; };
struct Parameter {
    std::string name, record;
    Type type = Type::Void;
    size_t extent = 0; // zero: scalar; positive: borrowed fixed array
    bool writable = false;
    size_t stride = 1; // 8-byte cells; prototype records contain i64/f64 only
};
enum class Op { Constant, Copy, Add, Sub, Mul, Div, Neg, Eq, Ne, Lt, Le, Gt, Ge,
                Load, Store, Bounds, Require, Jump, JumpFalse, Tick, Return };
struct Instruction {
    Op op;
    Type type;
    int dst, a, b;
    uint64_t immediate;
    int line;
};
struct Function {
    std::string name;
    Type result = Type::Void;
    std::vector<Parameter> parameters;
    std::vector<Instruction> code;
    int slots = 0;
    bool exported = false;
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
Status execute(const Module &, size_t function, Call &);
// Test oracle only; never used as automatic native fallback.
Status interpret(const Function &, Call &);
const char *status_name(Status);
}
