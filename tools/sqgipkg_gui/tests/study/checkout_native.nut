// Exercise a GUI-authored pinned source through the actual backend checkout path.
local Gio = import("Gio")
local B = import("../../../sqgipkg_lib/build.nut")
local pkg = B.SqgiPkgBuild(), value = sqgi.json.parse(Gio.File.new_for_path(vargv[0]).load_contents(null)[0])
foreach (project in pkg.manifest_native_projects(vargv[1], value.native)) {
    if (project.repo == null) continue
    pkg.ensure_git_native_project(project, "Study pinned library")
    local commit = strip(pkg.process_output(["git", "-C", project.dir, "rev-parse", "HEAD"], true))
    if (commit != project.ref) throw "Checkout differs from manifest commit"
    print("STUDY_CHECKOUT " + sqgi.json.stringify({name=project.name, repo=project.repo, dir=project.dir, commit=commit}) + "\n")
}
