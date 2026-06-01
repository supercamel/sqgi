#include "sqgi_system.h"

#include <glib.h>
#include <squirrel.h>
#include <string.h>

#ifndef SQGI_VERSION
#define SQGI_VERSION "unknown"
#endif

#ifndef SQGI_TARGET_ARCH
#define SQGI_TARGET_ARCH "unknown"
#endif

static void sqgi_push_k_string(HSQUIRRELVM v, const char *key, const char *value)
{
    sq_pushstring(v, key, -1);
    if (value) sq_pushstring(v, value, -1);
    else sq_pushnull(v);
    sq_newslot(v, -3, SQFalse);
}

static void sqgi_push_k_bool(HSQUIRRELVM v, const char *key, SQBool value)
{
    sq_pushstring(v, key, -1);
    sq_pushbool(v, value);
    sq_newslot(v, -3, SQFalse);
}

static void sqgi_push_k_int(HSQUIRRELVM v, const char *key, SQInteger value)
{
    sq_pushstring(v, key, -1);
    sq_pushinteger(v, value);
    sq_newslot(v, -3, SQFalse);
}

static void sqgi_push_k_table(HSQUIRRELVM v, const char *key)
{
    sq_pushstring(v, key, -1);
    sq_newtable(v);
}

static void sqgi_newslot_table(HSQUIRRELVM v)
{
    sq_newslot(v, -3, SQFalse);
}

static const char *sqgi_os_name(void)
{
#if defined(G_OS_WIN32)
    return "windows";
#elif defined(__APPLE__)
    return "macos";
#elif defined(__linux__)
    return "linux";
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
    return "bsd";
#elif defined(__unix__)
    return "unix";
#else
    return "unknown";
#endif
}

static const char *sqgi_os_family(void)
{
#if defined(G_OS_WIN32)
    return "windows";
#elif defined(__unix__) || defined(__APPLE__)
    return "unix";
#else
    return "unknown";
#endif
}

static const char *sqgi_cpu_arch(void)
{
    if (strcmp(SQGI_TARGET_ARCH, "AMD64") == 0 ||
        strcmp(SQGI_TARGET_ARCH, "amd64") == 0 ||
        strcmp(SQGI_TARGET_ARCH, "x64") == 0) {
        return "x86_64";
    }
    if (strcmp(SQGI_TARGET_ARCH, "arm64") == 0 ||
        strcmp(SQGI_TARGET_ARCH, "ARM64") == 0) {
        return "aarch64";
    }
    return SQGI_TARGET_ARCH;
}

static const char *sqgi_endian_name(void)
{
#if G_BYTE_ORDER == G_LITTLE_ENDIAN
    return "little";
#elif G_BYTE_ORDER == G_BIG_ENDIAN
    return "big";
#else
    return "unknown";
#endif
}

static char *sqgi_os_info_first(const char *first, const char *second)
{
    char *value = NULL;
    if (first) value = g_get_os_info(first);
    if ((!value || value[0] == '\0') && second) {
        g_free(value);
        value = g_get_os_info(second);
    }
    return value;
}

static SQInteger sqgi_system_env_get(HSQUIRRELVM v)
{
    const SQChar *name = NULL;
    if (sq_gettop(v) < 2 || SQ_FAILED(sq_getstring(v, 2, &name)) || !name) {
        return sq_throwerror(v, "system.env.get: expected variable name");
    }
    const char *value = g_getenv(name);
    if (value) sq_pushstring(v, value, -1);
    else sq_pushnull(v);
    return 1;
}

static SQInteger sqgi_system_env_has(HSQUIRRELVM v)
{
    const SQChar *name = NULL;
    if (sq_gettop(v) < 2 || SQ_FAILED(sq_getstring(v, 2, &name)) || !name) {
        return sq_throwerror(v, "system.env.has: expected variable name");
    }
    sq_pushbool(v, g_getenv(name) != NULL);
    return 1;
}

static SQInteger sqgi_system_env_all(HSQUIRRELVM v)
{
    char **names = g_listenv();
    sq_newtable(v);
    for (gsize i = 0; names && names[i]; i++) {
        const char *value = g_getenv(names[i]);
        if (!value) continue;
        sq_pushstring(v, names[i], -1);
        sq_pushstring(v, value, -1);
        sq_newslot(v, -3, SQFalse);
    }
    g_strfreev(names);
    return 1;
}

static void sqgi_system_reg_fn(HSQUIRRELVM v, const char *name, SQFUNCTION fn)
{
    sq_pushstring(v, name, -1);
    sq_newclosure(v, fn, 0);
    sq_setnativeclosurename(v, -1, name);
    sq_newslot(v, -3, SQFalse);
}

static void sqgi_system_push_env(HSQUIRRELVM v)
{
    sqgi_push_k_table(v, "env");
    sqgi_system_reg_fn(v, "get", sqgi_system_env_get);
    sqgi_system_reg_fn(v, "has", sqgi_system_env_has);
    sqgi_system_reg_fn(v, "all", sqgi_system_env_all);
    sqgi_newslot_table(v);
}

static void sqgi_system_push_os(HSQUIRRELVM v)
{
    char *pretty_name = sqgi_os_info_first(G_OS_INFO_KEY_PRETTY_NAME, G_OS_INFO_KEY_NAME);
    char *version = sqgi_os_info_first(G_OS_INFO_KEY_VERSION_ID, G_OS_INFO_KEY_VERSION);
    char *id = g_get_os_info(G_OS_INFO_KEY_ID);

    sqgi_push_k_table(v, "os");
    sqgi_push_k_string(v, "name", sqgi_os_name());
    sqgi_push_k_string(v, "family", sqgi_os_family());
    sqgi_push_k_string(v, "pretty_name", pretty_name ? pretty_name : sqgi_os_name());
    sqgi_push_k_string(v, "version", version);
    sqgi_push_k_string(v, "id", id);
    sqgi_newslot_table(v);

    g_free(pretty_name);
    g_free(version);
    g_free(id);
}

static void sqgi_system_push_cpu(HSQUIRRELVM v)
{
    sqgi_push_k_table(v, "cpu");
    sqgi_push_k_string(v, "arch", sqgi_cpu_arch());
    sqgi_push_k_string(v, "endian", sqgi_endian_name());
    sqgi_newslot_table(v);
}

static void sqgi_system_push_runtime(HSQUIRRELVM v)
{
    sqgi_push_k_table(v, "runtime");
    sqgi_push_k_string(v, "sqgi_version", SQGI_VERSION);
    sqgi_push_k_string(v, "squirrel_version", SQUIRREL_VERSION);
    sqgi_push_k_int(v, "squirrel_version_number", SQUIRREL_VERSION_NUMBER);
#ifdef SQ_ENABLE_JIT
    sqgi_push_k_bool(v, "jit", SQTrue);
#else
    sqgi_push_k_bool(v, "jit", SQFalse);
#endif
#ifdef NDEBUG
    sqgi_push_k_bool(v, "debug", SQFalse);
#else
    sqgi_push_k_bool(v, "debug", SQTrue);
#endif
    sqgi_newslot_table(v);
}

static void sqgi_system_push_paths(HSQUIRRELVM v)
{
    char *cwd = g_get_current_dir();

    sqgi_push_k_table(v, "paths");
    sqgi_push_k_string(v, "home", g_get_home_dir());
    sqgi_push_k_string(v, "tmp", g_get_tmp_dir());
    sqgi_push_k_string(v, "config", g_get_user_config_dir());
    sqgi_push_k_string(v, "cache", g_get_user_cache_dir());
    sqgi_push_k_string(v, "data", g_get_user_data_dir());
    sqgi_push_k_string(v, "current", cwd);
    sqgi_push_k_string(v, "app_share", g_getenv("SQGI_APP_SHARE"));
    sqgi_push_k_string(v, "app_resources", g_getenv("SQGI_APP_RESOURCES"));
    sqgi_newslot_table(v);

    g_free(cwd);
}

static void sqgi_system_push_package(HSQUIRRELVM v)
{
    const char *app_share = g_getenv("SQGI_APP_SHARE");
    const char *app_resources = g_getenv("SQGI_APP_RESOURCES");
    SQBool packaged = ((app_share && app_share[0]) ||
                       (app_resources && app_resources[0])) ? SQTrue : SQFalse;

    sqgi_push_k_table(v, "package");
    sqgi_push_k_bool(v, "packaged", packaged);
    sqgi_push_k_string(v, "app_share", app_share);
    sqgi_push_k_string(v, "resources", app_resources);
    sqgi_newslot_table(v);
}

SQRESULT sqgi_system_push_module(HSQUIRRELVM v)
{
    sq_newtable(v);

    sqgi_system_push_os(v);
    sqgi_system_push_cpu(v);
    sqgi_system_push_runtime(v);
    sqgi_system_push_env(v);
    sqgi_system_push_paths(v);
    sqgi_system_push_package(v);

    return SQ_OK;
}
