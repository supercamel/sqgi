project('sqgi-native-vala', ['vala', 'c'], version: '1.0.0')

glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gio_dep = dependency('gio-2.0')
vala_shared_library = host_machine.system() == 'windows' ? 'libsqvala-1.0.dll' : 'libsqvala-1.0.so'

shared_library(
  'sqvala-1.0',
  'sq-vala.vala',
  dependencies: [glib_dep, gobject_dep, gio_dep],
  vala_args: ['--shared-library=' + vala_shared_library],
  vala_gir: 'SqVala-1.0.gir',
  vala_header: 'sq-vala.h',
  vala_vapi: 'sq-vala-1.0.vapi',
  install: false,
)
