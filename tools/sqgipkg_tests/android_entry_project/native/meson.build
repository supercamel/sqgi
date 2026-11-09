project('native-entry', 'c', version: '1.0.0')
deps = [dependency('gtk4'), dependency('sqgi')]
if host_machine.system() == 'android'
  shared_library('native-entry', 'entry.c', dependencies: deps, install: true)
else
  executable('native-entry', ['entry.c', 'host-main.c'], dependencies: deps, install: true)
endif
