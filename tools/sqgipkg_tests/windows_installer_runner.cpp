#include <windows.h>
#include <string>

// NSIS /D= and _?= consume an unquoted final tail, including its spaces.
int wmain(int argc, wchar_t **argv) {
    if (argc != 4) return 90;
    std::wstring mode = argv[2];
    if (mode != L"install" && mode != L"uninstall") return 91;
    std::wstring command = L"\"" + std::wstring(argv[1]) + L"\" /S " +
        (mode == L"install" ? L"/D=" : L"_?=") + argv[3];
    STARTUPINFOW startup{};
    startup.cb = sizeof(startup);
    PROCESS_INFORMATION child{};
    if (!CreateProcessW(argv[1], command.data(), nullptr, nullptr, FALSE, 0,
                        nullptr, nullptr, &startup, &child)) return 92;
    CloseHandle(child.hThread);
    DWORD status = 94;
    if (WaitForSingleObject(child.hProcess, 45000) == WAIT_OBJECT_0)
        GetExitCodeProcess(child.hProcess, &status);
    else { TerminateProcess(child.hProcess, 93); status = 93; }
    CloseHandle(child.hProcess);
    return static_cast<int>(status);
}
