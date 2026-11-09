project('sqmobile-vala', ['vala', 'c'], version: '1.0.0')
gio = dependency('gio-2.0')
base = dependency('sqmobile-1.0')
library = shared_library('sqmobile-vala', 'worker.vala', dependencies: [gio, base],
  vala_args: ['--shared-library=libsqmobile-vala.so'], vala_gir: 'SqMobileVala-1.0.gir',
  vala_header: 'sqmobile-vala.h', vala_vapi: 'sqmobile-vala.vapi', install: true,
  install_dir: [get_option('libdir'), get_option('includedir'),
    get_option('datadir') / 'vala/vapi', get_option('datadir') / 'gir-1.0'])
custom_target('typelib', depends: library, output: 'SqMobileVala-1.0.typelib',
  command: [find_program('g-ir-compiler'), meson.current_build_dir() / 'SqMobileVala-1.0.gir', '--output', '@OUTPUT@'],
  build_by_default: true, install: true, install_dir: get_option('libdir') / 'girepository-1.0')
