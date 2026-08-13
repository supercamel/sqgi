#include "sqgicheck.h"

#include <glib.h>

#include <algorithm>
#include <cstdlib>
#include <functional>
#include <sstream>
#include <unordered_set>

namespace sqgicheck {

namespace {

class RealFileSystem final : public FileSystem {
public:
    bool read_file(const std::string &path, std::string *contents,
                   std::string *error) override
    {
        gchar *data = nullptr;
        gsize length = 0;
        GError *gerror = nullptr;
        if (!g_file_get_contents(path.c_str(), &data, &length, &gerror)) {
            if (error) {
                *error = gerror && gerror->message ? gerror->message :
                    "could not read file";
            }
            if (gerror) g_error_free(gerror);
            return false;
        }
        contents->assign(data, static_cast<size_t>(length));
        g_free(data);
        return true;
    }

    bool exists(const std::string &path) override
    {
        return g_file_test(path.c_str(), G_FILE_TEST_IS_REGULAR);
    }

    std::string canonicalize(const std::string &path,
                             const std::string &base) override
    {
        gchar *canonical = g_canonicalize_filename(
            path.c_str(), base.empty() ? nullptr : base.c_str());
        std::string result = canonical ? canonical : path;
        g_free(canonical);
        return result;
    }

    std::string dirname(const std::string &path) override
    {
        gchar *directory = g_path_get_dirname(path.c_str());
        std::string result = directory ? directory : ".";
        g_free(directory);
        return result;
    }
};

bool diagnostic_less(const Diagnostic &left, const Diagnostic &right)
{
    if (left.path != right.path) return left.path < right.path;
    if (left.line != right.line) return left.line < right.line;
    if (left.column != right.column) return left.column < right.column;
    if (left.code != right.code) return left.code < right.code;
    return left.message < right.message;
}

std::string json_escape(const std::string &value)
{
    std::ostringstream output;
    for (unsigned char ch : value) {
        switch (ch) {
        case '"': output << "\\\""; break;
        case '\\': output << "\\\\"; break;
        case '\b': output << "\\b"; break;
        case '\f': output << "\\f"; break;
        case '\n': output << "\\n"; break;
        case '\r': output << "\\r"; break;
        case '\t': output << "\\t"; break;
        default:
            if (ch < 0x20) {
                static const char digits[] = "0123456789abcdef";
                output << "\\u00" << digits[(ch >> 4) & 0xf] << digits[ch & 0xf];
            } else {
                output << static_cast<char>(ch);
            }
        }
    }
    return output.str();
}

} // namespace

std::unique_ptr<FileSystem> make_real_file_system()
{
    return std::unique_ptr<FileSystem>(new RealFileSystem());
}

ProjectChecker::ProjectChecker(MetadataProvider &metadata, FileSystem &files)
    : metadata_(metadata), files_(files)
{
}

CheckResult ProjectChecker::check(const std::vector<std::string> &paths,
                                  const CheckOptions &options)
{
    CheckResult result;
    std::unordered_set<std::string> visited;
    std::unordered_set<std::string> active;
    std::unordered_map<std::string, Value> module_values;
    Analyzer analyzer(metadata_);

    auto append_file_error = [&](const std::string &path, int line, int column,
                                 const std::string &code,
                                 const std::string &message,
                                 const std::string &help) {
        Diagnostic diagnostic;
        diagnostic.path = path;
        diagnostic.line = line;
        diagnostic.column = column;
        diagnostic.code = code;
        diagnostic.message = message;
        diagnostic.help = help;
        result.diagnostics.push_back(std::move(diagnostic));
    };

    std::function<Value(const std::string &, const std::string &,
                        const ImportReference *)> visit;
    visit = [&](const std::string &requested, const std::string &from_path,
                const ImportReference *from) {
        std::string canonical = files_.canonicalize(requested, "");
        if (active.count(canonical)) {
            append_file_error(from ? from_path : canonical,
                              from ? from->line : 1,
                              from ? from->column : 1,
                              "SQGI111", "local import cycle reaches '" + canonical + "'",
                              "break the cycle or move shared values into a third module");
            return Value::unknown();
        }
        if (visited.count(canonical)) return module_values[canonical];

        std::string source;
        std::string error;
        if (!files_.read_file(canonical, &source, &error)) {
            append_file_error(from ? from_path : canonical,
                              from ? from->line : 1,
                              from ? from->column : 1,
                              "SQGI110", "could not read Squirrel source '" + canonical + "'",
                              error);
            return Value::unknown();
        }

        active.insert(canonical);
        result.checked_files.push_back(canonical);
        SourceResult discovery = analyzer.analyze(canonical, source);
        AnalyzeOptions analyze_options;

        if (options.recursive) {
            for (const ImportReference &reference : discovery.imports) {
                std::string resolved;
                if (g_path_is_absolute(reference.name.c_str())) {
                    resolved = files_.canonicalize(reference.name, "");
                } else {
                    std::string from_cwd = files_.canonicalize(reference.name, "");
#ifdef SQGICHECK_MUTATE_RESOLUTION_PRECEDENCE
                    std::string from_importer = files_.canonicalize(
                        reference.name, files_.dirname(canonical));
                    std::swap(from_cwd, from_importer);
#endif
                    if (files_.exists(from_cwd)) {
                        resolved = from_cwd;
                    } else {
                        resolved = files_.canonicalize(
                            reference.name, files_.dirname(canonical));
                        if (!files_.exists(resolved)) {
                            const char *share = std::getenv("SQGI_APP_SHARE");
                            if (share && *share) {
                                std::string from_share =
                                    files_.canonicalize(reference.name, share);
                                if (files_.exists(from_share)) resolved = from_share;
                            }
                        }
                    }
                }

                if (resolved.empty() || !files_.exists(resolved)) {
                    append_file_error(canonical, reference.line, reference.column,
                                      "SQGI110",
                                      "local import '" + reference.name +
                                          "' could not be resolved",
                                      "checked the working directory, importing file, "
                                      "and SQGI_APP_SHARE");
                    continue;
                }
                analyze_options.local_import_values[reference.name] =
                    visit(resolved, canonical, &reference);
            }
        }
        SourceResult source_result = analyzer.analyze(
            canonical, source, analyze_options);
        result.diagnostics.insert(result.diagnostics.end(),
                                  source_result.diagnostics.begin(),
                                  source_result.diagnostics.end());
        result.unknown_count += source_result.unknown_count;
        module_values[canonical] = source_result.return_value;
        active.erase(canonical);
        visited.insert(canonical);
        return source_result.return_value;
    };

    for (const std::string &path : paths)
        (void)visit(path, std::string(), nullptr);

    std::sort(result.diagnostics.begin(), result.diagnostics.end(), diagnostic_less);
    std::sort(result.checked_files.begin(), result.checked_files.end());
    return result;
}

std::string format_text(const std::vector<Diagnostic> &diagnostics)
{
    std::ostringstream output;
    for (const Diagnostic &diagnostic : diagnostics) {
        output << diagnostic.path << ':' << diagnostic.line << ':'
               << diagnostic.column << ": "
               << (diagnostic.severity == Severity::Error ? "error" : "warning")
               << ' ' << diagnostic.code << ": " << diagnostic.message << '\n';
        if (!diagnostic.help.empty())
            output << "  help: " << diagnostic.help << '\n';
    }
    return output.str();
}

std::string format_json(const std::vector<Diagnostic> &diagnostics)
{
    std::ostringstream output;
    output << '[';
    for (size_t i = 0; i < diagnostics.size(); ++i) {
        if (i != 0) output << ',';
        const Diagnostic &diagnostic = diagnostics[i];
        output << "{\"path\":\"" << json_escape(diagnostic.path)
               << "\",\"line\":" << diagnostic.line
               << ",\"column\":" << diagnostic.column
               << ",\"severity\":\""
               << (diagnostic.severity == Severity::Error ? "error" : "warning")
               << "\",\"code\":\"" << json_escape(diagnostic.code)
               << "\",\"message\":\"" << json_escape(diagnostic.message)
               << "\",\"help\":\"" << json_escape(diagnostic.help) << "\"}";
    }
    output << "]\n";
    return output.str();
}

std::string format_summary(const CheckResult &result)
{
    std::ostringstream output;
    output << "sqgicheck: checked " << result.checked_files.size() << ' '
           << (result.checked_files.size() == 1 ? "file" : "files") << "; "
           << result.diagnostics.size() << ' '
           << (result.diagnostics.size() == 1 ? "diagnostic" : "diagnostics")
           << "; " << result.unknown_count << ' '
           << (result.unknown_count == 1 ? "check" : "checks")
           << " skipped for unknown values\n";
    return output.str();
}

bool has_errors(const std::vector<Diagnostic> &diagnostics)
{
    return std::any_of(diagnostics.begin(), diagnostics.end(),
                       [](const Diagnostic &diagnostic) {
                           return diagnostic.severity == Severity::Error;
                       });
}

bool diagnostic_less_for_test(const Diagnostic &left, const Diagnostic &right)
{
    return diagnostic_less(left, right);
}

} // namespace sqgicheck
