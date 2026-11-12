project('sqgi-worker', 'c', version: '0.1.0', default_options: ['c_std=c11', 'warning_level=2'])
if host_machine.system() != 'android'
  error('SqWorker is the Android service backend; use Gio.Subprocess on desktop.')
endif
gnome = import('gnome')
deps = [dependency('gio-unix-2.0'), dependency('gobject-introspection-1.0'), dependency('sqgi'), meson.get_compiler('c').find_library('dl')]
worker = shared_library('sqgi-worker', ['sq-worker.c', 'worker-android.c'],
  dependencies: deps, install: true)
install_headers('sq-worker.h', subdir: 'sqgi-worker-1.0')
gnome.generate_gir(worker, sources: ['sq-worker.h'], namespace: 'SqWorker', nsversion: '1.0',
  identifier_prefix: 'SqWorker', symbol_prefix: 'sq_worker', includes: ['Gio-2.0'],
  export_packages: 'sqgi-worker-1.0', install: true)
import('pkgconfig').generate(worker, name: 'sqgi-worker', filebase: 'sqgi-worker-1.0',
  description: 'Isolated SQGI script processes on Android', subdirs: 'sqgi-worker-1.0',
  requires: ['gio-2.0'])
install_data(['java/WorkerBridge.java', 'java/WorkerService.java'],
  install_dir: get_option('datadir') / 'sqgi-android/java/org/sqgi/worker')
install_data('services.json', install_dir: get_option('datadir') / 'sqgi-android/services', rename: 'sqgi-worker.json')
