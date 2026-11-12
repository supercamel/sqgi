"""Build interdependent MinGW DLLs, then change a cached machine-file option."""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

SQGI = sys.argv.pop(1) if len(sys.argv) > 1 else os.environ.get('SQGI', 'sqgi')
FIXTURES = Path(__file__).resolve().parent
TOOLS = ('cmake', 'meson', 'ninja', 'x86_64-w64-mingw32-g++', 'wine')


@unittest.skipUnless(all(shutil.which(t) for t in TOOLS), 'MinGW, CMake, Meson and Wine required')
class WindowsRecipes(unittest.TestCase):
    def test_dll_linking_and_machine_file_updates(self):
        for system in ('meson', 'cmake'):
            with self.subTest(system=system), tempfile.TemporaryDirectory(prefix='sqgi-win-recipe-') as tmp:
                root = Path(tmp)
                source = root / 'source'
                source.mkdir()
                (source / 'core.cpp').write_text('''#include <stdexcept>
extern "C" int core_value() {
  try { throw std::runtime_error("core"); } catch (const std::exception&) { return TEST_VALUE; }
}
''')
                (source / 'consumer.cpp').write_text('''#include <stdexcept>
extern "C" int core_value();
extern "C" int consumer_value() {
  try { throw std::runtime_error("consumer"); } catch (const std::exception&) { return core_value(); }
}
''')
                (source / 'main.cpp').write_text('extern "C" int consumer_value();\nint main() { return consumer_value(); }\n')
                (source / 'meson.build').write_text('''project('dll-chain', 'cpp')
core = shared_library('core', 'core.cpp')
consumer = shared_library('consumer', 'consumer.cpp', link_with: core)
executable('probe', 'main.cpp', link_with: consumer)
''')
                (source / 'CMakeLists.txt').write_text('''cmake_minimum_required(VERSION 3.24)
project(dll_chain CXX)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(core SHARED core.cpp)
add_library(consumer SHARED consumer.cpp)
target_link_libraries(consumer PRIVATE core)
add_executable(probe main.cpp)
target_link_libraries(probe PRIVATE consumer)
''')
                env = dict(os.environ, WINEPREFIX=str(root / 'wine'), WINEARCH='win64',
                           WINEDEBUG='-all', WINEDLLOVERRIDES='mscoree,mshtml=')
                build = root / '.sqgipkg/build/windows-x86_64-ooblerg/fixture'
                try:
                    for value in (17, 23, 23):
                        subprocess.run([SQGI, str(FIXTURES / 'windows_recipe_build.nut'), tmp, system, str(value)],
                                       env=env, check=True, timeout=90)
                        observed = subprocess.run(['wine', str(build / 'probe.exe')], env=env, timeout=45)
                        self.assertEqual(observed.returncode, value, 'machine-file change must reach the running executable')
                        exports = subprocess.check_output(['x86_64-w64-mingw32-nm', '-g', str(build / 'libcore.dll.a')], text=True)
                        self.assertNotIn('_Unwind_Resume', exports, 'compiler runtime must remain private to each DLL')
                finally:
                    subprocess.run(['wineserver', '-k'], env=env, timeout=10, check=False)


if __name__ == '__main__':
    unittest.main()
