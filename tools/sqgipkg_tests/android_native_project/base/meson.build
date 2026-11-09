project('sqmobile', 'c', version: '1.0.0')
gio = dependency('gio-2.0')
library = shared_library('sqmobile-1.0', 'sq-mobile.c', dependencies: gio, install: true)
install_headers('sq-mobile.h')
import('pkgconfig').generate(library, name: 'sqmobile-1.0', description: 'Android native SDK fixture',
  filebase: 'sqmobile-1.0', requires: ['gio-2.0'], subdirs: '.')
import('gnome').generate_gir(library, sources: ['sq-mobile.h', 'sq-mobile.c'],
  namespace: 'SqMobile', nsversion: '1.0', identifier_prefix: 'SqMobile', symbol_prefix: 'sq_mobile',
  includes: ['Gio-2.0'], dependencies: gio, install: true)
install_data('sqmobile-1.0.vapi', install_dir: get_option('datadir') / 'vala/vapi')
