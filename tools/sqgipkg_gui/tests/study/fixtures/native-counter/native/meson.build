project('study-native', 'c', version: '1.0.0', default_options: ['warning_level=3'])

gnome = import('gnome')
gobject = dependency('gobject-2.0')
library = shared_library('study-native', 'study-native.c',
  dependencies: gobject, install: true)
install_headers('study-native.h', subdir: 'study-native')
gnome.generate_gir(library,
  sources: ['study-native.h', 'study-native.c'],
  namespace: 'StudyNative', nsversion: '1.0',
  identifier_prefix: 'Study', symbol_prefix: 'study',
  includes: ['GObject-2.0'], install: true,
  extra_args: ['--warn-all', '--warn-error'])
