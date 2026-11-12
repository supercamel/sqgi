// Executed Windows child/helper fixture; inspect the bootstrap boundary.
#include <windows.h>
#include <cstdio>
#include <string>
#include <vector>
static std::wstring env(const wchar_t *key) {
    DWORD n = GetEnvironmentVariableW(key, nullptr, 0);
    if (!n) return {};
    std::vector<wchar_t> b(n); GetEnvironmentVariableW(key, b.data(), n);
    return b.data();
}
static std::string json(const std::wstring &text) {
    int n = WideCharToMultiByte(CP_UTF8, 0, text.data(), int(text.size()), nullptr, 0, nullptr, nullptr);
    std::string utf8(n, 0), out = "\"";
    WideCharToMultiByte(CP_UTF8, 0, text.data(), int(text.size()), utf8.data(), n, nullptr, nullptr);
    for (unsigned char c : utf8) {
        if (c == '"' || c == '\\') { out += '\\'; out += c; }
        else if (c < 32) { char b[7]; std::snprintf(b, sizeof(b), "\\u%04x", c); out += b; }
        else out += c;
    }
    return out + '"';
}
int wmain(int argc, wchar_t **argv) {
    if (std::wstring(argv[0]).find(L"detached-launch") != std::wstring::npos) {
        if (argc != 2) return 26;
        std::wstring command = L"\"" + std::wstring(argv[1]) + L"\"";
        STARTUPINFOW startup{}; startup.cb = sizeof(startup);
        PROCESS_INFORMATION child{};
        if (!CreateProcessW(argv[1], command.data(), nullptr, nullptr, FALSE,
                            DETACHED_PROCESS, nullptr, nullptr, &startup, &child)) return 27;
        CloseHandle(child.hThread);
        WaitForSingleObject(child.hProcess, INFINITE);
        DWORD code = 1; GetExitCodeProcess(child.hProcess, &code); CloseHandle(child.hProcess);
        return int(code);
    }
    auto cache = env(L"GDK_PIXBUF_MODULE_FILE");
    if (std::wstring(argv[0]).find(L"query-loaders") != std::wstring::npos) {
        if (!env(L"GDK_PIXBUF_MODULEDIR").empty()) return 28;
        if (env(L"SQGIPKG_TEST_CACHE_HANG") == L"yes") Sleep(INFINITE);
        if (env(L"SQGIPKG_TEST_CACHE_FAIL") == L"yes") return 23;
        if (env(L"SQGIPKG_TEST_CACHE_EMPTY") == L"yes") return 0;
        FILE *f = _wfopen(cache.c_str(), L"wb"); if (!f) return 24;
        std::fputs("test image-loader cache\n", f); std::fclose(f); return 0;
    }
    wchar_t cwd[32768]; GetCurrentDirectoryW(32768, cwd);
    std::string result = "{\"cwd\":" + json(cwd) + ",\"args\":[";
    for (int i = 1; i < argc; ++i) { if (i > 1) result += ','; result += json(argv[i]); }
    result += "],\"cache\":" + json(cache) + ",\"cache_present\":";
    result += GetFileAttributesW(cache.c_str()) == INVALID_FILE_ATTRIBUTES ? "false" : "true";
    result += ",\"env\":{";
    bool first = true;
    for (auto key : {L"SQGI", L"GI_TYPELIB_PATH", L"GDK_BACKEND", L"GDK_PIXBUF_MODULEDIR",
                    L"GST_PLUGIN_PATH_1_0", L"GSETTINGS_SCHEMA_DIR", L"PATH"}) {
        if (!first) result += ',';
        first = false; result += json(key) + ":" + json(env(key));
    }
    result += "}}";
    FILE *f = _wfopen(env(L"SQGIPKG_TEST_REPORT").c_str(), L"wb"); if (!f) return 25;
    std::fwrite(result.data(), 1, result.size(), f); std::fclose(f);
    if (env(L"SQGIPKG_TEST_WAIT") == L"yes") Sleep(700);
    return int(std::wcstol(env(L"SQGIPKG_TEST_EXIT").c_str(), nullptr, 10));
}
