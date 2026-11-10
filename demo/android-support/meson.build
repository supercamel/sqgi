project('sqandroid', 'c', version: '1.0.0')
gtk = dependency('gtk4')
library = shared_library('sqandroid-1.0', ['sq-android.c', 'sq-sensors.c'], dependencies: gtk,
  link_args: ['-ldl', '-landroid', '-lm'], install: true)
install_headers('sq-android.h', 'sq-sensors.h')
import('gnome').generate_gir(library, sources: ['sq-android.h', 'sq-android.c', 'sq-sensors.h', 'sq-sensors.c'],
  namespace: 'SqAndroid', nsversion: '1.0', identifier_prefix: 'SqAndroid', symbol_prefix: 'sq_android',
  includes: ['Gdk-4.0'], dependencies: gtk, install: true)
install_data('java/AndroidDevice.java', install_dir: 'share/sqgi-android/java/org/sqgi/demo')
