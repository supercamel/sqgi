#include "sqgicheck.h"

#include "sqpcheader.h"
#include "sqopcodes.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqstring.h"

#include <algorithm>
#include <deque>
#include <sstream>
#include <unordered_set>

namespace sqgicheck {

namespace {

struct State {
    std::vector<Value> registers;
    std::vector<Value> outers;
    std::unordered_map<std::string, Value> globals;

    bool operator==(const State &other) const
    {
        return registers == other.registers && outers == other.outers &&
               globals == other.globals;
    }
};

std::string value_label(const Value &value)
{
    switch (value.kind) {
    case ValueKind::Namespace:
        return value.namespace_name;
    case ValueKind::Type:
    case ValueKind::Instance:
    case ValueKind::Enum:
        return value.namespace_name + "." + value.type_name;
    case ValueKind::SqgiModule:
        return "sqgi";
    case ValueKind::Table:
        return "table";
    case ValueKind::ScriptClass:
        return value.type_name.empty() ? "script class" : value.type_name;
    case ValueKind::ScriptInstance:
        return value.type_name.empty() ? "script instance" : value.type_name;
    default:
        return "value";
    }
}

int edit_distance(const std::string &left, const std::string &right)
{
    std::vector<int> previous(right.size() + 1);
    std::vector<int> current(right.size() + 1);
    for (size_t j = 0; j <= right.size(); ++j)
        previous[j] = static_cast<int>(j);
    for (size_t i = 1; i <= left.size(); ++i) {
        current[0] = static_cast<int>(i);
        for (size_t j = 1; j <= right.size(); ++j) {
            int cost = left[i - 1] == right[j - 1] ? 0 : 1;
            current[j] = std::min({previous[j] + 1, current[j - 1] + 1,
                                   previous[j - 1] + cost});
        }
        previous.swap(current);
    }
    return previous[right.size()];
}

std::string suggestion_for(const std::string &name,
                           const std::vector<std::string> &candidates)
{
    int best_distance = 1000000;
    std::string best;
    for (const std::string &candidate : candidates) {
        int distance = edit_distance(name, candidate);
        if (distance < best_distance ||
            (distance == best_distance && candidate < best)) {
            best_distance = distance;
            best = candidate;
        }
    }
    int threshold = std::max(2, static_cast<int>(name.size() / 3));
    if (best.empty() || best_distance > threshold)
        return std::string();
    return "did you mean '" + best + "'?";
}

Value merge_value(const Value &left, const Value &right)
{
#ifdef SQGICHECK_MUTATE_STATE_MERGE
    (void)right;
    return left;
#else
    return left == right ? left : Value::unknown();
#endif
}

bool merge_state(State *target, const State &incoming)
{
    bool changed = false;
    for (size_t i = 0; i < target->registers.size(); ++i) {
        Value merged = merge_value(target->registers[i], incoming.registers[i]);
        if (merged != target->registers[i]) {
            target->registers[i] = std::move(merged);
            changed = true;
        }
    }
    for (size_t i = 0; i < target->outers.size(); ++i) {
        Value merged = merge_value(target->outers[i], incoming.outers[i]);
        if (merged != target->outers[i]) {
            target->outers[i] = std::move(merged);
            changed = true;
        }
    }
    std::unordered_set<std::string> global_names;
    for (const auto &entry : target->globals) global_names.insert(entry.first);
    for (const auto &entry : incoming.globals) global_names.insert(entry.first);
    for (const std::string &name : global_names) {
        auto left = target->globals.find(name);
        auto right = incoming.globals.find(name);
        Value merged = left != target->globals.end() &&
                       right != incoming.globals.end() ?
            merge_value(left->second, right->second) : Value::unknown();
        if (left == target->globals.end() || left->second != merged) {
            target->globals[name] = std::move(merged);
            changed = true;
        }
    }
    return changed;
}

Value literal_value(SQFunctionProto *prototype, SQInteger index)
{
    if (index < 0 || index >= prototype->_nliterals)
        return Value::unknown();
    SQObjectPtr &literal = prototype->_literals[index];
    if (sq_type(literal) == OT_STRING) {
        return Value::string(std::string(
            _stringval(literal), static_cast<size_t>(_string(literal)->_len)));
    }
    return Value::scalar();
}

bool is_nut_import(const std::string &name)
{
    return name.size() >= 4 && name.compare(name.size() - 4, 4, ".nut") == 0;
}

Value export_value(Value value, const std::string &member_name = std::string(),
                   bool seal_table = false)
{
    if (value.kind == ValueKind::Closure) {
        value.kind = ValueKind::Callable;
        value.namespace_name = "__script";
        value.member_name = member_name;
        value.closure = nullptr;
        value.closure_outers.clear();
    }
    if ((value.kind == ValueKind::Table && seal_table) ||
        value.kind == ValueKind::ScriptClass)
        value.members_known = true;
    for (auto &field : value.fields)
        field.second = export_value(std::move(field.second), field.first, false);
    for (auto &field : value.instance_fields)
        field.second = export_value(std::move(field.second), field.first, false);
    return value;
}

void update_script_class_alias(Value &value, const Value &updated)
{
    if (value.kind == ValueKind::ScriptClass &&
        !updated.script_identity.empty() &&
        value.script_identity == updated.script_identity) {
        value = updated;
        return;
    }
    for (auto &field : value.fields)
        update_script_class_alias(field.second, updated);
    for (auto &field : value.instance_fields)
        update_script_class_alias(field.second, updated);
    for (Value &outer : value.closure_outers)
        update_script_class_alias(outer, updated);
}

class SourceAnalyzer {
public:
    SourceAnalyzer(MetadataProvider &metadata, std::string path, std::string source,
                   const AnalyzeOptions &options,
                   const AnalyzerTestHooks *test_hooks)
        : metadata_(metadata), path_(std::move(path)), source_(std::move(source)),
          options_(options), test_hooks_(test_hooks)
    {
        line_offsets_.push_back(0);
        for (size_t i = 0; i < source_.size(); ++i) {
            if (source_[i] == '\n') line_offsets_.push_back(i + 1);
        }
    }

    SourceResult run()
    {
        HSQUIRRELVM vm = test_hooks_ && test_hooks_->fail_vm_creation ?
            nullptr : sq_open(256);
        if (!vm) {
            add_diagnostic(1, 1, "SQGI000", "could not create a compiler VM", "");
            return result_;
        }
        if (test_hooks_ && test_hooks_->column_probes) {
            for (const auto &probe : *test_hooks_->column_probes)
                (void)column_for(probe.first, probe.second);
        }
        sq_setforeignptr(vm, this);
        sq_setcompilererrorhandler(vm, compiler_error);

        SQRESULT compiled = sq_compilebuffer(
            vm, source_.c_str(), static_cast<SQInteger>(source_.size()),
            path_.c_str(), SQTrue);
        if (SQ_SUCCEEDED(compiled)) {
            SQObjectPtr &object = stack_get(vm, -1);
            SQFunctionProto *prototype = _closure(object)->_function;
            if (test_hooks_ && test_hooks_->after_compile)
                test_hooks_->after_compile(prototype, test_hooks_->data);
            analyze_prototype(prototype, std::vector<Value>(), true);
            result_.return_value = export_value(
                std::move(result_.return_value), std::string(), true);
            if (test_hooks_ && test_hooks_->before_close)
                test_hooks_->before_close(prototype, test_hooks_->data);
        }
        sq_close(vm);
        return result_;
    }

private:
    MetadataProvider &metadata_;
    std::string path_;
    std::string source_;
    const AnalyzeOptions &options_;
    const AnalyzerTestHooks *test_hooks_;
    std::vector<size_t> line_offsets_;
    SourceResult result_;
    std::unordered_set<std::string> diagnostic_keys_;
    std::unordered_set<std::string> unknown_keys_;
    std::unordered_map<SQFunctionProto *, std::vector<std::vector<Value>>>
        analyzed_contexts_;
    std::unordered_map<const SQInstruction *, std::string> script_identities_;
    size_t next_script_identity_ = 1;
    bool collecting_diagnostics_ = true;

    static void compiler_error(HSQUIRRELVM vm, const SQChar *description,
                               const SQChar *, SQInteger line, SQInteger column)
    {
        SourceAnalyzer *self = static_cast<SourceAnalyzer *>(sq_getforeignptr(vm));
        self->add_diagnostic(static_cast<int>(line), static_cast<int>(column),
                             "SQGI001", description, "");
    }

    int line_for(SQFunctionProto *prototype, int instruction) const
    {
        if (prototype->_nlineinfos <= 0) return 1;
        return static_cast<int>(
            prototype->GetLine(&prototype->_instructions[instruction]));
    }

    int column_for(int line, const std::string &needle) const
    {
        if (line <= 0 || static_cast<size_t>(line) > line_offsets_.size() ||
            needle.empty())
            return 1;
        size_t start = line_offsets_[static_cast<size_t>(line - 1)];
        size_t end = source_.find('\n', start);
        if (end == std::string::npos) end = source_.size();
        size_t position = source_.find(needle, start);
        if (position == std::string::npos || position >= end) return 1;
        return static_cast<int>(position - start + 1);
    }

    void add_diagnostic(int line, int column, const std::string &code,
                        const std::string &message, const std::string &help,
                        Severity severity = Severity::Error)
    {
        if (!collecting_diagnostics_) return;
        std::ostringstream key;
        key << line << ':' << column << ':' << code << ':' << message;
        if (!diagnostic_keys_.insert(key.str()).second) return;
        Diagnostic diagnostic;
        diagnostic.path = path_;
        diagnostic.line = std::max(line, 1);
        diagnostic.column = std::max(column, 1);
        diagnostic.severity = severity;
        diagnostic.code = code;
        diagnostic.message = message;
        diagnostic.help = help;
        result_.diagnostics.push_back(std::move(diagnostic));
    }

    void count_unknown(int line, const std::string &operation)
    {
        if (!collecting_diagnostics_) return;
        std::string key = std::to_string(std::max(line, 1)) + ':' + operation;
        if (unknown_keys_.insert(std::move(key)).second)
            ++result_.unknown_count;
    }

    Value lookup(const Value &base, const Value &key, bool for_call, int line)
    {
        if (key.kind != ValueKind::String) {
            count_unknown(line, "dynamic-member");
            return Value::unknown();
        }
        auto local = base.fields.find(key.text);
        if (local != base.fields.end()) return local->second;
        LookupResult member;
        if (base.members_known) {
            member.definite_missing = true;
            for (const auto &field : base.fields)
                member.candidates.push_back(field.first);
            std::sort(member.candidates.begin(), member.candidates.end());
        } else {
            member = metadata_.lookup_member(base, key.text, for_call);
        }
        if (member.found) return member.value;
        if (!member.definite_missing) {
            count_unknown(line, "member:" + key.text);
            return Value::unknown();
        }

        bool instance_call = (base.kind == ValueKind::Instance ||
                              base.kind == ValueKind::ScriptInstance) && for_call;
        std::string code = instance_call ?
            "SQGI102" : "SQGI101";
        std::string noun = instance_call ?
            "method" : "member";
        add_diagnostic(line, column_for(line, key.text), code,
                       value_label(base) + " has no " + noun + " '" + key.text + "'",
                       suggestion_for(key.text, member.candidates));
        return Value::unknown();
    }

    bool valid_arity(const Value &callable, int count) const
    {
        if (callable.minimum_args < 0) return true;
        if (count == callable.alternate_args) return true;
        if (callable.maximum_args < 0) return count >= callable.minimum_args;
        return count >= callable.minimum_args &&
#ifdef SQGICHECK_MUTATE_ARITY_BOUNDARY
            count < callable.maximum_args;
#else
            count <= callable.maximum_args;
#endif
    }

    std::string expected_arity(const Value &callable) const
    {
        std::ostringstream output;
        if (callable.maximum_args < 0) {
            output << "at least " << callable.minimum_args;
        } else if (callable.minimum_args == callable.maximum_args) {
            output << callable.minimum_args;
        } else {
            output << callable.minimum_args << " to " << callable.maximum_args;
        }
        if (callable.alternate_args >= 0)
            output << " or " << callable.alternate_args;
        return output.str();
    }

    void validate_property(const Value &instance, const std::string &name, int line)
    {
        std::vector<std::string> candidates;
        if (metadata_.has_property(instance, name, &candidates)) return;
        add_diagnostic(line, column_for(line, name), "SQGI104",
                       value_label(instance) + " has no property '" + name + "'",
                       suggestion_for(name, candidates));
    }

    void validate_signal(const Value &instance, const std::string &name, int line)
    {
        std::vector<std::string> candidates;
        if (metadata_.has_signal(instance, name, &candidates)) return;
        add_diagnostic(line, column_for(line, name), "SQGI105",
                       value_label(instance) + " has no signal '" + name + "'",
                       suggestion_for(name, candidates));
    }

    Value invoke(const Value &callable, const std::vector<Value> &arguments,
                 int line)
    {
        if (callable.kind == ValueKind::ImportFunction) {
            if (!valid_arity(callable, static_cast<int>(arguments.size()))) {
                add_diagnostic(line, column_for(line, "import"), "SQGI103",
                               "import called with the wrong number of arguments",
                               "expected " + expected_arity(callable));
                return Value::unknown();
            }
            if (arguments.empty() || arguments[0].kind != ValueKind::String)
                return Value::unknown();
            const std::string &name = arguments[0].text;
            if (is_nut_import(name)) {
                if (!collecting_diagnostics_) {
                    ImportReference reference;
                    reference.name = name;
                    reference.line = line;
                    reference.column = column_for(line, name);
                    result_.imports.push_back(std::move(reference));
                }
                auto imported = options_.local_import_values.find(name);
                if (imported != options_.local_import_values.end())
                    return imported->second;
                return Value::unknown();
            }
            std::string version;
            if (arguments.size() >= 2 && arguments[1].kind == ValueKind::String)
                version = arguments[1].text;
            NamespaceResult loaded = metadata_.load_namespace(name, version);
            if (!loaded.found) {
                std::string label = "GI namespace '" + name + "'";
                if (!version.empty()) label += " version '" + version + "'";
                add_diagnostic(line, column_for(line, name), "SQGI100",
                               label + " could not be loaded", loaded.error);
                return Value::unknown();
            }
            return loaded.value;
        }

        if (callable.kind == ValueKind::ScriptClass) {
            auto constructor = callable.instance_fields.find("constructor");
            if (constructor != callable.instance_fields.end() &&
                !valid_arity(constructor->second,
                             static_cast<int>(arguments.size()))) {
                add_diagnostic(line, column_for(line, callable.type_name), "SQGI103",
                               (callable.type_name.empty() ? "constructor" :
                                callable.type_name) + " called with " +
                                   std::to_string(arguments.size()) +
                                   " argument(s); expected " +
                                   expected_arity(constructor->second), "");
            } else if (constructor == callable.instance_fields.end() &&
                       !arguments.empty()) {
                add_diagnostic(line, column_for(line, callable.type_name), "SQGI103",
                               (callable.type_name.empty() ? "constructor" :
                                callable.type_name) + " called with " +
                                   std::to_string(arguments.size()) +
                                   " argument(s); expected 0", "");
            }
            Value instance = callable;
            instance.kind = ValueKind::ScriptInstance;
            instance.fields = callable.instance_fields;
            instance.instance_fields.clear();
            return instance;
        }

        if (callable.kind != ValueKind::Callable &&
            callable.kind != ValueKind::Type &&
            callable.kind != ValueKind::Closure) {
            count_unknown(line, "call");
            return Value::unknown();
        }
        if ((callable.kind == ValueKind::Callable ||
             callable.kind == ValueKind::Closure) &&
            !valid_arity(callable, static_cast<int>(arguments.size()))) {
            std::string name = callable.member_name.empty() ? "callable" :
                callable.member_name;
            add_diagnostic(line, column_for(line, name), "SQGI103",
                           name + " called with " +
                               std::to_string(arguments.size()) +
                               " argument(s); expected " + expected_arity(callable),
                           "");
        }

        if (callable.kind == ValueKind::Callable && !callable.type_name.empty()) {
            Value instance;
            instance.kind = ValueKind::Instance;
            instance.namespace_name = callable.namespace_name;
            instance.type_name = callable.type_name;
            if ((callable.member_name == "get_property" ||
                 callable.member_name == "set_property") &&
                !arguments.empty() && arguments[0].kind == ValueKind::String) {
                validate_property(instance, arguments[0].text, line);
            } else if ((callable.member_name == "connect" ||
                        callable.member_name == "emit") &&
                       !arguments.empty() && arguments[0].kind == ValueKind::String) {
                validate_signal(instance, arguments[0].text, line);
            }
        }

        if (callable.kind == ValueKind::Callable &&
            callable.namespace_name == "__sqgi" &&
            callable.member_name == "new_object" && arguments.size() >= 2 &&
            arguments[0].kind == ValueKind::Type &&
            arguments[1].kind == ValueKind::Table) {
            Value instance = arguments[0];
            instance.kind = ValueKind::Instance;
            for (const auto &field : arguments[1].fields)
                validate_property(instance, field.first, line);
        }
        if (callable.kind == ValueKind::Closure ||
            callable.namespace_name == "__script")
            return Value::unknown();
        return metadata_.call_result(callable, arguments);
    }

    std::vector<Value> capture_outers(SQFunctionProto *child, const State &state)
    {
        std::vector<Value> captures;
        captures.reserve(static_cast<size_t>(child->_noutervalues));
        for (int i = 0; i < child->_noutervalues; ++i) {
            const SQOuterVar &outer = child->_outervalues[i];
            int index = sq_type(outer._src) == OT_INTEGER ?
                static_cast<int>(_integer(outer._src)) : -1;
            if (outer._type == otLOCAL && index >= 0 &&
                static_cast<size_t>(index) < state.registers.size()) {
                captures.push_back(state.registers[static_cast<size_t>(index)]);
            } else if (outer._type == otOUTER && index >= 0 &&
                       static_cast<size_t>(index) < state.outers.size()) {
                captures.push_back(state.outers[static_cast<size_t>(index)]);
            } else {
                captures.push_back(Value::unknown());
            }
        }
        return captures;
    }

    void analyze_prototype(SQFunctionProto *prototype,
                           const std::vector<Value> &outer_values,
                           bool capture_return = false)
    {
        auto &contexts = analyzed_contexts_[prototype];
        if (std::find(contexts.begin(), contexts.end(), outer_values) != contexts.end())
            return;
        contexts.push_back(outer_values);

        const int instruction_count = static_cast<int>(prototype->_ninstructions);
        if (instruction_count <= 0) return;
        const size_t register_count = static_cast<size_t>(
            std::max<SQInteger>(prototype->_stacksize, 1));

        std::vector<State> states(static_cast<size_t>(instruction_count));
        std::vector<bool> reached(static_cast<size_t>(instruction_count), false);
        std::deque<int> work;
        State entry;
        entry.registers.assign(register_count, Value::unknown());
        entry.registers[0] = Value::root();
        entry.outers = outer_values;
        states[0] = entry;
        reached[0] = true;
        work.push_back(0);

        auto register_value = [](const State &state, int index) -> Value {
            if (index < 0 || static_cast<size_t>(index) >= state.registers.size())
                return Value::unknown();
            return state.registers[static_cast<size_t>(index)];
        };
        auto set_register = [](State *state, int index, Value value) {
            if (index == 0xFF || index < 0 ||
                static_cast<size_t>(index) >= state->registers.size())
                return;
            state->registers[static_cast<size_t>(index)] = std::move(value);
        };

        const bool outer_collection = collecting_diagnostics_;
        collecting_diagnostics_ = false;
        while (!work.empty()) {
            int ip = work.front();
            work.pop_front();
            State state = states[static_cast<size_t>(ip)];
            const SQInstruction &instruction = prototype->_instructions[ip];
            int arg0 = instruction._arg0;
            int arg1 = static_cast<int>(static_cast<SQInt32>(instruction._arg1));
            int arg2 = instruction._arg2;
            int arg3 = instruction._arg3;
            int line = line_for(prototype, ip);

            switch (instruction.op) {
            case _OP_LOAD:
                set_register(&state, arg0, literal_value(prototype, arg1));
                break;
            case _OP_DLOAD:
                set_register(&state, arg0, literal_value(prototype, arg1));
                set_register(&state, arg2, literal_value(prototype, arg3));
                break;
            case _OP_LOADINT:
            case _OP_LOADFLOAT:
            case _OP_LOADBOOL:
                set_register(&state, arg0, Value::scalar());
                break;
            case _OP_LOADNULLS:
                for (int i = 0; i < arg1; ++i)
                    set_register(&state, arg0 + i, Value::scalar());
                break;
            case _OP_LOADROOT:
            {
                Value root = Value::root();
                root.fields = state.globals;
                set_register(&state, arg0, std::move(root));
                break;
            }
            case _OP_MOVE:
                set_register(&state, arg0, register_value(state, arg1));
                break;
            case _OP_DMOVE:
                set_register(&state, arg0, register_value(state, arg1));
                set_register(&state, arg2, register_value(state, arg3));
                break;
            case _OP_GETK: {
                Value key = literal_value(prototype, arg1);
                set_register(&state, arg0,
                             lookup(register_value(state, arg2), key, false, line));
                break;
            }
            case _OP_GET:
                set_register(&state, arg0,
                             lookup(register_value(state, arg1),
                                    register_value(state, arg2), false, line));
                break;
            case _OP_PREPCALLK: {
                Value base = register_value(state, arg2);
                Value key = literal_value(prototype, arg1);
                set_register(&state, arg0, lookup(base, key, true, line));
                set_register(&state, arg3, base);
                break;
            }
            case _OP_PREPCALL: {
                Value base = register_value(state, arg2);
                set_register(&state, arg0,
                             lookup(base, register_value(state, arg1), true, line));
                set_register(&state, arg3, base);
                break;
            }
            case _OP_CALL:
            case _OP_TAILCALL: {
                std::vector<Value> arguments;
                for (int i = 1; i < arg3; ++i)
                    arguments.push_back(register_value(state, arg2 + i));
                Value result = invoke(register_value(state, arg1), arguments, line);
                set_register(&state, arg0, result);
                break;
            }
            case _OP_GETOUTER:
                if (arg1 >= 0 && static_cast<size_t>(arg1) < state.outers.size())
                    set_register(&state, arg0, state.outers[static_cast<size_t>(arg1)]);
                else
                    set_register(&state, arg0, Value::unknown());
                break;
            case _OP_SETOUTER:
                if (arg1 >= 0 && static_cast<size_t>(arg1) < state.outers.size())
                    state.outers[static_cast<size_t>(arg1)] =
                        register_value(state, arg2);
                set_register(&state, arg0, register_value(state, arg2));
                break;
            case _OP_CLOSURE: {
                SQFunctionProto *child = nullptr;
                if (arg1 >= 0 && arg1 < prototype->_nfunctions &&
                    sq_type(prototype->_functions[arg1]) == OT_FUNCPROTO) {
                    child = _funcproto(prototype->_functions[arg1]);
                }
                if (child) {
                    std::vector<Value> captures = capture_outers(child, state);
                    Value closure;
                    closure.kind = ValueKind::Closure;
                    closure.closure = child;
                    closure.closure_outers = captures;
                    int user_parameters = std::max(
                        static_cast<int>(child->_nparameters) - 1, 0);
                    int fixed_parameters = child->_varparams
                        ? std::max(user_parameters - 1, 0)
                        : user_parameters;
                    closure.minimum_args = std::max(
                        fixed_parameters - static_cast<int>(child->_ndefaultparams), 0);
                    closure.maximum_args = child->_varparams ? -1 : user_parameters;
                    set_register(&state, arg0, closure);
                } else {
                    set_register(&state, arg0, Value::unknown());
                }
                break;
            }
            case _OP_NEWOBJ: {
                Value value;
                if (arg3 == NOT_TABLE) {
                    value.kind = ValueKind::Table;
                } else if (arg3 == NOT_CLASS) {
                    value.kind = ValueKind::ScriptClass;
                    value.members_known = true;
                    auto identity = script_identities_.find(&instruction);
                    if (identity == script_identities_.end()) {
                        identity = script_identities_.emplace(
                            &instruction, path_ + "#class:" +
                                std::to_string(next_script_identity_++)).first;
                    }
                    value.script_identity = identity->second;
                    Value base = register_value(state, arg1);
                    if (base.kind == ValueKind::ScriptClass)
                        value.fields = base.fields;
                    if (base.kind == ValueKind::ScriptClass)
                        value.instance_fields = base.instance_fields;
                }
                set_register(&state, arg0, value);
                break;
            }
            case _OP_NEWSLOT:
            case _OP_NEWSLOTA:
            case _OP_SET: {
                Value base = register_value(state, arg1);
                Value key = register_value(state, arg2);
                Value assigned = register_value(state, arg3);
                if ((base.kind == ValueKind::Root ||
                     base.kind == ValueKind::Table ||
                     base.kind == ValueKind::ScriptClass ||
                     base.kind == ValueKind::ScriptInstance) &&
                    key.kind == ValueKind::String) {
                    if (assigned.kind == ValueKind::ScriptClass &&
                        assigned.type_name.empty())
                        assigned.type_name = key.text;
                    if (assigned.kind == ValueKind::Closure &&
                        assigned.member_name.empty())
                        assigned.member_name = key.text;
                    if (base.kind == ValueKind::ScriptClass &&
                        instruction.op == _OP_NEWSLOTA &&
                        !(instruction._arg0 & NEW_SLOT_STATIC_FLAG))
                        base.instance_fields[key.text] = assigned;
                    else
                        base.fields[key.text] = assigned;
                    set_register(&state, arg1, base);
                    if (base.kind == ValueKind::Root) {
                        state.globals = base.fields;
                        for (Value &alias : state.registers)
                            if (alias.kind == ValueKind::Root)
                                alias.fields = state.globals;
                    } else if (base.kind == ValueKind::ScriptClass) {
                        for (Value &alias : state.registers)
                            update_script_class_alias(alias, base);
                        for (Value &alias : state.outers)
                            update_script_class_alias(alias, base);
                        for (auto &entry : state.globals)
                            update_script_class_alias(entry.second, base);
                    }
                } else if (base.kind == ValueKind::Instance &&
                           key.kind == ValueKind::String) {
                    validate_property(base, key.text, line);
                }
                if (instruction.op != _OP_NEWSLOTA)
                    set_register(&state, arg0, assigned);
                break;
            }
            case _OP_APPENDARRAY:
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
            case _OP_BITW:
            case _OP_EQ:
            case _OP_NE:
            case _OP_CMP:
            case _OP_NEG:
            case _OP_NOT:
            case _OP_BWNOT:
            case _OP_TYPEOF:
            case _OP_EXISTS:
            case _OP_INSTANCEOF:
            case _OP_CLONE:
            case _OP_RESUME:
                set_register(&state, arg0, Value::scalar());
                break;
            default:
                break;
            }

            std::vector<int> successors;
            auto add_successor = [&](int target) {
                if (target >= 0 && target < instruction_count &&
                    std::find(successors.begin(), successors.end(), target) ==
                        successors.end())
                    successors.push_back(target);
            };
            switch (instruction.op) {
            case _OP_RETURN:
            case _OP_THROW:
            case _OP_TAILCALL:
                break;
            case _OP_JMP:
                add_successor(ip + 1 + arg1);
                break;
            case _OP_JZ:
            case _OP_JCMP:
            case _OP_AND:
            case _OP_OR:
            case _OP_FOREACH:
            case _OP_PUSHTRAP:
                add_successor(ip + 1);
                add_successor(ip + 1 + arg1);
                break;
            case _OP_POSTFOREACH:
                add_successor(ip + 1);
                add_successor(ip + arg1);
                break;
            default:
                add_successor(ip + 1);
                break;
            }

            for (int successor : successors) {
                size_t index = static_cast<size_t>(successor);
                if (!reached[index]) {
                    states[index] = state;
                    reached[index] = true;
                    work.push_back(successor);
                } else if (merge_state(&states[index], state)) {
                    work.push_back(successor);
                }
            }
        }

        collecting_diagnostics_ = outer_collection;
        if (capture_return) {
            bool found_return = false;
            Value returned;
            for (int ip = 0; ip < instruction_count; ++ip) {
                if (!reached[static_cast<size_t>(ip)]) continue;
                const SQInstruction &instruction = prototype->_instructions[ip];
                if (instruction.op != _OP_RETURN) continue;
                Value candidate = instruction._arg0 == 0xFF ? Value::scalar() :
                    register_value(states[static_cast<size_t>(ip)],
                                   instruction._arg1);
                returned = found_return ? merge_value(returned, candidate) : candidate;
                found_return = true;
            }
            result_.return_value = found_return ? returned : Value::scalar();
        }
        if (!collecting_diagnostics_) return;

        /*
         * Emit diagnostics only after the abstract states have converged.
         * Reporting during the work-list pass can retain a false positive
         * from a branch-specific value that is widened to Unknown later.
         */
        for (int ip = 0; ip < instruction_count; ++ip) {
            if (!reached[static_cast<size_t>(ip)]) continue;
            const State &state = states[static_cast<size_t>(ip)];
            const SQInstruction &instruction = prototype->_instructions[ip];
            int arg1 = static_cast<int>(static_cast<SQInt32>(instruction._arg1));
            int arg2 = instruction._arg2;
            int arg3 = instruction._arg3;
            int line = line_for(prototype, ip);

            switch (instruction.op) {
            case _OP_GETK:
                lookup(register_value(state, arg2),
                       literal_value(prototype, arg1), false, line);
                break;
            case _OP_GET:
                lookup(register_value(state, arg1), register_value(state, arg2),
                       false, line);
                break;
            case _OP_PREPCALLK:
                lookup(register_value(state, arg2),
                       literal_value(prototype, arg1), true, line);
                break;
            case _OP_PREPCALL:
                lookup(register_value(state, arg2), register_value(state, arg1),
                       true, line);
                break;
            case _OP_CALL:
            case _OP_TAILCALL: {
                std::vector<Value> arguments;
                for (int i = 1; i < arg3; ++i)
                    arguments.push_back(register_value(state, arg2 + i));
                invoke(register_value(state, arg1), arguments, line);
                break;
            }
            case _OP_NEWSLOT:
            case _OP_NEWSLOTA:
            case _OP_SET: {
                Value base = register_value(state, arg1);
                Value key = register_value(state, arg2);
                if (base.kind == ValueKind::Instance &&
                    key.kind == ValueKind::String)
                    validate_property(base, key.text, line);
                break;
            }
            case _OP_CLOSURE:
                if (arg1 >= 0 && arg1 < prototype->_nfunctions &&
                    sq_type(prototype->_functions[arg1]) == OT_FUNCPROTO) {
                    SQFunctionProto *child = _funcproto(prototype->_functions[arg1]);
                    analyze_prototype(child, capture_outers(child, state));
                }
                break;
            default:
                break;
            }
        }
    }
};

} // namespace

Analyzer::Analyzer(MetadataProvider &metadata,
                   const AnalyzerTestHooks *test_hooks)
    : metadata_(metadata), test_hooks_(test_hooks)
{
}

SourceResult Analyzer::analyze(const std::string &path, const std::string &source,
                               const AnalyzeOptions &options)
{
    SourceAnalyzer analyzer(metadata_, path, source, options, test_hooks_);
    return analyzer.run();
}

} // namespace sqgicheck
