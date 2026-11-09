// Signing identity comes only from the environment; credentials never enter JSON.
local C = import("common.nut"), GLib = import("GLib")
local M = { variables = ["SQGI_ANDROID_KEYSTORE", "SQGI_ANDROID_KEY_ALIAS", "SQGI_ANDROID_STORE_PASSWORD", "SQGI_ANDROID_KEY_PASSWORD"] }
M.configured <- function(variant) {
    if (variant != "debug" && variant != "release") throw "Android variant must be debug or release"
    local supplied = false, missing = []
    foreach (name in M.variables) {
        local value = GLib.getenv(name)
        if (value == null || value == "") missing.push(name)
        else supplied = true
    }
    if (supplied || variant == "release") {
        if (missing.len()) throw "Android signing requires external environment settings: " + C.concat(missing, ", ")
        if (!C.is_file(GLib.getenv("SQGI_ANDROID_KEYSTORE"))) throw "SQGI_ANDROID_KEYSTORE must identify an existing keystore"
    }
    return supplied
}
M.environment <- function(java) { return { JAVA_HOME = java, LC_ALL = "C.UTF-8", LANG = "C.UTF-8" } }
M.signing_environment <- function(java) {
    local env = M.environment(java)
    if (M.configured("debug")) {
        foreach (name in M.variables) env[name] <- GLib.getenv(name)
        env.SQGI_ANDROID_KEYSTORE = C.realpath(env.SQGI_ANDROID_KEYSTORE)
    } else {
        env.SQGI_ANDROID_KEYSTORE <- GLib.get_home_dir() + "/.android/debug.keystore"
        env.SQGI_ANDROID_KEY_ALIAS <- "androiddebugkey"
        env.SQGI_ANDROID_STORE_PASSWORD <- "android"; env.SQGI_ANDROID_KEY_PASSWORD <- "android"
    }
    return env
}
M.prepare_debug_key <- function(java) {
    if (M.configured("debug")) return
    local env = M.signing_environment(java), path = env.SQGI_ANDROID_KEYSTORE
    C.locked(GLib.path_get_dirname(path) + "/debug.sqgipkg.lock", function() {
        if (!C.exists(path)) {
            C.process([java + "/bin/keytool", "-genkeypair", "-keystore", path, "-alias", env.SQGI_ANDROID_KEY_ALIAS,
                "-storepass:env", "SQGI_ANDROID_STORE_PASSWORD", "-keypass:env", "SQGI_ANDROID_KEY_PASSWORD",
                "-keyalg", "RSA", "-keysize", "2048", "-validity", "10000", "-dname", "CN=Android Debug,O=Android,C=US"], env)
            C.chmod(path, 384)
        }
    })
}
M.expected_certificate <- function(java) {
    local env = M.signing_environment(java)
    return C.temporary(function(root) {
        local path = root + "/certificate.der"
        C.process([java + "/bin/keytool", "-exportcert", "-keystore", env.SQGI_ANDROID_KEYSTORE,
            "-alias", env.SQGI_ANDROID_KEY_ALIAS, "-storepass:env", "SQGI_ANDROID_STORE_PASSWORD", "-file", path], env)
        return C.file_hash(path)
    })
}
M.sign_debug_bundle <- function(source, destination, java) {
    local env = M.signing_environment(java)
    // AGP intentionally leaves debuggable bundles unsigned. Preserve its output.
    C.copy(source, destination)
    C.process([java + "/bin/jarsigner", "-keystore", env.SQGI_ANDROID_KEYSTORE,
        "-storepass:env", "SQGI_ANDROID_STORE_PASSWORD", "-keypass:env", "SQGI_ANDROID_KEY_PASSWORD",
        "-digestalg", "SHA-256", destination, env.SQGI_ANDROID_KEY_ALIAS], env)
    return destination
}
M.verify_apk <- function(path, android, java, expected = null) {
    local output = C.process([android + "/build-tools/35.0.0/apksigner", "verify", "--print-certs", path], M.environment(java)), signers = []
    foreach (line in split(output, "\n")) if (regexp("^Signer #[0-9]+ certificate SHA-256 digest: ").search(line))
        signers.push(strip(line.slice(line.find(":") + 1)).tolower())
    if (signers.len() != 1 || !regexp("^[0-9a-f]{64}$").match(signers[0]) || (expected != null && signers[0] != expected))
        throw "APK signing certificate differs from selected signing identity"
    C.process([android + "/build-tools/35.0.0/zipalign", "-c", "-P", "16", "4", path], M.environment(java))
    return signers[0]
}
M.verify_aab <- function(path, java, expected = null) {
    local output = C.process([java + "/bin/jarsigner", "-verify", path], M.environment(java))
    if (output.find("jar verified.") == null) throw "Android bundle has no verified JAR signature"
    local certificates = C.process([java + "/bin/keytool", "-printcert", "-jarfile", path], M.environment(java)), sums = [], signers = 0
    foreach (line in split(certificates, "\n")) {
        line = strip(line)
        if (regexp("^Signer #[0-9]+:$").match(line)) signers++
        if (C.starts(line, "SHA256:")) sums.push(C.concat(split(strip(line.slice(7)), ":"), "").tolower())
    }
    if (signers != 1 || !sums.len() || !regexp("^[0-9a-f]{64}$").match(sums[0]) || (expected != null && sums[0] != expected))
        throw "Bundle signing certificate differs from selected signing identity"
    return sums[0]
}
M.with_bundle_arguments <- function(java, callback) {
    local env = M.signing_environment(java)
    return C.temporary(function(root) {
        foreach (pair in [["store", "SQGI_ANDROID_STORE_PASSWORD"], ["key", "SQGI_ANDROID_KEY_PASSWORD"]]) {
            C.write(root + "/" + pair[0], env[pair[1]]); C.chmod(root + "/" + pair[0], 384)
        }
        return callback(["--ks=" + env.SQGI_ANDROID_KEYSTORE, "--ks-key-alias=" + env.SQGI_ANDROID_KEY_ALIAS,
                         "--ks-pass=file:" + root + "/store", "--key-pass=file:" + root + "/key"])
    })
}
return M
