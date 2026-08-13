#include "sqgicheck.h"

#include <iostream>
#include <string>
#include <vector>

#ifndef SQGI_VERSION
#define SQGI_VERSION "unknown"
#endif

namespace {

void print_usage(std::ostream &output)
{
    output <<
        "Usage: sqgicheck [options] FILE...\n"
        "\n"
        "Statically check Squirrel source with SQGI and GI metadata without\n"
        "executing the program.\n"
        "\n"
        "Options:\n"
        "  --format=FORMAT  Diagnostic format: text (default) or json\n"
        "  --summary        Report files, diagnostics, and unknown-value skips\n"
        "  --recursive     Check literal local .nut imports (default)\n"
        "  --no-recursive  Check only files named on the command line\n"
        "  -v, --version   Print version and exit\n"
        "  -h, --help      Show this message and exit\n";
}

} // namespace

int main(int argc, char **argv)
{
    std::string format = "text";
    sqgicheck::CheckOptions options;
    std::vector<std::string> paths;
    bool positional_only = false;
    bool summary = false;

    for (int i = 1; i < argc; ++i) {
        std::string argument = argv[i];
        if (!positional_only && argument == "--") {
            positional_only = true;
        } else if (!positional_only &&
                   (argument == "--help" || argument == "-h")) {
            print_usage(std::cout);
            return 0;
        } else if (!positional_only &&
                   (argument == "--version" || argument == "-v")) {
            std::cout << "sqgicheck " << SQGI_VERSION << '\n';
            return 0;
        } else if (!positional_only && argument == "--recursive") {
            options.recursive = true;
        } else if (!positional_only && argument == "--no-recursive") {
            options.recursive = false;
        } else if (!positional_only && argument == "--summary") {
            summary = true;
        } else if (!positional_only && argument == "--format") {
            if (i + 1 >= argc) {
                std::cerr << "sqgicheck: --format requires text or json\n";
                return 2;
            }
            format = argv[++i];
        } else if (!positional_only && argument.compare(0, 9, "--format=") == 0) {
            format = argument.substr(9);
        } else if (!positional_only && !argument.empty() && argument[0] == '-') {
            std::cerr << "sqgicheck: unknown option: " << argument << '\n';
            return 2;
        } else {
            paths.push_back(argument);
        }
    }

    if (format != "text" && format != "json") {
        std::cerr << "sqgicheck: unknown diagnostic format: " << format << '\n';
        return 2;
    }
    if (paths.empty()) {
        std::cerr << "sqgicheck: no input files\n";
        print_usage(std::cerr);
        return 2;
    }

    std::unique_ptr<sqgicheck::MetadataProvider> metadata =
        sqgicheck::make_gi_metadata_provider();
    std::unique_ptr<sqgicheck::FileSystem> files =
        sqgicheck::make_real_file_system();
    sqgicheck::ProjectChecker checker(*metadata, *files);
    sqgicheck::CheckResult result = checker.check(paths, options);

    if (format == "json")
        std::cout << sqgicheck::format_json(result.diagnostics);
    else
        std::cout << sqgicheck::format_text(result.diagnostics);
    if (summary) std::cerr << sqgicheck::format_summary(result);
#ifdef SQGICHECK_MUTATE_EXIT_STATUS
    return sqgicheck::has_errors(result.diagnostics) ? 0 : 1;
#else
    return sqgicheck::has_errors(result.diagnostics) ? 1 : 0;
#endif
}
