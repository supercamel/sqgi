// External acceptance entrypoint for a concrete installed-backend request.
local Gio = import("Gio")
local request = sqgi.json.parse(Gio.File.new_for_path(vargv[0]).load_contents(null)[0])
local C = import(request.backend + "/common.nut"), Backend = import(request.backend + "/assemble.nut")
C.atomic_json(request.report, Backend.build(request.input))
print("PASS: installed SQGI Android backend request\n")
