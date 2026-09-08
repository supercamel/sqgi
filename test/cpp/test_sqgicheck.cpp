#include "sqgicheck.h"

#include "sqpcheader.h"
#include "sqfuncproto.h"

#include <glib.h>

#include <algorithm>
#include <iostream>
#include <random>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sqgicheck;

namespace {

int failures = 0;
#define CHECK(c, m) do { if (!(c)) { std::cerr << "FAIL: " << m << "\n"; ++failures; } } while (0)

Value typed(ValueKind kind, const std::string &ns, const std::string &name = "")
{
    Value value;
    value.kind = kind;
    value.namespace_name = ns;
    value.type_name = name;
    return value;
}

Value callable(const std::string &type, const std::string &name, int argc,
               bool constructor = false)
{
    Value value = typed(ValueKind::Callable, "Fake", type);
    value.member_name = name;
    value.minimum_args = argc;
    value.maximum_args = argc;
    value.constructor = constructor;
    return value;
}

class FakeMetadata final : public MetadataProvider {
public:
    NamespaceResult load_namespace(const std::string &name,
                                   const std::string &version) override
    {
        NamespaceResult result;
        if (name == "Fake" && (version.empty() || version == "1.0")) {
            result.found = true;
            result.value = typed(ValueKind::Namespace, name);
        } else {
            result.error = "fake typelib missing";
        }
        return result;
    }

    LookupResult lookup_member(const Value &base, const std::string &name,
                               bool) override
    {
        LookupResult result;
        if (base.kind == ValueKind::Root) {
            if (name == "import") {
                result.found = true;
                result.value.kind = ValueKind::ImportFunction;
                result.value.minimum_args = 1;
                result.value.maximum_args = 2;
            } else if (name == "sqgi") {
                result.found = true;
                result.value.kind = ValueKind::SqgiModule;
            }
            return result;
        }
        if (base.kind == ValueKind::SqgiModule && name == "new_object") {
            result.found = true;
            result.value = callable("", name, 2);
            result.value.namespace_name = "__sqgi";
            return result;
        }
        if (base.kind == ValueKind::SqgiModule && name == "variadic") {
            result.found = true;
            result.value = callable("", name, 1);
            result.value.minimum_args = 1;
            result.value.maximum_args = -1;
            return result;
        }
        if (base.kind == ValueKind::SqgiModule && name == "alternate") {
            result.found = true;
            result.value = callable("", name, 2);
            result.value.alternate_args = 4;
            return result;
        }
        if (base.kind == ValueKind::SqgiModule || base.kind == ValueKind::Scalar ||
            (base.kind == ValueKind::Table && base.members_known)) {
            result.definite_missing = true;
            return result;
        }
        if (base.kind == ValueKind::Table) return result;
        if (base.kind == ValueKind::Namespace) {
            if (name == "Widget") {
                result.found = true;
                result.value = typed(ValueKind::Type, "Fake", name);
            } else if (name == "Mode") {
                result.found = true;
                result.value = typed(ValueKind::Enum, "Fake", name);
            } else {
                result.definite_missing = true;
                result.candidates = {"Widget", "Mode"};
            }
            return result;
        }
        if (base.kind == ValueKind::Type && base.type_name == "Widget") {
            if (name == "new") {
                result.found = true;
                result.value = callable("Widget", name, 1, true);
            } else {
                result.definite_missing = true;
                result.candidates = {"new"};
            }
            return result;
        }
        if (base.kind == ValueKind::Instance && base.type_name == "Widget") {
            if (name == "run") {
                result.found = true;
                result.value = callable("Widget", name, 1);
            } else if (name == "connect" || name == "get_property" ||
                       name == "set_property" || name == "emit") {
                result.found = true;
                result.value = callable(
                    "Widget", name,
                    name == "connect" || name == "set_property" ? 2 : 1);
                if (name == "emit") {
                    result.value.minimum_args = 1;
                    result.value.maximum_args = -1;
                }
            } else {
                result.definite_missing = true;
                result.candidates = {"run", "connect", "get_property",
                                     "set_property", "emit"};
            }
            return result;
        }
        if (base.kind == ValueKind::Enum) {
            if (name == "fast") {
                result.found = true;
                result.value = Value::scalar();
            } else {
                result.definite_missing = true;
                result.candidates = {"fast", "slow"};
            }
        }
        if (base.kind == ValueKind::Callable && name == "unknown")
            result.definite_missing = true;
        return result;
    }

    Value call_result(const Value &fn, const std::vector<Value> &args) override
    {
        if (fn.namespace_name == "__sqgi" && fn.member_name == "new_object" &&
            !args.empty()) {
            Value result = args[0];
            result.kind = ValueKind::Instance;
            return result;
        }
        if (fn.constructor)
            return typed(ValueKind::Instance, fn.namespace_name, fn.type_name);
        if (fn.member_name == "variadic") return Value::scalar();
        if (fn.member_name == "alternate") return Value::scalar();
        return Value::scalar();
    }

    bool has_property(const Value &, const std::string &name,
                      std::vector<std::string> *candidates) override
    {
        if (candidates) *candidates = {"title", "enabled"};
        return name == "title" || name == "enabled";
    }

    bool has_signal(const Value &, const std::string &name,
                    std::vector<std::string> *candidates) override
    {
        if (candidates) *candidates = {"ready", "changed"};
        return name == "ready" || name == "changed" ||
               name == "notify::title";
    }
};

bool has_code(const std::vector<Diagnostic> &diagnostics, const std::string &code)
{
    return std::any_of(diagnostics.begin(), diagnostics.end(),
                       [&](const Diagnostic &diagnostic) {
                           return diagnostic.code == code;
                       });
}

const Diagnostic *find_code(const std::vector<Diagnostic> &diagnostics,
                            const std::string &code)
{
    auto found = std::find_if(diagnostics.begin(), diagnostics.end(),
                              [&](const Diagnostic &diagnostic) {
                                  return diagnostic.code == code;
                              });
    return found == diagnostics.end() ? nullptr : &*found;
}

void test_values_and_formatting()
{
    CHECK(Value::string("one") == Value::string("one"), "equal abstract values");
    CHECK(Value::string("one") != Value::string("two"), "different values");
    Value complete = typed(ValueKind::Callable, "N", "T");
    complete.text = "text";
    complete.member_name = "member";
    complete.version = "1";
    complete.minimum_args = 1;
    complete.maximum_args = 2;
    complete.alternate_args = 3;
    complete.constructor = true;
    complete.async_wrapper = true;
    complete.members_known = true;
    complete.script_identity = "script-class-1";
    complete.closure = reinterpret_cast<SQFunctionProto *>(1);
    complete.closure_outers = {Value::scalar()};
    complete.fields["field"] = Value::string("value");
    complete.instance_fields["instance"] = Value::scalar();
    Value differing = complete;
    CHECK(complete == differing, "all abstract value fields can be equal");
    std::vector<Value> unequal_values;
    differing = complete; differing.kind = ValueKind::Unknown;
    unequal_values.push_back(differing);
    differing = complete; differing.text = "other";
    unequal_values.push_back(differing);
    differing = complete; differing.namespace_name = "Other";
    unequal_values.push_back(differing);
    differing = complete; differing.type_name = "Other";
    unequal_values.push_back(differing);
    differing = complete; differing.member_name = "other";
    unequal_values.push_back(differing);
    differing = complete; differing.version = "2";
    unequal_values.push_back(differing);
    differing = complete; differing.minimum_args = 2;
    unequal_values.push_back(differing);
    differing = complete; differing.maximum_args = 3;
    unequal_values.push_back(differing);
    differing = complete; differing.alternate_args = 4;
    unequal_values.push_back(differing);
    differing = complete; differing.constructor = false;
    unequal_values.push_back(differing);
    differing = complete; differing.async_wrapper = false;
    unequal_values.push_back(differing);
    differing = complete; differing.members_known = false;
    unequal_values.push_back(differing);
    differing = complete; differing.script_identity = "script-class-2";
    unequal_values.push_back(differing);
    differing = complete; differing.closure = nullptr;
    unequal_values.push_back(differing);
    differing = complete; differing.closure_outers.clear();
    unequal_values.push_back(differing);
    differing = complete; differing.fields.clear();
    unequal_values.push_back(differing);
    differing = complete; differing.instance_fields.clear();
    unequal_values.push_back(differing);
    for (const Value &unequal : unequal_values)
        CHECK(complete != unequal, "every abstract value field affects equality");

    Diagnostic diagnostic;
    diagnostic.path = "a\"b.nut";
    diagnostic.line = 2;
    diagnostic.column = 3;
    diagnostic.code = "SQGI999";
    diagnostic.message = "line break";
    diagnostic.help = "try \\";
    CHECK(format_text({diagnostic}).find("error SQGI999") != std::string::npos,
          "text output contains code");
    std::string json = format_json({diagnostic});
    CHECK(json.find("a\\\"b.nut") != std::string::npos, "JSON quotes escaped");
    CHECK(json.find("try \\\\") != std::string::npos, "JSON slashes escaped");
    CHECK(has_errors({diagnostic}), "error severity detected");
    diagnostic.severity = Severity::Warning;
    CHECK(!has_errors({diagnostic}), "warning severity is not error");
    CHECK(format_text({diagnostic}).find("warning SQGI999") != std::string::npos,
          "text output formats warnings");
    diagnostic.path = std::string("\b\f\n\r\t\x01", 6);
    json = format_json({diagnostic, diagnostic});
    CHECK(json.find("\\b\\f\\n\\r\\t\\u0001") != std::string::npos,
          "JSON escapes every control character family");
    CHECK(json.find("},{") != std::string::npos,
          "JSON formats multiple diagnostics");
    CHECK(format_text({}).empty(), "empty text output");
    CHECK(format_json({}) == "[]\n", "empty JSON output");

    CheckResult summary;
    CHECK(format_summary(summary) ==
              "sqgicheck: checked 0 files; 0 diagnostics; 0 checks skipped for unknown values\n",
          "empty summary uses plural grammar");
    summary.checked_files.push_back("one.nut");
    summary.diagnostics.push_back(diagnostic);
    summary.unknown_count = 1;
    CHECK(format_summary(summary) ==
              "sqgicheck: checked 1 file; 1 diagnostic; 1 check skipped for unknown values\n",
          "singular summary reports every count");

    Diagnostic ordered = diagnostic;
    ordered.path = "same.nut";
    ordered.line = 1;
    ordered.column = 1;
    ordered.code = "B";
    ordered.message = "z";
    Diagnostic ordered_code = ordered;
    ordered_code.code = "A";
    Diagnostic ordered_message = ordered;
    ordered_message.message = "a";
    Diagnostic ordered_line = ordered;
    ordered_line.line = 0;
    Diagnostic ordered_column = ordered;
    ordered_column.column = 0;
    CHECK(format_text({ordered, ordered_code, ordered_message}).size() > 0,
          "same-location diagnostics format distinctly");
    CHECK(diagnostic_less_for_test(ordered_code, ordered),
          "diagnostics sort by code at the same position");
    CHECK(diagnostic_less_for_test(ordered_message, ordered),
          "diagnostics sort by message when code and position match");
    CHECK(diagnostic_less_for_test(ordered_line, ordered),
          "diagnostics sort by line when paths match");
    CHECK(diagnostic_less_for_test(ordered_column, ordered),
          "diagnostics sort by column when paths and lines match");
}

void test_analyzer_happy_path()
{
    FakeMetadata metadata;
    Analyzer analyzer(metadata);
    const char *source =
        "local Fake = import(\"Fake\", \"1.0\")\n"
        "local widget = Fake.Widget.new(\"name\")\n"
        "widget.run(Fake.Mode.fast)\n"
        "widget[\"title\"] = \"hello\"\n"
        "widget.connect(\"ready\", function(self) {})\n"
        "sqgi.new_object(Fake.Widget, { title = \"x\" })\n";
    CHECK(analyzer.analyze("happy.nut", source).diagnostics.empty(),
          "valid program has no diagnostics");
}

struct ProtoMutation {
    enum Kind {
        NoLines,
        BadLiteral,
        BadRegister,
        BadOuterRead,
        BadClosure,
        EmptyPrototype,
        ForceDMove,
        BadCapture,
        NegativeLiteral,
        NegativeOuterRead,
        InvalidLine,
        BadOuterWrite,
        BadJump,
    } kind;
    SQInteger saved_integer = 0;
    SQInteger saved_lines = 0;
    SQInteger saved_instructions = 0;
    SQInteger instruction = 0;
    SQInstruction saved_instruction;
    SQInteger saved_outer_source = 0;
    SQInteger saved_line = 0;
};

void mutate_prototype(SQFunctionProto *prototype, void *data)
{
    ProtoMutation *mutation = static_cast<ProtoMutation *>(data);
    switch (mutation->kind) {
    case ProtoMutation::NoLines:
        mutation->saved_lines = prototype->_nlineinfos;
        prototype->_nlineinfos = 0;
        break;
    case ProtoMutation::BadLiteral:
        for (int i = 0; i < prototype->_ninstructions; ++i) {
            if (prototype->_instructions[i].op == _OP_LOAD ||
                prototype->_instructions[i].op == _OP_GETK ||
                prototype->_instructions[i].op == _OP_PREPCALLK) {
                mutation->instruction = i;
                mutation->saved_integer = prototype->_instructions[i]._arg1;
                prototype->_instructions[i]._arg1 = prototype->_nliterals;
                return;
            }
        }
        break;
    case ProtoMutation::BadRegister:
        mutation->saved_integer = prototype->_stacksize;
        prototype->_stacksize = 1;
        break;
    case ProtoMutation::NegativeLiteral:
        mutation->instruction = 0;
        mutation->saved_instruction = prototype->_instructions[0];
        prototype->_instructions[0] = SQInstruction(_OP_LOAD, 0, -1);
        break;
    case ProtoMutation::BadOuterRead:
        for (int i = 0; i < prototype->_ninstructions; ++i) {
            if (prototype->_instructions[i].op == _OP_GETOUTER) {
                mutation->instruction = i;
                mutation->saved_integer = prototype->_instructions[i]._arg1;
                prototype->_instructions[i]._arg1 = 255;
                return;
            }
        }
        break;
    case ProtoMutation::BadClosure:
        for (int i = 0; i < prototype->_ninstructions; ++i) {
            if (prototype->_instructions[i].op == _OP_CLOSURE) {
                mutation->instruction = i;
                mutation->saved_integer = prototype->_instructions[i]._arg1;
                prototype->_instructions[i]._arg1 = prototype->_nfunctions;
                return;
            }
        }
        break;
    case ProtoMutation::NegativeOuterRead:
        mutation->instruction = 0;
        mutation->saved_instruction = prototype->_instructions[0];
        prototype->_instructions[0] = SQInstruction(_OP_GETOUTER, 0, -1);
        break;
    case ProtoMutation::InvalidLine:
        mutation->saved_line = prototype->_lineinfos[0]._line;
        prototype->_lineinfos[0]._line = 0;
        break;
    case ProtoMutation::BadOuterWrite:
        for (int i = 0; i < prototype->_ninstructions; ++i) {
            if (prototype->_instructions[i].op == _OP_SETOUTER) {
                mutation->instruction = i;
                mutation->saved_integer = prototype->_instructions[i]._arg1;
                prototype->_instructions[i]._arg1 = 255;
                return;
            }
        }
        break;
    case ProtoMutation::BadJump:
        for (int i = 0; i < prototype->_ninstructions; ++i) {
            if (prototype->_instructions[i].op == _OP_JMP) {
                mutation->instruction = i;
                mutation->saved_integer = prototype->_instructions[i]._arg1;
                prototype->_instructions[i]._arg1 = prototype->_ninstructions;
                return;
            }
        }
        break;
    case ProtoMutation::EmptyPrototype:
        mutation->saved_instructions = prototype->_ninstructions;
        prototype->_ninstructions = 0;
        break;
    case ProtoMutation::ForceDMove:
        mutation->instruction = 0;
        mutation->saved_instruction = prototype->_instructions[0];
        prototype->_instructions[0] = SQInstruction(_OP_DMOVE, 0, 255, 0, 255);
        break;
    case ProtoMutation::BadCapture:
        if (prototype->_nfunctions > 0) {
            SQFunctionProto *child = _funcproto(prototype->_functions[0]);
            if (child->_noutervalues > 0) {
                mutation->saved_outer_source = _integer(child->_outervalues[0]._src);
                child->_outervalues[0]._src = static_cast<SQInteger>(255);
            }
        }
        break;
    }
}

void restore_prototype(SQFunctionProto *prototype, void *data)
{
    ProtoMutation *mutation = static_cast<ProtoMutation *>(data);
    switch (mutation->kind) {
    case ProtoMutation::NoLines:
        prototype->_nlineinfos = mutation->saved_lines;
        break;
    case ProtoMutation::BadLiteral:
    case ProtoMutation::BadOuterRead:
    case ProtoMutation::BadClosure:
    case ProtoMutation::BadOuterWrite:
    case ProtoMutation::BadJump:
        prototype->_instructions[mutation->instruction]._arg1 =
            mutation->saved_integer;
        break;
    case ProtoMutation::BadRegister:
        prototype->_stacksize = mutation->saved_integer;
        break;
    case ProtoMutation::EmptyPrototype:
        prototype->_ninstructions = mutation->saved_instructions;
        break;
    case ProtoMutation::ForceDMove:
    case ProtoMutation::NegativeLiteral:
    case ProtoMutation::NegativeOuterRead:
        prototype->_instructions[mutation->instruction] = mutation->saved_instruction;
        break;
    case ProtoMutation::InvalidLine:
        prototype->_lineinfos[0]._line = mutation->saved_line;
        break;
    case ProtoMutation::BadCapture:
        if (prototype->_nfunctions > 0) {
            SQFunctionProto *child = _funcproto(prototype->_functions[0]);
            if (child->_noutervalues > 0)
                child->_outervalues[0]._src = mutation->saved_outer_source;
        }
        break;
    }
}

void mutate_and_restore(SQFunctionProto *prototype, void *data)
{
    mutate_prototype(prototype, data);
}

void test_analyzer_defensive_paths()
{
    FakeMetadata metadata;
    AnalyzerTestHooks hooks;
    hooks.fail_vm_creation = true;
    CHECK(has_code(Analyzer(metadata, &hooks).analyze("oom.nut", "").diagnostics,
                   "SQGI000"),
          "compiler VM creation failure is diagnosed");

    struct Case { ProtoMutation::Kind kind; const char *source; } cases[] = {
        {ProtoMutation::NoLines,
         "local X=import(\"Missing\"); X.Bad\n"},
        {ProtoMutation::BadLiteral,
         "local value = \"literal\"\n"},
        {ProtoMutation::NegativeLiteral, "local value=1\n"},
        {ProtoMutation::BadRegister,
         "local a=1; local b=2; local c=a+b\n"},
        {ProtoMutation::BadOuterRead,
         "local x=1; function f(){ return x }\n"},
        {ProtoMutation::NegativeOuterRead, "local value=1\n"},
        {ProtoMutation::InvalidLine,
         "local X=import(\"Missing\"); X.Bad\n"},
        {ProtoMutation::BadOuterWrite,
         "local x=1; function f(){ x=2 }\n"},
        {ProtoMutation::BadJump,
         "if (unknown) { local x=1 } else { local y=2 }\n"},
        {ProtoMutation::BadClosure,
         "local f=function(){ return 1 }\n"},
        {ProtoMutation::EmptyPrototype, "local value=1\n"},
        {ProtoMutation::ForceDMove, "local value=1\n"},
        {ProtoMutation::BadCapture,
         "local x=1; local f=function(){ return x }\n"},
    };
    for (const Case &test : cases) {
        ProtoMutation mutation;
        mutation.kind = test.kind;
        hooks = AnalyzerTestHooks();
        hooks.after_compile = mutate_and_restore;
        hooks.before_close = restore_prototype;
        hooks.data = &mutation;
        Analyzer defensive(metadata, &hooks);
        defensive.analyze("defensive.nut", test.source);
    }

    Analyzer regular(metadata);
    CHECK(regular.analyze("root.nut", "local imp = ::import\n").diagnostics.empty(),
          "explicit root lookup exercises LOADROOT");
    CHECK(regular.analyze("double-move.nut",
          "function f(a,b){ local x=a; local y=b; return x }\n").
              diagnostics.empty(),
          "paired moves exercise DMOVE when emitted");
    std::vector<std::pair<int, std::string>> column_probes = {
        {1, "local"}, {1, "missing-needle"}, {2, "outside-source"}
    };
    hooks = AnalyzerTestHooks();
    hooks.column_probes = &column_probes;
    CHECK(Analyzer(metadata, &hooks).analyze("column.nut", "local value=1").
              diagnostics.empty(),
          "source column helper covers found, absent, and out-of-range probes");
}

void test_analyzer_diagnostics()
{
    FakeMetadata metadata;
    Analyzer analyzer(metadata);
    struct Case { const char *source; const char *code; } cases[] = {
        {"local x = @\n", "SQGI001"},
        {"local X = import(\"Missing\")\n", "SQGI100"},
        {"local X=import(\"Fake\"); X.Widgit\n", "SQGI101"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\"); w.rnu(1)\n",
         "SQGI102"},
        {"local X=import(\"Fake\"); X.Widget.new()\n", "SQGI103"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\");"
         " w[\"titel\"] = 1\n", "SQGI104"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\");"
         " w.connect(\"raedy\", function(){})\n", "SQGI105"},
        {"local X=import(\"Fake\"); X.Mode.fats\n", "SQGI101"},
        {"local X=import(\"Fake\"); sqgi.new_object(X.Widget, { titel = 1 })\n",
         "SQGI104"},
        {"import()\n", "SQGI103"},
        {"import(\"Fake\", \"1.0\", \"extra\")\n", "SQGI103"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\");"
         " w.get_property(\"titel\")\n", "SQGI104"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\");"
         " w.set_property(\"titel\", 1)\n", "SQGI104"},
        {"local X=import(\"Fake\"); local w=X.Widget.new(\"x\");"
         " w.emit(\"raedy\")\n", "SQGI105"},
        {"sqgi.variadic()\n", "SQGI103"},
        {"sqgi.alternate(1)\n", "SQGI103"},
        {"local X=import(\"Fake\"); local f=X.Widget.new; f()\n", "SQGI103"},
    };
    for (const Case &test : cases) {
        SourceResult result = analyzer.analyze("bad.nut", test.source);
        CHECK(has_code(result.diagnostics, test.code),
              std::string("expected diagnostic ") + test.code);
    }

    SourceResult typo = analyzer.analyze(
        "typo.nut", "local X=import(\"Fake\"); X.Widgit\n");
    const Diagnostic *diagnostic = find_code(typo.diagnostics, "SQGI101");
    CHECK(diagnostic && diagnostic->help.find("Widget") != std::string::npos,
          "member typo has nearest suggestion");
    SourceResult tied = analyzer.analyze(
        "tie.nut", "local X=import(\"Fake\"); X.Wide\n");
    CHECK(!tied.diagnostics.empty() && tied.diagnostics[0].help.find("Mode") !=
              std::string::npos,
          "equal-distance suggestions choose the lexical candidate");

    SourceResult dynamic = analyzer.analyze(
        "dynamic.nut",
        "function dynamic(name) {\n"
        "local X = import(name)\n"
        "local key = \"anything\"\n"
        "X[key](1, 2, 3)\n"
        "}\n");
    CHECK(dynamic.diagnostics.empty(),
          "unknown dynamic values do not produce speculative diagnostics");

    const char *labels =
        "local X=import(\"Fake\")\n"
        "sqgi.missing\n"
        "local t={}; t.missing\n"
        "local v=1; v.missing\n";
    SourceResult labelled = analyzer.analyze("labels.nut", labels);
    CHECK(labelled.diagnostics.size() == 2 && labelled.unknown_count > 0,
          "SQGI module and generic labels are diagnosed while mutable tables stay open");

    CHECK(analyzer.analyze("computed.nut",
          "local X=import(\"Fake\"); local w=X.Widget.new(\"x\"); "
          "local k=1; local v=w[k]\n").diagnostics.empty(),
          "non-string member lookup stays conservative");
    CHECK(has_code(analyzer.analyze(
              "local-closure.nut", "local f=function(value) {}\nf()\n").
              diagnostics, "SQGI103"),
          "local script closure arity is checked");
    CHECK(analyzer.analyze(
              "global-merge.nut",
              "if (vargv.len() > 0) ::conditional_global <- 1\nreturn 1\n").
              diagnostics.empty(),
          "conditional script globals merge conservatively");
    CHECK(analyzer.analyze(
              "disjoint-global-merge.nut",
              "if (vargv.len() > 0) ::left_global <- import(\"Fake\")\n"
              "else ::right_global <- import(\"Fake\")\n"
              "left_global.Bad\nright_global.Bad\n").diagnostics.empty(),
          "globals missing from either branch widen before later member checks");
    CHECK(analyzer.analyze(
              "named-closure-copy.nut",
              "local holder = {}\nlocal f = function(value) {}\n"
              "holder.first <- f\nholder.second <- holder.first\n"
              "holder.second(1)\n").diagnostics.empty(),
          "copying a named closure preserves its callable shape");
    CHECK(analyzer.analyze(
              "dynamic-class-member.nut",
              "class Dynamic {}\nDynamic.extra <- function() {}\nDynamic.extra()\n").
              diagnostics.empty(),
          "members added to a script class after declaration remain callable");
    CHECK(analyzer.analyze(
              "nested-class-alias.nut",
              "class Dynamic {}\nlocal api = { Dynamic = Dynamic }\n"
              "api.Dynamic.extra <- function() {}\napi.Dynamic.extra()\n").
              diagnostics.empty(),
          "class mutations propagate through nested table aliases");
    CHECK(analyzer.analyze(
              "captured-class-alias.nut",
              "local Dynamic = class {}\nfunction extend() {\n"
              "  Dynamic.extra <- function() {}\n  Dynamic.extra()\n}\n").
              diagnostics.empty(),
          "class mutations propagate through captured outer aliases");
    CHECK(analyzer.analyze(
              "computed-class-slot.nut",
              "class Dynamic {}\nlocal key = vargv.len()\nDynamic[key] <- 1\n").
              diagnostics.empty(),
          "computed script-class slots stay conservative");
    AnalyzeOptions untracked_classes;
    Value untracked;
    untracked.kind = ValueKind::ScriptClass;
    untracked.members_known = true;
    untracked_classes.local_import_values["a.nut"] = untracked;
    untracked_classes.local_import_values["b.nut"] = untracked;
    SourceResult untracked_result = analyzer.analyze(
        "untracked-class-identity.nut",
        "local A = import(\"a.nut\")\nlocal B = import(\"b.nut\")\n"
        "A.extra <- function() {}\nA.extra()\nB.extra()\n",
        untracked_classes);
    CHECK(untracked_result.diagnostics.size() == 1 &&
              has_code(untracked_result.diagnostics, "SQGI101"),
          "caller-supplied classes without identity never alias each other");
    CHECK(analyzer.analyze(
              "loop-class-identity.nut",
              "local keep_going = vargv.len() > 0\nwhile (keep_going) {\n"
              "  class Revisited {}\n  keep_going = false\n}\n").
              diagnostics.empty(),
          "class identities remain stable when dataflow revisits an instruction");
    CHECK(has_code(analyzer.analyze("empty-member.nut",
          "local X=import(\"Fake\"); X[\"\"]\n").diagnostics, "SQGI101"),
          "empty literal member is diagnosed with a safe fallback column");
    CHECK(has_code(analyzer.analyze("member-column.nut",
          "local X=import(\"Fake\")\nX.Bad\n").diagnostics, "SQGI101"),
          "member diagnostics locate a needle on a nonfinal source line");
    CHECK(analyzer.analyze("valid-arities.nut",
          "sqgi.variadic(1,2,3); sqgi.alternate(1,2); "
          "sqgi.alternate(1,2,3,4); local X=import(\"Fake\", 1)\n").
              diagnostics.empty(),
          "variadic, alternate, and nonliteral-version call shapes are accepted");
    CHECK(analyzer.analyze("type-call.nut",
          "local X=import(\"Fake\")\nX.Widget()\n").diagnostics.empty(),
          "direct calls of known GI types remain analyzable");
    CHECK(analyzer.analyze("dynamic-call.nut", "local value=1; value()\n").
              diagnostics.empty(),
          "non-callable abstract values remain conservative at calls");
    CHECK(analyzer.analyze("helper-shapes.nut",
          "local X=import(\"Fake\"); local w=X.Widget.new(\"x\"); "
          "w.get_property(1); w.connect(1, function(){}); "
          "sqgi.new_object(1, {})\n").
              diagnostics.empty(),
          "nonliteral helper names and malformed new_object shapes stay conservative");
    CHECK(analyzer.analyze("numeric-property.nut",
          "local X=import(\"Fake\"); local w=X.Widget.new(\"x\"); w[1]=2\n").
              diagnostics.empty(),
          "numeric property assignment stays conservative");
    SourceResult duplicate = analyzer.analyze(
        "duplicate.nut", "local X=import(\"Fake\"); X.Bad; X.Bad\n");
    CHECK(duplicate.diagnostics.size() == 1,
          "identical same-line diagnostics are deduplicated");
    CHECK(has_code(analyzer.analyze("version-label.nut",
          "import(\"Missing\", \"9.9\")\n").diagnostics, "SQGI100"),
          "failed versioned imports include the requested version");

    const char *opcodes =
        "local X = import(\"Fake\")\n"
        "local w = X.Widget.new(\"x\")\n"
        "local a, b, c\n"
        "local one = 1, two = 2\n"
        "local large = 9223372036854775807\n"
        "local float_value = 1.25\n"
        "local key = \"run\"\n"
        "w[key](1)\n"
        "local member = w[key]\n"
        "local table = {}\n"
        "table[\"one\"] <- 1\n"
        "table[\"one\"] = 2\n"
        "local array = [1, 2, 3]\n"
        "local scalar = (one + two) * two / one % two\n"
        "scalar = scalar & one\n"
        "scalar = scalar == one ? -scalar : ~scalar\n"
        "local flags = (one < two) && (two > one) || false\n"
        "foreach (index, value in array) { scalar += value }\n"
        "try { if (!flags) throw \"no\" } catch (error) { scalar = 0 }\n"
        "local cloned = clone table\n"
        "local kind = typeof cloned\n"
        "local present = \"one\" in cloned\n"
        "class Base {}\n"
        "class Child extends Base {}\n"
        "local child = Child()\n"
        "local is_child = child instanceof Child\n"
        "function generator() { yield 1; return 2 }\n";
    CHECK(analyzer.analyze("opcodes.nut", opcodes).diagnostics.empty(),
          "broad bytecode families remain conservative and valid");
}

void test_nested_closures()
{
    FakeMetadata metadata;
    Analyzer analyzer(metadata);
    const char *source =
        "local X = import(\"Fake\")\n"
        "function outer(flag) {\n"
        "  local w = X.Widget.new(\"x\")\n"
        "  local cb = function() { w.run(1) }\n"
        "  if (flag)\n"
        "    cb()\n"
        "  else\n"
        "    w.run(2)\n"
        "}\n";
    CHECK(analyzer.analyze("closures.nut", source).diagnostics.empty(),
          "nested closures preserve imported outer values");

    const char *transitive =
        "local X = import(\"Fake\")\n"
        "local w = X.Widget.new(\"x\")\n"
        "function outer() {\n"
        "  function middle() {\n"
        "    function inner() { w = X.Widget.new(\"y\"); w.run(1) }\n"
        "    return inner\n"
        "  }\n"
        "  return middle\n"
        "}\n";
    CHECK(analyzer.analyze("transitive.nut", transitive).diagnostics.empty(),
          "transitive and mutated outer values are handled");

    const char *outer_merge =
        "local X=import(\"Fake\")\n"
        "local w=X.Widget.new(\"x\")\n"
        "function change(flag, other) { if (flag) w=other; else w=w; "
        "return function(){ return w } }\n";
    CHECK(analyzer.analyze("outer-merge.nut", outer_merge).diagnostics.empty(),
          "captured outer values merge to unknown across control flow");
    const char *outer_distinct_merge =
        "local X=import(\"Fake\")\n"
        "local w=X.Widget.new(\"x\")\n"
        "function change(flag) { if (flag) w=1; "
        "else w=X.Widget.new(\"y\"); w.anything() }\n";
    CHECK(analyzer.analyze("outer-distinct-merge.nut", outer_distinct_merge).
              diagnostics.empty(),
          "unequal captured-outer branch values merge conservatively");

    const char *merge =
        "local X = import(\"Fake\")\n"
        "function choose(flag, dynamic) {\n"
        "  local same\n"
        "  if (flag) same = X.Widget.new(\"a\")\n"
        "  else same = X.Widget.new(\"b\")\n"
        "  same.run(1)\n"
        "  local uncertain = flag ? same : dynamic\n"
        "  uncertain.anything()\n"
        "}\n";
    CHECK(analyzer.analyze("merge.nut", merge).diagnostics.empty(),
          "equal merges preserve types and unequal merges become unknown");

    SourceResult imports = analyzer.analyze(
        "/main.nut", "local helper = import(\"lib/helper.nut\")\n");
    CHECK(imports.imports.size() == 1 &&
              imports.imports[0].name == "lib/helper.nut",
          "literal local import discovered");
}

class MemoryFiles final : public FileSystem {
public:
    std::unordered_map<std::string, std::string> files;
    std::unordered_set<std::string> unreadable;

    bool read_file(const std::string &path, std::string *contents,
                   std::string *error) override
    {
        auto found = files.find(path);
        if (found == files.end() || unreadable.count(path)) {
            if (error) *error = "missing";
            return false;
        }
        *contents = found->second;
        return true;
    }

    bool exists(const std::string &path) override { return files.count(path) != 0; }

    std::string canonicalize(const std::string &path,
                             const std::string &base) override
    {
        return normalize((!path.empty() && path[0] == '/') ? path :
                         (base.empty() ? "/" : base + "/") + path);
    }

    std::string dirname(const std::string &path) override
    {
        size_t slash = path.find_last_of('/');
        return slash == 0 ? "/" : path.substr(0, slash);
    }

private:
    std::string normalize(const std::string &path)
    {
        std::vector<std::string> parts;
        size_t start = 0;
        while (start <= path.size()) {
            size_t slash = path.find('/', start);
            std::string part = path.substr(
                start, slash == std::string::npos ? std::string::npos : slash - start);
            if (part == ".." && !parts.empty()) parts.pop_back();
            else if (!part.empty() && part != ".") parts.push_back(part);
            if (slash == std::string::npos) break;
            start = slash + 1;
        }
        std::string result;
        for (const std::string &part : parts) result += "/" + part;
        return result.empty() ? "/" : result;
    }
};

void test_projects()
{
    FakeMetadata metadata;
    MemoryFiles files;
    files.files["/project/main.nut"] =
        "local h = import(\"lib/helper.nut\")\n";
    files.files["/project/lib/helper.nut"] =
        "local X = import(\"Fake\")\nX.Bad\n";
    ProjectChecker checker(metadata, files);
    CheckResult checked = checker.check({"/project/main.nut"});
    CHECK(checked.checked_files.size() == 2, "recursive project checks two files");
    CHECK(has_code(checked.diagnostics, "SQGI101"),
          "recursive import diagnostics included");
    CheckOptions shallow;
    shallow.recursive = false;

    files.files["/modules/base.nut"] =
        "class Base { function inherited(value) { return value } }\n"
        "class Thing extends Base {\n"
        "  static function create() { return Thing(\"made\") }\n"
        "  constructor(path) {}\n"
        "  function good(value = null) { return value }\n"
        "}\n"
        "return { Thing = Thing, make = function(value) { return value }, "
        "state = {} }\n";
    files.files["/modules/middle.nut"] =
        "local Base = import(\"base.nut\")\n"
        "return { Thing = Base.Thing, make = Base.make, state = Base.state }\n";
    files.files["/modules/valid.nut"] =
        "local M = import(\"middle.nut\")\n"
        "local thing = M.Thing(\"path\")\n"
        "thing.good()\n"
        "local good_method = thing.good\n"
        "thing.inherited(1)\n"
        "M.Thing.create()\n"
        "M.make(1)\n"
        "thing.good = null\n"
        "M.state.runtime_member\n";
    CheckResult module_valid = checker.check({"/modules/valid.nut"});
    CHECK(module_valid.checked_files.size() == 3,
          "module values propagate through a three-file import chain");
    CHECK(module_valid.diagnostics.empty(),
          "valid exported class, inherited method, function, and nested open table");

    files.files["/modules/anonymous.nut"] =
        "return class { constructor(value) {} function okay() {} }\n";
    files.files["/modules/anonymous-main.nut"] =
        "local Anonymous = import(\"anonymous.nut\")\n"
        "Anonymous.missing\n"
        "local instance = Anonymous()\n"
        "instance.missing()\n";
    CheckResult anonymous = checker.check({"/modules/anonymous-main.nut"});
    CHECK(anonymous.diagnostics.size() == 3 &&
              has_code(anonymous.diagnostics, "SQGI103") &&
              has_code(anonymous.diagnostics, "SQGI101") &&
              has_code(anonymous.diagnostics, "SQGI102"),
          "anonymous exported class labels static/instance misses and arity");
    files.files["/modules/instance-member-main.nut"] =
        "local Anonymous = import(\"anonymous.nut\")\n"
        "local instance = Anonymous(1)\ninstance.missing\n";
    CHECK(has_code(checker.check({"/modules/instance-member-main.nut"}).diagnostics,
                   "SQGI101"),
          "missing script-instance member access is distinct from a method call");

    files.files["/modules/anonymous-no-constructor.nut"] =
        "return class { function okay() {} }\n";
    files.files["/modules/anonymous-no-constructor-main.nut"] =
        "local Anonymous = import(\"anonymous-no-constructor.nut\")\n"
        "Anonymous(1)\n";
    CHECK(has_code(checker.check(
              {"/modules/anonymous-no-constructor-main.nut"}).diagnostics,
              "SQGI103"),
          "anonymous exported class without constructor rejects arguments");

    files.files["/modules/no-constructor.nut"] =
        "class NoConstructor { function okay() {} }\n"
        "return { NoConstructor = NoConstructor }\n";
    files.files["/modules/no-constructor-main.nut"] =
        "local M = import(\"no-constructor.nut\")\nM.NoConstructor(1)\n";
    CHECK(has_code(checker.check({"/modules/no-constructor-main.nut"}).diagnostics,
                   "SQGI103"),
          "exported class without constructor rejects arguments");

    files.files["/modules/variadic.nut"] =
        "return { call = function(...) { return vargv.len() } }\n";
    files.files["/modules/variadic-main.nut"] =
        "local M = import(\"variadic.nut\")\nM.call()\nM.call(1, 2, 3)\n";
    CHECK(checker.check({"/modules/variadic-main.nut"}).diagnostics.empty(),
          "exported variadic script function accepts zero and extra arguments");

    files.files["/modules/identity-a.nut"] =
        "class Thing {}\nreturn { Thing = Thing }\n";
    files.files["/modules/identity-b.nut"] =
        "class Thing {}\nreturn { Thing = Thing }\n";
    files.files["/modules/identity-main.nut"] =
        "local A = import(\"identity-a.nut\")\n"
        "local B = import(\"identity-b.nut\")\n"
        "A.Thing.extra <- function() {}\n"
        "A.Thing.extra()\nB.Thing.extra()\n";
    CheckResult identities = checker.check({"/modules/identity-main.nut"});
    CHECK(identities.diagnostics.size() == 1 &&
              has_code(identities.diagnostics, "SQGI101"),
          "module class identity propagates aliases without merging same-named classes");

    files.files["/modules/bad.nut"] =
        "local M = import(\"middle.nut\")\n"
        "local thing = M.Thing()\n"
        "thing.bad()\n"
        "thing.create()\n"
        "M.Thing.good()\n"
        "thing.inherited()\n"
        "M.Thing.create(1)\n"
        "M.make()\n"
        "M.missing()\n";
    CheckResult module_bad = checker.check({"/modules/bad.nut"});
    CHECK(module_bad.checked_files.size() == 3,
          "bad module consumer still traverses every dependency once");
    CHECK(std::count_if(module_bad.diagnostics.begin(), module_bad.diagnostics.end(),
                        [](const Diagnostic &diagnostic) {
                            return diagnostic.code == "SQGI103";
                        }) == 4,
          "module propagation checks constructor, function, static, and inherited arity");
    CHECK(std::count_if(module_bad.diagnostics.begin(), module_bad.diagnostics.end(),
                        [](const Diagnostic &diagnostic) {
                            return diagnostic.code == "SQGI101" ||
                                   diagnostic.code == "SQGI102";
                        }) == 4,
          "module propagation distinguishes missing exports, static, and instance members");
    CHECK(module_bad.unknown_count > 0,
          "module summary counts operations skipped after unknown results");
    CHECK(checker.check({"/modules/bad.nut"}).unknown_count ==
              module_bad.unknown_count,
          "unknown-operation summary is deterministic across runs");

    checked = checker.check({"/modules/bad.nut"}, shallow);
    CHECK(checked.checked_files.size() == 1 && checked.diagnostics.empty() &&
              checked.unknown_count > 0,
          "no-recursive mode leaves local-import values conservative");

    files.files["/modules/branch.nut"] =
        "local flag = vargv.len() > 0\n"
        "if (flag) return { one = 1 }\n"
        "return { two = 2 }\n";
    files.files["/modules/branch-main.nut"] =
        "local M = import(\"branch.nut\")\nM.missing\n";
    CHECK(checker.check({"/modules/branch-main.nut"}).diagnostics.empty(),
          "incompatible module returns widen instead of producing false positives");

    checked = checker.check({"/project/main.nut"}, shallow);
    CHECK(checked.checked_files.size() == 1, "no-recursive checks entry only");

    files.files["/missing-main.nut"] = "import(\"nope.nut\")\n";
    CHECK(has_code(checker.check({"/missing-main.nut"}).diagnostics, "SQGI110"),
          "missing local import diagnosed");

    files.files["/cycle/a.nut"] = "import(\"b.nut\")\n";
    files.files["/cycle/b.nut"] = "import(\"a.nut\")\n";
    CHECK(has_code(checker.check({"/cycle/a.nut"}).diagnostics, "SQGI111"),
          "local import cycle diagnosed");
    CheckResult cycle = checker.check({"/cycle/a.nut"});
    const Diagnostic *cycle_diagnostic = find_code(cycle.diagnostics, "SQGI111");
    CHECK(cycle_diagnostic && cycle_diagnostic->path == "/cycle/b.nut",
          "cycle diagnostic points at the importing file");
    CHECK(has_code(checker.check({"/absent.nut"}).diagnostics, "SQGI110"),
          "missing entry diagnosed");

    files.files["/absolute-main.nut"] = "import(\"/shared/absolute.nut\")\n";
    files.files["/shared/absolute.nut"] = "";
    CHECK(checker.check({"/absolute-main.nut"}).checked_files.size() == 2,
          "absolute local import resolved");

    files.files["/precedence/main.nut"] = "import(\"choice.nut\")\n";
    files.files["/choice.nut"] = "";
    files.files["/precedence/choice.nut"] =
        "local X=import(\"Fake\"); X.Bad\n";
    CHECK(checker.check({"/precedence/main.nut"}).diagnostics.empty(),
          "working-directory import wins over importer-relative file");

    files.files["/share-main/main.nut"] = "import(\"shared.nut\")\n";
    files.files["/app-share/shared.nut"] = "";
    g_setenv("SQGI_APP_SHARE", "/app-share", TRUE);
    CHECK(checker.check({"/share-main/main.nut"}).checked_files.size() == 2,
          "SQGI_APP_SHARE fallback resolved");
    g_unsetenv("SQGI_APP_SHARE");
    files.files["/share-missing/main.nut"] = "import(\"shared.nut\")\n";
    g_setenv("SQGI_APP_SHARE", "/missing-share", TRUE);
    CHECK(has_code(checker.check({"/share-missing/main.nut"}).diagnostics,
                   "SQGI110"),
          "missing SQGI_APP_SHARE candidate remains unresolved");
    g_unsetenv("SQGI_APP_SHARE");
    g_setenv("SQGI_APP_SHARE", "", TRUE);
    CHECK(has_code(checker.check({"/missing-main.nut"}).diagnostics, "SQGI110"),
          "empty SQGI_APP_SHARE does not resolve imports");
    g_unsetenv("SQGI_APP_SHARE");

    files.files["/duplicate/main.nut"] =
        "import(\"child.nut\")\nimport(\"child.nut\")\n";
    files.files["/duplicate/child.nut"] = "";
    CHECK(checker.check({"/duplicate/main.nut"}).checked_files.size() == 2,
          "duplicate imports checked once");

    files.files["/unreadable/main.nut"] = "import(\"child.nut\")\n";
    files.files["/unreadable/child.nut"] = "";
    files.unreadable.insert("/unreadable/child.nut");
    CheckResult unreadable = checker.check({"/unreadable/main.nut"});
    const Diagnostic *read_error = find_code(unreadable.diagnostics, "SQGI110");
    CHECK(read_error && read_error->path == "/unreadable/main.nut",
          "unreadable imported file points at importer");

    files.files["/sort/z.nut"] =
        "local X=import(\"Fake\"); X.Bad\nX.Widgit\n";
    files.files["/sort/a.nut"] =
        "local X=import(\"Fake\"); X.Bad\n";
    files.files["/sort/same.nut"] =
        "local X=import(\"Fake\"); X.Bad; X.Widgit\n";
    CheckResult sorted = checker.check({"/sort/z.nut", "/sort/a.nut"});
    CHECK(sorted.diagnostics.size() >= 3 &&
              sorted.diagnostics[0].path == "/sort/a.nut" &&
              sorted.diagnostics[1].line <= sorted.diagnostics[2].line,
          "project diagnostics have deterministic path and location order");
    CheckResult same = checker.check({"/sort/same.nut"});
    CHECK(same.diagnostics.size() == 2 &&
              same.diagnostics[0].code <= same.diagnostics[1].code,
          "same-line diagnostics sort by column and code");
}

void test_real_file_system()
{
    std::unique_ptr<FileSystem> files = make_real_file_system();
    CHECK(files->exists("CMakeLists.txt"), "real filesystem sees regular file");
    CHECK(!files->exists("tools/sqgicheck"),
          "real filesystem rejects directory as source file");
    std::string contents;
    std::string error;
    CHECK(files->read_file("CMakeLists.txt", &contents, &error) &&
              contents.find("project(sqgi") != std::string::npos,
          "real filesystem reads contents");
    CHECK(!files->read_file("/definitely/missing/sqgicheck.nut", &contents,
                            &error) && !error.empty(),
          "real filesystem returns read error");
    CHECK(!files->read_file("/definitely/missing/sqgicheck.nut", &contents,
                            nullptr),
          "real filesystem permits an omitted error destination");
    std::string empty_path_error;
    CHECK(!files->read_file("", &contents, &empty_path_error),
          "real filesystem handles an empty path failure");
    CHECK(files->canonicalize("../sqgi/CMakeLists.txt", "/tmp").find(
              "/sqgi/CMakeLists.txt") != std::string::npos,
          "real filesystem canonicalizes relative path");
    CHECK(files->dirname("/one/two.nut") == "/one",
          "real filesystem dirname");
}

void test_deterministic_metadata()
{
#ifndef SQGICHECK_HAS_TEST_TYPELIB
    std::cout << "SKIP: g-ir-compiler unavailable; deterministic typelib tests skipped\n";
    return;
#else
    std::unique_ptr<MetadataProvider> metadata = make_gi_metadata_provider();
    NamespaceResult fixture = metadata->load_namespace("SqgicheckTest", "1.0");
    CHECK(fixture.found && fixture.value.version == "1.0",
          "deterministic fixture typelib loads");
    CHECK(!metadata->load_namespace("SqgicheckTest", "9.9").found,
          "wrong fixture typelib version fails");

    NamespaceResult system = metadata->load_namespace("system", "");
    CHECK(system.found && system.value.kind == ValueKind::Namespace,
          "system built-in namespace loads");
    CHECK(metadata->lookup_member(system.value, "os", false).found,
          "system built-in member");
    CHECK(metadata->lookup_member(system.value, "oops", false).definite_missing,
          "missing system member");

    LookupResult root_import = metadata->lookup_member(Value::root(), "import", true);
    LookupResult root_sqgi = metadata->lookup_member(Value::root(), "sqgi", false);
    CHECK(root_import.found && root_import.value.kind == ValueKind::ImportFunction,
          "root import metadata");
    CHECK(root_sqgi.found && root_sqgi.value.kind == ValueKind::SqgiModule,
          "root sqgi metadata");
    CHECK(!metadata->lookup_member(Value::root(), "missing", false).found,
          "unknown root value remains conservative");

    LookupResult sleep = metadata->lookup_member(root_sqgi.value, "sleep", true);
    LookupResult json = metadata->lookup_member(root_sqgi.value, "json", false);
    CHECK(sleep.found && sleep.value.minimum_args == 1 &&
              sleep.value.maximum_args == 2,
          "SQGI built-in arity metadata");
    CHECK(json.found && json.value.kind == ValueKind::Table,
          "SQGI JSON helper table");
    CHECK(metadata->lookup_member(json.value, "parse", true).found,
          "table member lookup");
    CHECK(!metadata->lookup_member(json.value, "missing", false).found,
          "missing table member stays conservative");
    CHECK(!metadata->lookup_member(Value::unknown(), "missing", false).found,
          "unknown value dispatch stays conservative");
    CHECK(metadata->lookup_member(root_sqgi.value, "GError", false).found,
          "SQGI GError table");
    CHECK(metadata->lookup_member(root_sqgi.value, "sleap", false).definite_missing,
          "unknown SQGI built-in has candidates");

    LookupResult scalar = metadata->lookup_member(fixture.value, "scalar", true);
    LookupResult make_widget =
        metadata->lookup_member(fixture.value, "make_widget", true);
    LookupResult split = metadata->lookup_member(fixture.value, "split", true);
    LookupResult get_mode =
        metadata->lookup_member(fixture.value, "get_mode", true);
    LookupResult get_point =
        metadata->lookup_member(fixture.value, "get_point", true);
    LookupResult get_callback =
        metadata->lookup_member(fixture.value, "get_callback", true);
    LookupResult sum = metadata->lookup_member(fixture.value, "sum", true);
    LookupResult callback =
        metadata->lookup_member(fixture.value, "with_callback", true);
    CHECK(scalar.found && scalar.value.minimum_args == 1,
          "global scalar function and fixed arity");
    CHECK(sum.found && sum.value.minimum_args == 1 &&
              sum.value.alternate_args == 2,
          "array length is hidden with raw alternate arity");
    CHECK(callback.found && callback.value.minimum_args == 1 &&
              callback.value.alternate_args == 2,
          "callback closure data is hidden with raw alternate arity");
    CHECK(metadata->call_result(scalar.value, {Value::scalar()}).kind ==
              ValueKind::Scalar,
          "scalar return metadata");
    CHECK(metadata->call_result(make_widget.value, {}).kind == ValueKind::Instance,
          "object return metadata");
    CHECK(metadata->call_result(split.value, {Value::string("x")}).kind ==
              ValueKind::Unknown,
          "out-argument return remains conservative");
    CHECK(metadata->call_result(get_mode.value, {}).kind == ValueKind::Scalar,
          "enum return metadata is scalar");
    CHECK(metadata->call_result(get_point.value, {}).kind == ValueKind::Instance,
          "struct return metadata is an instance");
    CHECK(metadata->call_result(get_callback.value, {}).kind == ValueKind::Unknown,
          "callback return metadata remains unknown");

    LookupResult mode = metadata->lookup_member(fixture.value, "Mode", false);
    LookupResult options = metadata->lookup_member(fixture.value, "Options", false);
    CHECK(mode.found && mode.value.kind == ValueKind::Enum &&
              metadata->lookup_member(mode.value, "fast", false).found,
          "enum type and value");
    CHECK(options.found && options.value.kind == ValueKind::Enum &&
              metadata->lookup_member(options.value, "verbose", false).found,
          "flags type and value");
    CHECK(metadata->lookup_member(mode.value, "faster", false).definite_missing,
          "missing enum value");
    CHECK(metadata->lookup_member(fixture.value, "ANSWER", false).value.kind ==
              ValueKind::Scalar,
          "constant metadata");
    CHECK(metadata->lookup_member(fixture.value, "ReadyCallback", false).
              definite_missing,
          "runtime-hidden callback is not exposed");

    LookupResult widget = metadata->lookup_member(fixture.value, "Widget", false);
    LookupResult point = metadata->lookup_member(fixture.value, "Point", false);
    LookupResult named = metadata->lookup_member(fixture.value, "Named", false);
    CHECK(widget.found && point.found && named.found,
          "object, struct, and interface type metadata");
    LookupResult constructor = metadata->lookup_member(widget.value, "new", true);
    CHECK(constructor.found && constructor.value.constructor,
          "constructor flag and metadata");
    Value widget_instance = metadata->call_result(
        constructor.value, {Value::string("label")});
    CHECK(widget_instance.kind == ValueKind::Instance &&
              widget_instance.type_name == "Widget",
          "constructor result instance");
    CHECK(metadata->call_result(widget.value, {}).kind == ValueKind::Instance,
          "calling a type produces an instance");
    CHECK(metadata->lookup_member(widget_instance, "run", true).found,
          "own object method");
    CHECK(metadata->lookup_member(widget_instance, "parent_method", true).found,
          "inherited object method");
    CHECK(metadata->lookup_member(widget_instance, "get_name", true).found,
          "implemented-interface method");
    CHECK(metadata->lookup_member(widget_instance, "new", true).definite_missing,
          "constructor is not an instance method");
    CHECK(metadata->lookup_member(widget.value, "__gtype", false).found,
          "static __gtype helper");
    CHECK(metadata->lookup_member(widget_instance, "connect", true).found &&
              metadata->lookup_member(widget_instance, "disconnect", true).found &&
              metadata->lookup_member(widget_instance, "emit", true).found,
          "object signal helpers");
    CHECK(metadata->lookup_member(widget_instance, "title", false).found,
          "object property lookup outside call position");

    LookupResult async =
        metadata->lookup_member(widget_instance, "work_async", true);
    LookupResult async_raw =
        metadata->lookup_member(widget_instance, "work_async_raw", true);
    CHECK(async.found && async.value.async_wrapper &&
              async.value.minimum_args == -1,
          "async finish-pair wrapper is arity-conservative");
    CHECK(async_raw.found && !async_raw.value.async_wrapper,
          "raw async alias preserves GI callable");
    CHECK(metadata->lookup_member(widget_instance, "callback_full", true).value.
              alternate_args == 3,
          "callback closure and destroy arguments are hidden");
    CHECK(metadata->call_result(async.value, {}).kind == ValueKind::Unknown,
          "async wrapper result is unknown");

    LookupResult point_constructor = metadata->lookup_member(point.value, "new", true);
    Value point_instance = metadata->call_result(
        point_constructor.value, {Value::scalar(), Value::scalar()});
    CHECK(metadata->lookup_member(point_instance, "length", true).found,
          "struct instance method");
    CHECK(metadata->lookup_member(point_instance, "x", false).found,
          "struct field lookup");
    CHECK(metadata->lookup_member(point_instance, "missing", false).found == false,
          "missing struct field remains conservative outside call position");
    CHECK(metadata->lookup_member(point_instance, "missing", true).definite_missing,
          "missing struct method is definite and enumerates struct methods");
    CHECK(metadata->lookup_member(point.value, "missing", true).definite_missing,
          "missing static struct method enumerates constructors");

    std::vector<std::string> candidates;
    CHECK(metadata->has_property(widget_instance, "title", &candidates),
          "own object property");
    candidates.clear();
    CHECK(metadata->has_property(widget_instance, "parent-prop", &candidates),
          "inherited object property");
    CHECK(!metadata->has_property(widget_instance, "titel", &candidates),
          "missing object property");
    CHECK(!metadata->has_property(point_instance, "x", &candidates),
          "struct field is not a GObject property");
    CHECK(metadata->has_signal(widget_instance, "ready", &candidates),
          "own object signal");
    CHECK(metadata->has_signal(widget_instance, "parent-signal", &candidates),
          "inherited object signal");
    CHECK(metadata->has_signal(widget_instance, "renamed", &candidates),
          "implemented-interface signal");
    CHECK(metadata->has_signal(widget_instance, "notify", &candidates) &&
              metadata->has_signal(widget_instance, "notify::title", &candidates),
          "notify and detailed property signal");
    CHECK(!metadata->has_signal(widget_instance, "notify::titel", &candidates) &&
              !metadata->has_signal(point_instance, "ready", &candidates),
          "missing detailed and non-object signals");
    CHECK(!metadata->has_property(typed(ValueKind::Instance, "Nope", "Missing"),
                                  "title", nullptr) &&
              !metadata->has_signal(typed(ValueKind::Instance, "Nope", "Missing"),
                                    "ready", nullptr),
          "unknown GI types have no definite property or signal");
    CHECK(metadata->has_property(widget_instance, "title", nullptr) &&
              metadata->has_signal(widget_instance, "ready", nullptr),
          "property and signal lookups allow omitted candidate collection");

    Value dynamic = widget_instance;
    dynamic.text = "dynamic-subtype";
    CHECK(!metadata->lookup_member(dynamic, "plugin_specific", true).definite_missing,
          "dynamic subtype suppresses speculative missing member");
    CHECK(metadata->call_result(Value::unknown(), {}).kind == ValueKind::Unknown,
          "unknown call result remains unknown");
    Value sqgi_call = sleep.value;
    CHECK(metadata->call_result(sqgi_call, {}).kind == ValueKind::Unknown,
          "non-object SQGI helper result remains unknown");
    Value fake_callable = scalar.value;
    fake_callable.member_name = "not_in_typelib";
    CHECK(metadata->call_result(fake_callable, {}).kind == ValueKind::Unknown,
          "missing callable metadata remains unknown");
    Value fake_type_callable = constructor.value;
    fake_type_callable.type_name = "Missing";
    CHECK(metadata->call_result(fake_type_callable, {}).kind == ValueKind::Unknown,
          "callable on unknown GI type remains unknown");
    Value fake_enum = typed(ValueKind::Enum, "Nope", "Missing");
    CHECK(!metadata->lookup_member(fake_enum, "value", false).found,
          "unknown enum stays conservative");
    LookupResult new_object =
        metadata->lookup_member(root_sqgi.value, "new_object", true);
    CHECK(metadata->call_result(new_object.value, {widget.value}).kind ==
              ValueKind::Instance,
          "sqgi.new_object returns its known GI type");
    CHECK(metadata->call_result(new_object.value, {Value::scalar()}).kind ==
              ValueKind::Unknown,
          "sqgi.new_object with an unknown type remains unknown");

    NamespaceResult cairo = metadata->load_namespace("cairo", "1.0");
    if (cairo.found) {
        LookupResult context =
            metadata->lookup_member(cairo.value, "Context", false);
        LookupResult surface =
            metadata->lookup_member(cairo.value, "Surface", false);
        LookupResult image_create =
            metadata->lookup_member(cairo.value, "image_surface_create", true);
        CHECK(context.found && surface.found && image_create.found,
              "cairo namespace overlays");
        CHECK(metadata->lookup_member(context.value, "create", true).found,
              "cairo Context constructor overlay");
        CHECK(!metadata->lookup_member(surface.value, "create", true).found,
              "cairo type without member overlay remains conservative");
        Value fallback = cairo.value;
        fallback.namespace_name = "cairo";
        CHECK(metadata->lookup_member(fallback, "DefinitelyMissing", false).
                  definite_missing,
              "cairo missing-member candidates include overlays");
    } else {
        std::cout << "SKIP: cairo typelib unavailable\n";
    }
    Value cairo_overlay;
    cairo_overlay.kind = ValueKind::Namespace;
    cairo_overlay.namespace_name = "cairo";
    LookupResult overlay_only =
        metadata->lookup_member(cairo_overlay, "image_surface_create", true);
    CHECK(overlay_only.found && overlay_only.value.kind == ValueKind::Callable,
          "cairo callable overlay is available independently of GI entries");

    NamespaceResult gst = metadata->load_namespace("Gst", "1.0");
    if (gst.found) {
        LookupResult parse_launch =
            metadata->lookup_member(gst.value, "parse_launch", true);
        Value element = metadata->call_result(
            parse_launch.value, {Value::string("fakesrc")});
        CHECK(element.kind == ValueKind::Instance &&
                  element.text == "dynamic-subtype",
              "GStreamer parse factory result is dynamic");
        LookupResult factory =
            metadata->lookup_member(gst.value, "ElementFactory", false);
        LookupResult make = metadata->lookup_member(factory.value, "make", true);
        Value made = metadata->call_result(
            make.value, {Value::string("fakesrc"), Value::string("source")});
        CHECK(made.text == "dynamic-subtype",
              "GStreamer ElementFactory result is dynamic");
    } else {
        std::cout << "SKIP: Gst typelib unavailable\n";
    }
#endif
}

void test_real_metadata()
{
    std::unique_ptr<MetadataProvider> metadata = make_gi_metadata_provider();
    NamespaceResult gio = metadata->load_namespace("Gio", "2.0");
    CHECK(gio.found, "Gio namespace loads");
    NamespaceResult missing = metadata->load_namespace("DefinitelyMissingSqgi", "");
    CHECK(!missing.found && !missing.error.empty(), "missing GI reports error");
    Value unloaded = typed(ValueKind::Namespace, "DefinitelyUnloadedSqgi");
    CHECK(!metadata->lookup_member(unloaded, "Anything", false).found,
          "unregistered namespace lookup remains conservative");

    LookupResult file = metadata->lookup_member(gio.value, "File", false);
    CHECK(file.found && file.value.kind == ValueKind::Type, "Gio.File lookup");
    LookupResult typo = metadata->lookup_member(gio.value, "Fiel", false);
    CHECK(typo.definite_missing &&
              std::find(typo.candidates.begin(), typo.candidates.end(), "File") !=
                  typo.candidates.end(),
          "namespace candidates available");

    LookupResult constructor =
        metadata->lookup_member(file.value, "new_for_path", true);
    CHECK(constructor.found &&
              constructor.value.kind == ValueKind::Callable,
          "factory method metadata");
    Value instance = metadata->call_result(
        constructor.value, {Value::string("/tmp/x")});
    CHECK(instance.kind == ValueKind::Instance && instance.type_name == "File",
          "constructor return type");
    CHECK(metadata->lookup_member(instance, "get_path", true).found,
          "instance method");
    CHECK(metadata->lookup_member(instance, "get_paht", true).definite_missing,
          "missing instance method");

    Value application = typed(ValueKind::Instance, "Gio", "Application");
    std::vector<std::string> candidates;
    CHECK(metadata->has_property(application, "application-id", &candidates),
          "inherited property");
    CHECK(metadata->has_signal(application, "activate", &candidates),
          "object signal");
    CHECK(metadata->has_signal(application, "notify::application-id", &candidates),
          "detailed notify signal");

    LookupResult flags =
        metadata->lookup_member(gio.value, "ApplicationFlags", false);
    CHECK(flags.found && flags.value.kind == ValueKind::Enum, "flags table");
    CHECK(metadata->lookup_member(flags.value, "handles_command_line", false).found,
          "flags member");
}

void test_generated_robustness()
{
    FakeMetadata metadata;
    Analyzer analyzer(metadata);
    std::mt19937 random(0x53514749u);
    static const char alphabet[] =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        "{}[]().,:;+-*/%&|!~=<>?@#$\\\"' \t\n";
    for (int sample = 0; sample < 500; ++sample) {
        std::string source;
        size_t length = static_cast<size_t>(random() % 256);
        source.reserve(length);
        for (size_t i = 0; i < length; ++i)
            source.push_back(alphabet[random() % (sizeof(alphabet) - 1)]);
        SourceResult first = analyzer.analyze("generated.nut", source);
        SourceResult second = analyzer.analyze("generated.nut", source);
        CHECK(format_json(first.diagnostics) == format_json(second.diagnostics),
              "generated input produces deterministic diagnostics");
    }

    const std::string malformed_bytes("local x=\0\xff\xfe@\n", 14);
    CHECK(!analyzer.analyze("bytes.nut", malformed_bytes).diagnostics.empty(),
          "malformed byte input is rejected without a crash");

    std::string deep;
    for (int i = 0; i < 120; ++i)
        deep += "function f" + std::to_string(i) + "(){ return " +
                std::to_string(i) + " }\n";
    CHECK(analyzer.analyze("deep.nut", deep).diagnostics.empty(),
          "large generated prototype graph is accepted");

    MemoryFiles files;
    for (int i = 0; i < 100; ++i) {
        std::string current = "/deep/" + std::to_string(i) + ".nut";
        files.files[current] = i == 99 ? std::string() :
            "import(\"" + std::to_string(i + 1) + ".nut\")\n";
    }
    ProjectChecker checker(metadata, files);
    CHECK(checker.check({"/deep/0.nut"}).checked_files.size() == 100,
          "deep import graph is traversed deterministically");
}

} // namespace

int main()
{
    test_values_and_formatting();
    test_analyzer_happy_path();
    test_analyzer_defensive_paths();
    test_analyzer_diagnostics();
    test_nested_closures();
    test_projects();
    test_real_file_system();
    test_deterministic_metadata();
    test_real_metadata();
    test_generated_robustness();

    if (failures != 0) {
        std::cerr << failures << " sqgicheck test(s) failed\n";
        return 1;
    }
    std::cout << "sqgicheck unit tests passed\n";
    return 0;
}
