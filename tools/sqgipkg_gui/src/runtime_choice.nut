// C-EDIT-06: author runtime selectors; leave resolution to sqgipkg.
local D = import("document.nut")
function read(value) {
    if ("entry" in value && typeof(value.entry) == "table" &&
            "type" in value.entry && value.entry.type == "native")
        return { mode = "native", value = "", reason = null, key = "runtime" }
    local custom = function(reason, key = "runtime") { return { mode = null, value = "", reason = reason, key = key } }
    if ("sqgi_source" in value)
        return custom("This manifest uses the legacy SQGI source settings. They are preserved; edit them in Advanced and resolve the plan.", "sqgi_source")
    if (!("runtime" in value)) return { mode = "existing", value = "", reason = null, key = "runtime" }
    local runtime = value.runtime
    if (typeof(runtime) != "table") return custom("This runtime declaration uses a custom value. It is preserved in Advanced.")
    foreach (key, item in runtime) {
        if (["source", "sqgi", "jit"].find(key) == null ||
                (key == "jit" ? typeof(item) != "bool" : typeof(item) != "string"))
            return custom("This runtime declaration contains custom settings. Use Advanced to preserve their meaning.")
    }
    if (("source" in runtime) == ("sqgi" in runtime))
        return custom("This runtime declaration has both source selectors, or no source selector. Review it in Advanced before changing the source.")
    local source = "source" in runtime
    return { mode = source ? "local" : "revision", value = source ? runtime.source : runtime.sqgi,
        reason = null, key = "runtime" }
}
function write(value, mode, selection) {
    local existing = read(value)
    if (existing.mode == null) throw existing.reason
    if (existing.mode == "native") throw "Native applications do not need a SQGI runtime."
    if (["existing", "local", "revision"].find(mode) == null) throw "Choose how to prepare the SQGI runtime."
    if (mode != "existing" && (typeof(selection) != "string" || selection == ""))
        throw mode == "local" ? "Choose a local SQGI source folder." : "Enter a SQGI version, tag or commit."
    if (mode == existing.mode && (mode == "existing" || selection == existing.value)) return D.copy_value(value)
    local next = D.copy_value(value)
    if (mode == "existing") {
        if ("runtime" in next && "jit" in next.runtime)
            throw "An explicit runtime JIT override is preserved. Review it in Advanced before removing the source recipe."
        if ("runtime" in next) delete next.runtime
    } else {
        if (!("runtime" in next)) next.runtime <- {}
        foreach (key in ["source", "sqgi"]) if (key in next.runtime) delete next.runtime[key]
        next.runtime[mode == "local" ? "source" : "sqgi"] <- selection
    }
    return next
}
return { read = read, write = write }
