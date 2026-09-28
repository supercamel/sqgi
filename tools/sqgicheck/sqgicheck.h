#ifndef SQGICHECK_H
#define SQGICHECK_H

#include <initializer_list>
#include <memory>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>

struct SQFunctionProto;

namespace sqgicheck {

// Abstract values are copied at every control-flow edge and closure capture.
// Keep their recursive containers shared until an analyzer operation mutates
// one, so a closure capturing a table of earlier closures stores a DAG rather
// than repeatedly duplicating the whole graph.
template <typename Container>
class SharedContainer {
public:
    using value_type = typename Container::value_type;
    using iterator = typename Container::iterator;
    using const_iterator = typename Container::const_iterator;

    SharedContainer() : data_(std::make_shared<Container>()) {}
    SharedContainer(const Container &value)
        : data_(std::make_shared<Container>(value)) {}
    SharedContainer(Container &&value)
        : data_(std::make_shared<Container>(std::move(value))) {}
    SharedContainer(std::initializer_list<value_type> values)
        : data_(std::make_shared<Container>(values)) {}

    SharedContainer &operator=(const Container &value)
    { data_ = std::make_shared<Container>(value); return *this; }
    SharedContainer &operator=(Container &&value)
    { data_ = std::make_shared<Container>(std::move(value)); return *this; }
    SharedContainer &operator=(std::initializer_list<value_type> values)
    { data_ = std::make_shared<Container>(values); return *this; }

    iterator begin() { return writable().begin(); }
    iterator end() { return writable().end(); }
    const_iterator begin() const { return data_->begin(); }
    const_iterator end() const { return data_->end(); }
    const_iterator cbegin() const { return data_->cbegin(); }
    const_iterator cend() const { return data_->cend(); }
    template <typename C = Container>
    auto find(const typename C::key_type &key)
        -> decltype(std::declval<C &>().find(key))
    { return writable().find(key); }
    template <typename C = Container>
    auto find(const typename C::key_type &key) const
        -> decltype(std::declval<const C &>().find(key))
    { return data_->find(key); }
    template <typename C = Container>
    auto operator[](const typename C::key_type &key)
        -> decltype(std::declval<C &>()[key])
    { return writable()[key]; }
    void clear() { writable().clear(); }
    size_t size() const { return data_->size(); }
    bool empty() const { return data_->empty(); }
    const Container &get() const { return *data_; }
    operator const Container &() const { return *data_; }

    bool operator==(const SharedContainer &other) const
    { return data_ == other.data_ || *data_ == *other.data_; }
    bool operator!=(const SharedContainer &other) const { return !(*this == other); }

private:
    Container &writable()
    {
        if (!data_.unique()) data_ = std::make_shared<Container>(*data_);
        return *data_;
    }
    std::shared_ptr<Container> data_;
};

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
    SharedContainer<std::vector<Value>> closure_outers;
    SharedContainer<std::unordered_map<std::string, Value>> fields;
    SharedContainer<std::unordered_map<std::string, Value>> instance_fields;

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
