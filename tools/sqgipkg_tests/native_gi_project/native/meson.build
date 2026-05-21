project('sqgi-native-hello', 'c', version: '1.0.0')

glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')

sqhello_lib = shared_library(
  'sqhello-1.0',
  'sq-hello.c',
  dependencies: [glib_dep, gobject_dep],
  include_directories: include_directories('.'),
  install: false,
)

if host_machine.system() != 'windows'
  gnome = import('gnome')
  gnome.generate_gir(
    sqhello_lib,
    sources: ['sq-hello.c', 'sq-hello.h'],
    namespace: 'SqHello',
    nsversion: '1.0',
    symbol_prefix: 'sq_hello',
    identifier_prefix: 'SqHello',
    includes: ['GObject-2.0'],
    dependencies: [glib_dep, gobject_dep],
    install: false,
  )
endif
