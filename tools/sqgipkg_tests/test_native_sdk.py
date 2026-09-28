#!/usr/bin/env python3
"""Compile a consumer using private recipe exports; verify isolation and reset."""
import importlib.util
import json
import os
from pathlib import Path
import shlex
import shutil
import subprocess
import sys
import tempfile
import unittest

HELPER = Path(__file__).resolve().parents[1] / 'sqgipkg_lib/native_sdk.py'
spec = importlib.util.spec_from_file_location('native_sdk', HELPER)
sdk = importlib.util.module_from_spec(spec); spec.loader.exec_module(sdk)

class NativeSDK(unittest.TestCase):
    def test_ooblerg_overlay_preserves_base_and_rejects_collisions(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);base=root/'base';base.mkdir();overlay=root/'sdk';sdk.initialize(base,overlay)
            bundle=root/'bundle';path=bundle/'usr/include/serial.h';path.parent.mkdir(parents=True);path.write_text('int serial(void);')
            marker={'packages':[{'files':['usr/include/serial.h']}]}
            (bundle/'.sqgipkg-ooblerg.json').write_text(json.dumps(marker))
            command=[sys.executable,str(HELPER),'overlay','--root',str(overlay),'--package-root',str(bundle)]
            subprocess.run(command,check=True,capture_output=True)
            self.assertFalse((base/'usr').exists())
            self.assertEqual((overlay/'usr/include/serial.h').read_text(),path.read_text())
            path.write_text('different')
            failed=subprocess.run(command,capture_output=True,text=True)
            self.assertNotEqual(failed.returncode,0)
            self.assertIn('Conflicting',failed.stderr)
            self.assertEqual((overlay/'usr/include/serial.h').read_text(),'int serial(void);')

    @unittest.skipUnless(shutil.which('pkg-config'), 'pkg-config required')
    def test_ooblerg_relative_include_relocation_records_original(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);base=root/'base';base.mkdir();overlay=root/'sdk';sdk.initialize(base,overlay)
            bundle=root/'bundle';pc=bundle/'usr/lib/pkgconfig/scene.pc';pc.parent.mkdir(parents=True)
            original='prefix=/usr\nincludedir=${prefix}/include\nName: scene\nDescription: scene\nVersion: 1\nCflags: -I${includedir} -Iinclude/scene\n'
            pc.write_text(original)
            (bundle/'.sqgipkg-ooblerg.json').write_text(json.dumps({'packages':[{'files':['usr/lib/pkgconfig/scene.pc']}]}))
            sdk.overlay_packages(overlay,bundle);sdk.overlay_packages(overlay,bundle)
            env=dict(os.environ,PKG_CONFIG_PATH='',PKG_CONFIG_LIBDIR=str(overlay/'usr/lib/pkgconfig'),PKG_CONFIG_SYSROOT_DIR=str(overlay))
            flags=shlex.split(subprocess.check_output(['pkg-config','--cflags','scene'],env=env,text=True))
            self.assertIn('-I'+str(overlay/'usr/include/scene'),flags)
            self.assertNotIn('-Iinclude/scene',flags)
            self.assertEqual(pc.read_text(),original)
            self.assertFalse((base/'usr').exists())
            adjustment=json.loads((overlay/sdk.MARKER).read_text())['ooblerg_adjustments']['usr/lib/pkgconfig/scene.pc']
            self.assertEqual(adjustment['source_sha256'],sdk.digest(pc))
            self.assertNotEqual(adjustment['source_sha256'],adjustment['normalized_sha256'])

    @unittest.skipUnless(all(shutil.which(name) for name in ['cmake','cc','pkg-config']), 'CMake build tools required')
    def test_cmake_install_exports_compilable_dependency(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);base=root/'base';base.mkdir();overlay=root/'sdk';sdk.initialize(base,overlay)
            source=root/'source';source.mkdir();build=root/'build'
            (source/'value.c').write_text('int cmake_value(void) { return 17; }\n')
            (source/'value.h').write_text('int cmake_value(void);\n')
            (source/'cmake-study.pc').write_text('prefix=/usr\nlibdir=${prefix}/lib\nincludedir=${prefix}/include\nName: cmake-study\nDescription: SDK integration fixture\nVersion: 1.0\nLibs: -L${libdir} -lcmake-study\nCflags: -I${includedir}\n')
            (source/'CMakeLists.txt').write_text('cmake_minimum_required(VERSION 3.16)\nproject(study C)\nadd_library(cmake-study SHARED value.c)\ninstall(TARGETS cmake-study LIBRARY DESTINATION lib)\ninstall(FILES value.h DESTINATION include)\ninstall(FILES cmake-study.pc DESTINATION lib/pkgconfig)\n')
            subprocess.run(['cmake','-S',str(source),'-B',str(build),'-DCMAKE_INSTALL_PREFIX=/usr'],check=True,stdout=subprocess.DEVNULL)
            subprocess.run(['cmake','--build',str(build)],check=True,stdout=subprocess.DEVNULL)
            subprocess.run([sys.executable,str(HELPER),'export','--root',str(overlay),'--build',str(build),'--system','cmake','--owner','cmake-study'],check=True)
            env=dict(os.environ,PKG_CONFIG_PATH='',PKG_CONFIG_LIBDIR=str(overlay/'usr/lib/pkgconfig'),PKG_CONFIG_SYSROOT_DIR=str(overlay))
            flags=shlex.split(subprocess.check_output(['pkg-config','--cflags','--libs','cmake-study'],env=env,text=True))
            consumer=root/'consumer.c';consumer.write_text('#include <value.h>\nint main(void) { return cmake_value()==17 ? 0 : 1; }\n')
            executable=root/'consumer'
            subprocess.run(['cc',str(consumer),*flags,'-Wl,-rpath,'+str(overlay/'usr/lib'),'-o',str(executable)],check=True)
            subprocess.run([str(executable)],check=True)
            self.assertFalse((base/'usr').exists())

    @unittest.skipUnless(all(shutil.which(name) for name in ['meson','ninja','cc','pkg-config']), 'Native build tools required')
    def test_meson_export_builds_consumer_and_reset_removes_exports(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); base = root/'base'; base.mkdir()
            sentinel = base/'original'; sentinel.write_text('base remains unchanged')
            overlay = root/'sdk'; sdk.initialize(base,overlay)
            (overlay/'original').write_text('private modification')
            self.assertEqual(sentinel.read_text(),'base remains unchanged')
            source = root/'library'; source.mkdir()
            (source/'value.h').write_text('int study_value(void);\n')
            (source/'value.c').write_text('int study_value(void) { return 43; }\n')
            (source/'meson.build').write_text("""project('study-export', 'c', version: '1.0')
lib = shared_library('study-export', 'value.c', install: true)
install_headers('value.h', subdir: 'study-export')
import('pkgconfig').generate(lib, subdirs: 'study-export')
""")
            build = root/'build'
            subprocess.run(['meson','setup',str(build),str(source),'--prefix=/usr','--libdir=lib'],check=True,stdout=subprocess.DEVNULL)
            subprocess.run(['meson','compile','-C',str(build)],check=True,stdout=subprocess.DEVNULL)
            installed=json.loads(subprocess.check_output(['meson','introspect','--installed',str(build)],text=True))
            sdk.export_files(overlay,'library',installed)
            env=dict(os.environ,PKG_CONFIG_PATH='',PKG_CONFIG_LIBDIR=str(overlay/'usr/lib/pkgconfig'),PKG_CONFIG_SYSROOT_DIR=str(overlay))
            flags=shlex.split(subprocess.check_output(['pkg-config','--cflags','--libs','study-export'],env=env,text=True))
            app=root/'main.c'; app.write_text('#include <value.h>\nint main(void) { return study_value() == 43 ? 0 : 1; }\n')
            executable=root/'consumer'
            subprocess.run(['cc',str(app),*flags,'-Wl,-rpath,'+str(overlay/'usr/lib'),'-o',str(executable)],check=True)
            subprocess.run([str(executable)],check=True)
            self.assertFalse((base/'usr').exists())
            changed=root/'changed.h'; changed.write_text('different')
            with self.assertRaisesRegex(ValueError,'Conflicting'):
                sdk.export_files(overlay,'conflict',{str(changed):'/usr/include/study-export/value.h'})
            self.assertEqual((overlay/'usr/include/study-export/value.h').read_text(),'int study_value(void);\n')
            sdk.initialize(base,overlay)
            self.assertFalse((overlay/'usr/lib/libstudy-export.so').exists())
            self.assertEqual((overlay/'original').read_text(),sentinel.read_text())
            self.assertNotEqual((overlay/'original').stat().st_ino,sentinel.stat().st_ino)

    def test_host_gi_fallback_never_substitutes_target_library(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);base=root/'base';base.mkdir();overlay=root/'sdk';sdk.initialize(base,overlay)
            host=root/'host';host.mkdir();(host/'study.vapi').write_text('namespace Study {}')
            (host/'libstudy.so').write_bytes(b'host binary')
            sdk.export_files(overlay,'study',{str(root/'target/study.vapi'):'/usr/share/vala/vapi/study.vapi'},host)
            self.assertTrue((overlay/'usr/share/vala/vapi/study.vapi').is_file())
            with self.assertRaisesRegex(ValueError,'missing'):
                sdk.export_files(overlay,'study',{str(root/'target/libstudy.so'):'/usr/lib/libstudy.so'},host)
            outside=root/'outside';outside.mkdir();(overlay/'usr/escape').symlink_to(outside,target_is_directory=True)
            with self.assertRaisesRegex(ValueError,'escapes'):
                sdk.export_files(overlay,'study',{str(host/'study.vapi'):'/usr/escape/study.vapi'})
            self.assertFalse((outside/'study.vapi').exists())

if __name__=='__main__':unittest.main()
