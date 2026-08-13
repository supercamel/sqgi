#ifndef SQGICHECK_H
#define SQGICHECK_H

#include <memory>
#include <utility>
#include <string>
#include <unordered_map>
#include <vector>

struct SQFunctionProto;

namespace sqgicheck {

enum class Severity {
    Warning,
    Error,
};

struct Diagnostic {
    std::string path;
    int line = 1;
    int column = 1;
    Severity severity = Severity::Error;
    std::string code;
    std::string message;
    std::string help;
};

struct ImportReference {
    std::string name;
    int line = 1;
    int column = 1;
};

enum class ValueKind {
    Unknown,
    Scalar,
    String,
    Root,
    SqgiModule,
    ImportFunction,
    Namespace,
    Type,
    Instance,
    Enum,
    Callable,
    Table,
    Closure,
    ScriptClass,
    ScriptInstance,
};

struct Value {
    ValueKind kind = ValueKind::Unknown;
    std::string text;
    std::string namespace_name;
    std::string type_name;
    std::string member_name;
    std::string version;
    int minimum_args = -1;
    int maximum_args = -1;
    int alternate_args = -1;
    bool constructor = false;
    bool async_wrapper = false;
    bool members_known = false;
    std::string script_identity;
    SQFunctionProto *closure = nullptr;
    std::vector<Value> closure_outers;
    std::unordered_map<std::string, Value> fields;
    std::unordered_map<std::string, Value> instance_fields;

    static Value unknown();
    static Value scalar();
    static Value string(std::string value);
    static Value root();

    bool operator==(const Value &other) const;
    bool operator!=(const Value &other) const { return !(*this == other); }
};

struct LookupResult {
    bool found = false;
    bool definite_missing = false;
    Value value;
    std::vector<std::string> candidates;
};

struct NamespaceResult {
    bool found = false;
    Value value;
    std::string error;
};

class MetadataProvider {
public:
    virtual ~MetadataProvider() = default;

    virtual NamespaceResult load_namespace(const std::string &name,
                                            const std::string &version) = 0;
    virtual LookupResult lookup_member(const Value &base,
                                       const std::string &name,
                                       bool for_call) = 0;
    virtual Value call_result(const Value &callable,
                              const std::vector<Value> &arguments) = 0;
    virtual bool has_property(const Value &instance,
                              const std::string &name,
                              std::vector<std::string> *candidates) = 0;
    virtual bool has_signal(const Value &instance,
                            const std::string &name,
                            std::vector<std::string> *candidates) = 0;
};

std::unique_ptr<MetadataProvider> make_gi_metadata_provider();

struct SourceResult {
    std::vector<Diagnostic> diagnostics;
    std::vector<ImportReference> imports;
    Value return_value;
    size_t unknown_count = 0;
};

struct AnalyzeOptions {
    std::unordered_map<std::string, Value> local_import_values;
};

// Narrow fault-injection hooks for validating defensive compiler-boundary
// behavior. Production callers use the default null hooks.
struct AnalyzerTestHooks {
    bool fail_vm_creation = false;
    void (*after_compile)(SQFunctionProto *prototype, void *data) = nullptr;
    void (*before_close)(SQFunctionProto *prototype, void *data) = nullptr;
    void *data = nullptr;
    // Optional source-location probes used only by the native defensive suite.
    std::vector<std::pair<int, std::string>> *column_probes = nullptr;
};

class Analyzer {
public:
    explicit Analyzer(MetadataProvider &metadata,
                      const AnalyzerTestHooks *test_hooks = nullptr);
    SourceResult analyze(const std::string &path, const std::string &source,
                         const AnalyzeOptions &options = AnalyzeOptions());

private:
    MetadataProvider &metadata_;
    const AnalyzerTestHooks *test_hooks_;
};

class FileSystem {
public:
    virtual ~FileSystem() = default;
    virtual bool read_file(const std::string &path, std::string *contents,
                           std::string *error) = 0;
    virtual bool exists(const std::string &path) = 0;
    virtual std::string canonicalize(const std::string &path,
                                     const std::string &base) = 0;
    virtual std::string dirname(const std::string &path) = 0;
};

std::unique_ptr<FileSystem> make_real_file_system();

struct CheckOptions {
    bool recursive = true;
};

struct CheckResult {
    std::vector<Diagnostic> diagnostics;
    std::vector<std::string> checked_files;
    size_t unknown_count = 0;
};

class ProjectChecker {
public:
    ProjectChecker(MetadataProvider &metadata, FileSystem &files);
    CheckResult check(const std::vector<std::string> &paths,
                      const CheckOptions &options = CheckOptions());

private:
    MetadataProvider &metadata_;
    FileSystem &files_;
};

std::string format_text(const std::vector<Diagnostic> &diagnostics);
std::string format_json(const std::vector<Diagnostic> &diagnostics);
std::string format_summary(const CheckResult &result);
bool has_errors(const std::vector<Diagnostic> &diagnostics);
bool diagnostic_less_for_test(const Diagnostic &left, const Diagnostic &right);

} // namespace sqgicheck

#endif
