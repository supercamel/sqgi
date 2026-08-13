#include "sqgicheck.h"

#include <girepository.h>

#include <algorithm>
#include <cstring>
#include <set>
#include <utility>

namespace sqgicheck {

Value Value::unknown()
{
    return Value();
}

Value Value::scalar()
{
    Value value;
    value.kind = ValueKind::Scalar;
    return value;
}

Value Value::string(std::string contents)
{
    Value value;
    value.kind = ValueKind::String;
    value.text = std::move(contents);
    return value;
}

Value Value::root()
{
    Value value;
    value.kind = ValueKind::Root;
    return value;
}

bool Value::operator==(const Value &other) const
{
    return kind == other.kind && text == other.text &&
           namespace_name == other.namespace_name &&
           type_name == other.type_name && member_name == other.member_name &&
           version == other.version && minimum_args == other.minimum_args &&
           maximum_args == other.maximum_args &&
           alternate_args == other.alternate_args &&
           constructor == other.constructor &&
           async_wrapper == other.async_wrapper &&
           members_known == other.members_known &&
           script_identity == other.script_identity && closure == other.closure &&
           closure_outers == other.closure_outers && fields == other.fields &&
           instance_fields == other.instance_fields;
}

namespace {

using InfoPtr = std::unique_ptr<GIBaseInfo, void (*)(GIBaseInfo *)>;

InfoPtr info_ptr(GIBaseInfo *info)
{
    return InfoPtr(info, [](GIBaseInfo *value) {
        if (value) g_base_info_unref(value);
    });
}

bool ends_with(const std::string &value, const std::string &suffix)
{
    return value.size() >= suffix.size() &&
           value.compare(value.size() - suffix.size(), suffix.size(), suffix) == 0;
}

void sort_unique(std::vector<std::string> *values)
{
    std::sort(values->begin(), values->end());
    values->erase(std::unique(values->begin(), values->end()), values->end());
}

bool runtime_exposes_info(GIBaseInfo *info)
{
    switch (g_base_info_get_type(info)) {
    case GI_INFO_TYPE_FUNCTION:
    case GI_INFO_TYPE_OBJECT:
    case GI_INFO_TYPE_INTERFACE:
    case GI_INFO_TYPE_ENUM:
    case GI_INFO_TYPE_FLAGS:
#ifndef SQGICHECK_MUTATE_METADATA_CATEGORY
    case GI_INFO_TYPE_CONSTANT:
#endif
    case GI_INFO_TYPE_STRUCT:
        return true;
    default:
        return false;
    }
}

int count_in_args(GICallableInfo *callable)
{
    int result = 0;
    const int count = g_callable_info_get_n_args(callable);
    for (int i = 0; i < count; ++i) {
        InfoPtr argument = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_callable_info_get_arg(callable, i)));
        GIDirection direction = g_arg_info_get_direction(
            reinterpret_cast<GIArgInfo *>(argument.get()));
        if (direction == GI_DIRECTION_IN || direction == GI_DIRECTION_INOUT)
            ++result;
    }
    return result;
}

int count_visible_args(GICallableInfo *callable)
{
    const int count = g_callable_info_get_n_args(callable);
    std::vector<bool> visible(static_cast<size_t>(std::max(count, 0)), false);

    for (int i = 0; i < count; ++i) {
        InfoPtr argument = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_callable_info_get_arg(callable, i)));
        GIDirection direction = g_arg_info_get_direction(
            reinterpret_cast<GIArgInfo *>(argument.get()));
        visible[static_cast<size_t>(i)] =
            direction == GI_DIRECTION_IN || direction == GI_DIRECTION_INOUT;
    }

    for (int i = 0; i < count; ++i) {
        InfoPtr argument = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_callable_info_get_arg(callable, i)));
        InfoPtr type = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_arg_info_get_type(reinterpret_cast<GIArgInfo *>(argument.get()))));
        GITypeInfo *type_info = reinterpret_cast<GITypeInfo *>(type.get());
        if (g_type_info_get_tag(type_info) == GI_TYPE_TAG_ARRAY) {
            int length_index = g_type_info_get_array_length(type_info);
            if (length_index >= 0 && length_index < count)
                visible[static_cast<size_t>(length_index)] = false;
        }
        if (g_type_info_get_tag(type_info) == GI_TYPE_TAG_INTERFACE) {
            InfoPtr interface_info = info_ptr(g_type_info_get_interface(type_info));
            if (interface_info &&
                g_base_info_get_type(interface_info.get()) == GI_INFO_TYPE_CALLBACK) {
                int closure_index = g_arg_info_get_closure(
                    reinterpret_cast<GIArgInfo *>(argument.get()));
                int destroy_index = g_arg_info_get_destroy(
                    reinterpret_cast<GIArgInfo *>(argument.get()));
                if (closure_index >= 0 && closure_index < count)
                    visible[static_cast<size_t>(closure_index)] = false;
                if (destroy_index >= 0 && destroy_index < count)
                    visible[static_cast<size_t>(destroy_index)] = false;
            }
        }
    }

    return static_cast<int>(std::count(visible.begin(), visible.end(), true));
}

Value callable_value(GIFunctionInfo *function, const std::string &namespace_name,
                     const std::string &type_name, const std::string &exposed_name,
                     bool async_wrapper)
{
    Value value;
    value.kind = ValueKind::Callable;
    value.namespace_name = namespace_name;
    value.type_name = type_name;
    value.member_name = exposed_name;
    value.async_wrapper = async_wrapper;

    GIFunctionInfoFlags flags = g_function_info_get_flags(function);
    value.constructor = (flags & GI_FUNCTION_IS_CONSTRUCTOR) != 0;
    GICallableInfo *callable = reinterpret_cast<GICallableInfo *>(function);
    value.minimum_args = count_visible_args(callable);
    value.maximum_args = value.minimum_args;
    int in_args = count_in_args(callable);
    if (in_args != value.minimum_args)
        value.alternate_args = in_args;

    if (async_wrapper) {
        /*
         * The wrapper accepts awaitable, raw callback, explicit-cancellable,
         * and no-cancellable forms. GIR annotations are not reliable enough
         * to distinguish all of those shapes, so member existence remains a
         * definite check while wrapper arity is deliberately unconstrained.
         */
        value.minimum_args = -1;
        value.maximum_args = -1;
        value.alternate_args = -1;
    }
    return value;
}

bool callable_has_out_values(GICallableInfo *callable)
{
    int count = g_callable_info_get_n_args(callable);
    for (int i = 0; i < count; ++i) {
        InfoPtr argument = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_callable_info_get_arg(callable, i)));
        GIDirection direction = g_arg_info_get_direction(
            reinterpret_cast<GIArgInfo *>(argument.get()));
        if (direction == GI_DIRECTION_OUT || direction == GI_DIRECTION_INOUT)
            return true;
    }
    return false;
}

Value return_value_for_callable(GIFunctionInfo *function, const Value &callable)
{
    if (callable.constructor && !callable.type_name.empty()) {
        Value result;
        result.kind = ValueKind::Instance;
        result.namespace_name = callable.namespace_name;
        result.type_name = callable.type_name;
        return result;
    }
    if (callable.async_wrapper)
        return Value::unknown();

    GICallableInfo *info = reinterpret_cast<GICallableInfo *>(function);
    if (callable_has_out_values(info))
        return Value::unknown();

    InfoPtr return_type = info_ptr(reinterpret_cast<GIBaseInfo *>(
        g_callable_info_get_return_type(info)));
    GITypeInfo *type_info = reinterpret_cast<GITypeInfo *>(return_type.get());
    if (g_type_info_get_tag(type_info) != GI_TYPE_TAG_INTERFACE)
        return Value::scalar();

    InfoPtr interface_info = info_ptr(g_type_info_get_interface(type_info));
    if (!interface_info)
        return Value::unknown();
    GIInfoType kind = g_base_info_get_type(interface_info.get());
    const char *namespace_name = g_base_info_get_namespace(interface_info.get());
    const char *type_name = g_base_info_get_name(interface_info.get());
    if (!namespace_name || !type_name)
        return Value::unknown();

    Value result;
    result.namespace_name = namespace_name;
    result.type_name = type_name;
    if (kind == GI_INFO_TYPE_OBJECT || kind == GI_INFO_TYPE_INTERFACE ||
        kind == GI_INFO_TYPE_STRUCT || kind == GI_INFO_TYPE_BOXED) {
        result.kind = ValueKind::Instance;
        /*
         * Factories can return a concrete runtime subtype behind a base GI
         * return type. Plugin-specific methods/properties are not rejectable.
         */
        if (callable.namespace_name == "Gst" &&
            (callable.member_name == "parse_launch" ||
             (callable.type_name == "ElementFactory" &&
              callable.member_name == "make"))) {
            result.text = "dynamic-subtype";
        }
        return result;
    }
    if (kind == GI_INFO_TYPE_ENUM || kind == GI_INFO_TYPE_FLAGS)
        return Value::scalar();
    return Value::unknown();
}

class GiMetadataProvider final : public MetadataProvider {
public:
    GiMetadataProvider() : repository_(g_irepository_get_default()) {}

    NamespaceResult load_namespace(const std::string &name,
                                   const std::string &version) override
    {
        if (name == "system") {
            NamespaceResult result;
            result.found = true;
            result.value.kind = ValueKind::Namespace;
            result.value.namespace_name = "system";
            return result;
        }

        GError *error = nullptr;
        GITypelib *typelib = g_irepository_require(
            repository_, name.c_str(), version.empty() ? nullptr : version.c_str(),
            static_cast<GIRepositoryLoadFlags>(0), &error);
        NamespaceResult result;
        if (!typelib) {
            result.error = error && error->message ? error->message :
                "typelib could not be loaded";
            if (error) g_error_free(error);
            return result;
        }
        result.found = true;
        result.value.kind = ValueKind::Namespace;
        result.value.namespace_name = name;
        result.value.version = version;
        return result;
    }

    LookupResult lookup_member(const Value &base, const std::string &name,
                               bool for_call) override
    {
        switch (base.kind) {
        case ValueKind::Root:
            return lookup_root(name);
        case ValueKind::SqgiModule:
            return lookup_sqgi(name);
        case ValueKind::Namespace:
            if (base.namespace_name == "system")
                return lookup_system(name);
            return lookup_namespace(base, name);
        case ValueKind::Type:
            return lookup_type(base, name, false, for_call);
        case ValueKind::Instance:
            return lookup_type(base, name, true, for_call);
        case ValueKind::Enum:
            return lookup_enum(base, name);
        case ValueKind::Table: {
            LookupResult result;
            auto found = base.fields.find(name);
            if (found != base.fields.end()) {
                result.found = true;
                result.value = found->second;
            }
            return result;
        }
        default:
            return LookupResult();
        }
    }

    Value call_result(const Value &callable,
                      const std::vector<Value> &arguments) override
    {
        if (callable.kind == ValueKind::Type) {
            Value result = callable;
            result.kind = ValueKind::Instance;
            return result;
        }
        if (callable.kind != ValueKind::Callable)
            return Value::unknown();
        if (callable.namespace_name == "__sqgi") {
            if (callable.member_name == "new_object" && !arguments.empty() &&
                arguments[0].kind == ValueKind::Type) {
                Value result = arguments[0];
                result.kind = ValueKind::Instance;
                return result;
            }
            return Value::unknown();
        }

        InfoPtr function = find_callable(callable);
        if (!function)
            return Value::unknown();
        return return_value_for_callable(
            reinterpret_cast<GIFunctionInfo *>(function.get()), callable);
    }

    bool has_property(const Value &instance, const std::string &name,
                      std::vector<std::string> *candidates) override
    {
        InfoPtr type = find_type(instance.namespace_name, instance.type_name);
        if (!type) return false;
        bool found = find_property(type.get(), name, candidates);
        if (candidates) sort_unique(candidates);
        return found;
    }

    bool has_signal(const Value &instance, const std::string &name,
                    std::vector<std::string> *candidates) override
    {
        std::string base_name = name;
        std::string detail;
        size_t separator = name.find("::");
        if (separator != std::string::npos) {
            base_name = name.substr(0, separator);
            detail = name.substr(separator + 2);
        }
        if (base_name == "notify") {
            if (detail.empty()) return true;
            return has_property(instance, detail, candidates);
        }

        InfoPtr type = find_type(instance.namespace_name, instance.type_name);
        if (!type) return false;
        bool found = find_signal(type.get(), base_name, candidates);
        if (candidates) sort_unique(candidates);
        return found;
    }

private:
    GIRepository *repository_;

    static LookupResult found(Value value)
    {
        LookupResult result;
        result.found = true;
        result.value = std::move(value);
        return result;
    }

    static Value builtin_callable(const std::string &name, int minimum,
                                  int maximum)
    {
        Value value;
        value.kind = ValueKind::Callable;
        value.namespace_name = "__sqgi";
        value.member_name = name;
        value.minimum_args = minimum;
        value.maximum_args = maximum;
        return value;
    }

    LookupResult lookup_root(const std::string &name)
    {
        if (name == "import") {
            Value value;
            value.kind = ValueKind::ImportFunction;
            value.member_name = name;
            value.minimum_args = 1;
            value.maximum_args = 2;
            return found(value);
        }
        if (name == "sqgi") {
            Value value;
            value.kind = ValueKind::SqgiModule;
            return found(value);
        }
        return LookupResult();
    }

    LookupResult lookup_sqgi(const std::string &name)
    {
        static const std::unordered_map<std::string, std::pair<int, int>> functions = {
            {"new_object", {2, 2}}, {"register_class", {1, 1}},
            {"chain_up", {0, -1}}, {"all", {1, 1}}, {"race", {1, 1}},
            {"sleep", {1, 2}}, {"idle", {0, 0}},
            {"socket_add_watch", {3, 4}}, {"source_remove", {1, 1}},
            {"timeout_add", {2, 2}}, {"Task", {0, 0}},
            {"gio_async", {2, 2}}, {"bytes_to_array", {1, 1}},
            {"bytes_from_array", {1, 1}},
            /* Compiler/runtime plumbing emitted for async functions and await. */
            {"__make_async", {1, 1}}, {"__await", {1, 1}},
            {"__find_async_pairs", {1, 1}},
            {"__make_async_wrapper", {1, 2}},
        };
        auto function = functions.find(name);
        if (function != functions.end())
            return found(builtin_callable(name, function->second.first,
                                          function->second.second));
        if (name == "json" || name == "GError") {
            Value value;
            value.kind = ValueKind::Table;
            value.namespace_name = "__sqgi";
            if (name == "json") {
                value.fields["parse"] = builtin_callable("json.parse", 1, 1);
                value.fields["stringify"] = builtin_callable("json.stringify", 1, 2);
            }
            return found(value);
        }
        LookupResult result;
        result.definite_missing = true;
        for (const auto &entry : functions) result.candidates.push_back(entry.first);
        result.candidates.push_back("json");
        result.candidates.push_back("GError");
        sort_unique(&result.candidates);
        return result;
    }

    LookupResult lookup_system(const std::string &name)
    {
        static const std::set<std::string> members = {
            "os", "cpu", "runtime", "paths", "package", "env"
        };
        if (members.count(name)) {
            Value value;
            value.kind = ValueKind::Table;
            return found(value);
        }
        LookupResult result;
        result.definite_missing = true;
        result.candidates.assign(members.begin(), members.end());
        return result;
    }

    InfoPtr find_type(const std::string &namespace_name,
                      const std::string &type_name)
    {
        if (!g_irepository_is_registered(
                repository_, namespace_name.c_str(), nullptr))
            return info_ptr(nullptr);
        return info_ptr(g_irepository_find_by_name(
            repository_, namespace_name.c_str(), type_name.c_str()));
    }

    LookupResult lookup_namespace(const Value &base, const std::string &name)
    {
        if (base.namespace_name == "cairo") {
            static const char *overlays[] = {
                "Context", "Surface", "Pattern", "image_surface_create"
            };
            if (std::find(std::begin(overlays), std::end(overlays), name) !=
                std::end(overlays)) {
                Value overlay;
                overlay.namespace_name = "cairo";
                overlay.type_name = name;
                overlay.kind = name == "image_surface_create" ?
                    ValueKind::Callable : ValueKind::Type;
                return found(overlay);
            }
        }
        if (!g_irepository_is_registered(
                repository_, base.namespace_name.c_str(), nullptr))
            return LookupResult();
        InfoPtr info = info_ptr(g_irepository_find_by_name(
            repository_, base.namespace_name.c_str(), name.c_str()));
        if (info && runtime_exposes_info(info.get()))
            return found(value_for_info(info.get(), base.namespace_name, name));

        LookupResult result;
        result.definite_missing = true;
        int count = g_irepository_get_n_infos(repository_, base.namespace_name.c_str());
        for (int i = 0; i < count; ++i) {
            InfoPtr candidate = info_ptr(g_irepository_get_info(
                repository_, base.namespace_name.c_str(), i));
            if (candidate && runtime_exposes_info(candidate.get())) {
                const char *candidate_name = g_base_info_get_name(candidate.get());
                if (candidate_name) result.candidates.emplace_back(candidate_name);
            }
        }
        if (base.namespace_name == "cairo") {
            static const char *overlays[] = {
                "Context", "Surface", "Pattern", "image_surface_create"
            };
            result.candidates.insert(result.candidates.end(),
                                     std::begin(overlays), std::end(overlays));
        }
        sort_unique(&result.candidates);
        return result;
    }

    Value value_for_info(GIBaseInfo *info, const std::string &namespace_name,
                         const std::string &name)
    {
        Value value;
        value.namespace_name = namespace_name;
        value.type_name = name;
        switch (g_base_info_get_type(info)) {
        case GI_INFO_TYPE_FUNCTION:
            return callable_value(reinterpret_cast<GIFunctionInfo *>(info),
                                  namespace_name, "", name, false);
        case GI_INFO_TYPE_OBJECT:
        case GI_INFO_TYPE_INTERFACE:
        case GI_INFO_TYPE_STRUCT:
            value.kind = ValueKind::Type;
            return value;
        case GI_INFO_TYPE_ENUM:
        case GI_INFO_TYPE_FLAGS:
            value.kind = ValueKind::Enum;
            return value;
        default:
            value.kind = ValueKind::Scalar;
            return value;
        }
    }

    InfoPtr find_method(GIBaseInfo *type, const std::string &requested,
                        bool instance, bool *async_wrapper)
    {
        std::string name = requested;
        bool raw_alias = false;
        if (ends_with(name, "_async_raw")) {
            name = name.substr(0, name.size() - 4);
            raw_alias = true;
        }

        auto accept = [&](GIFunctionInfo *method) -> GIBaseInfo * {
            if (!method) return nullptr;
            const char *method_name = g_base_info_get_name(
                reinterpret_cast<GIBaseInfo *>(method));
            GIFunctionInfoFlags flags = g_function_info_get_flags(method);
            bool constructor = (flags & GI_FUNCTION_IS_CONSTRUCTOR) != 0;
            if (method_name && name == method_name && (!instance || !constructor)) {
                if (async_wrapper) {
                    *async_wrapper = !raw_alias && ends_with(requested, "_async") &&
                        has_finish_pair(type, requested.substr(0, requested.size() - 6));
                }
                return reinterpret_cast<GIBaseInfo *>(method);
            }
            g_base_info_unref(method);
            return nullptr;
        };

        GIInfoType kind = g_base_info_get_type(type);
        if (kind == GI_INFO_TYPE_OBJECT) {
            GIObjectInfo *object = reinterpret_cast<GIObjectInfo *>(type);
            int count = g_object_info_get_n_methods(object);
            for (int i = 0; i < count; ++i) {
                GIBaseInfo *match = accept(g_object_info_get_method(object, i));
                if (match) return info_ptr(match);
            }
            int interface_count = g_object_info_get_n_interfaces(object);
            for (int i = 0; i < interface_count; ++i) {
                InfoPtr interface_info = info_ptr(reinterpret_cast<GIBaseInfo *>(
                    g_object_info_get_interface(object, i)));
                InfoPtr match = find_method(interface_info.get(), requested, instance,
                                            async_wrapper);
                if (match) return match;
            }
            InfoPtr parent = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_object_info_get_parent(object)));
            if (parent)
                return find_method(parent.get(), requested, instance, async_wrapper);
        } else if (kind == GI_INFO_TYPE_INTERFACE) {
            GIInterfaceInfo *interface_info = reinterpret_cast<GIInterfaceInfo *>(type);
            int count = g_interface_info_get_n_methods(interface_info);
            for (int i = 0; i < count; ++i) {
                GIBaseInfo *match = accept(g_interface_info_get_method(interface_info, i));
                if (match) return info_ptr(match);
            }
        } else if (kind == GI_INFO_TYPE_STRUCT) {
            GIStructInfo *structure = reinterpret_cast<GIStructInfo *>(type);
            int count = g_struct_info_get_n_methods(structure);
            for (int i = 0; i < count; ++i) {
                GIBaseInfo *match = accept(g_struct_info_get_method(structure, i));
                if (match) return info_ptr(match);
            }
        }
        return info_ptr(nullptr);
    }

    bool has_finish_pair(GIBaseInfo *type, const std::string &base_name)
    {
        bool ignored = false;
        InfoPtr finish = find_method(type, base_name + "_finish", false, &ignored);
        return static_cast<bool>(finish);
    }

    void append_methods(GIBaseInfo *type, bool instance,
                        std::vector<std::string> *names)
    {
        GIInfoType kind = g_base_info_get_type(type);
        auto append = [&](GIFunctionInfo *method) {
            if (!method) return;
            const char *name = g_base_info_get_name(
                reinterpret_cast<GIBaseInfo *>(method));
            bool constructor =
                (g_function_info_get_flags(method) & GI_FUNCTION_IS_CONSTRUCTOR) != 0;
            if (name && (!instance || !constructor)) {
                names->emplace_back(name);
                if (ends_with(name, "_async")) {
                    names->emplace_back(std::string(name) + "_raw");
                }
            }
            g_base_info_unref(method);
        };

        if (kind == GI_INFO_TYPE_OBJECT) {
            GIObjectInfo *object = reinterpret_cast<GIObjectInfo *>(type);
            for (int i = 0; i < g_object_info_get_n_methods(object); ++i)
                append(g_object_info_get_method(object, i));
            for (int i = 0; i < g_object_info_get_n_interfaces(object); ++i) {
                InfoPtr interface_info = info_ptr(reinterpret_cast<GIBaseInfo *>(
                    g_object_info_get_interface(object, i)));
                append_methods(interface_info.get(), instance, names);
            }
            InfoPtr parent = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_object_info_get_parent(object)));
            if (parent) append_methods(parent.get(), instance, names);
        } else if (kind == GI_INFO_TYPE_INTERFACE) {
            GIInterfaceInfo *interface_info = reinterpret_cast<GIInterfaceInfo *>(type);
            for (int i = 0; i < g_interface_info_get_n_methods(interface_info); ++i)
                append(g_interface_info_get_method(interface_info, i));
        } else if (kind == GI_INFO_TYPE_STRUCT) {
            GIStructInfo *structure = reinterpret_cast<GIStructInfo *>(type);
            for (int i = 0; i < g_struct_info_get_n_methods(structure); ++i)
                append(g_struct_info_get_method(structure, i));
        }
    }

    LookupResult lookup_type(const Value &base, const std::string &name,
                             bool instance, bool for_call)
    {
        if (instance && base.text == "dynamic-subtype")
            return LookupResult();
        if (!instance && base.namespace_name == "cairo") {
            static const std::unordered_map<std::string, std::vector<std::string>>
                overlay_members = {
                    {"Context", {"create"}},
                    {"Pattern", {"create_linear", "create_radial",
                                 "create_rgb", "create_rgba"}},
                };
            auto type = overlay_members.find(base.type_name);
            if (type != overlay_members.end() &&
                std::find(type->second.begin(), type->second.end(), name) !=
                    type->second.end()) {
                Value value = builtin_callable(name, -1, -1);
                value.namespace_name = base.namespace_name;
                value.type_name = base.type_name;
                return found(value);
            }
        }
        InfoPtr type = find_type(base.namespace_name, base.type_name);
        if (!type) return LookupResult();

        static const std::unordered_map<std::string, std::pair<int, int>> helpers = {
            {"connect", {2, 2}}, {"disconnect", {1, 1}}, {"emit", {1, -1}},
            {"get_property", {1, 1}}, {"set_property", {2, 2}},
        };
        if (instance) {
            auto helper = helpers.find(name);
            if (helper != helpers.end()) {
                Value value = builtin_callable(name, helper->second.first,
                                               helper->second.second);
                value.namespace_name = base.namespace_name;
                value.type_name = base.type_name;
                return found(value);
            }
        }

        bool async_wrapper = false;
        InfoPtr method = find_method(type.get(), name, instance, &async_wrapper);
        if (method) {
            return found(callable_value(
                reinterpret_cast<GIFunctionInfo *>(method.get()),
                base.namespace_name, base.type_name, name, async_wrapper));
        }

        if (instance && !for_call) {
            std::vector<std::string> ignored;
            if (find_property(type.get(), name, &ignored))
                return found(Value::scalar());
            if (g_base_info_get_type(type.get()) == GI_INFO_TYPE_STRUCT &&
                find_field(reinterpret_cast<GIStructInfo *>(type.get()), name, &ignored))
                return found(Value::scalar());
            return LookupResult();
        }
        if (!instance && name == "__gtype")
            return found(Value::string(base.namespace_name + "." + base.type_name));

        LookupResult result;
        result.definite_missing = true;
        append_methods(type.get(), instance, &result.candidates);
        if (instance) {
            for (const auto &helper : helpers) result.candidates.push_back(helper.first);
        } else {
            result.candidates.push_back("__gtype");
        }
        sort_unique(&result.candidates);
        return result;
    }

    LookupResult lookup_enum(const Value &base, const std::string &name)
    {
        InfoPtr info = find_type(base.namespace_name, base.type_name);
        LookupResult result;
        if (!info) return result;
        GIEnumInfo *enumeration = reinterpret_cast<GIEnumInfo *>(info.get());
        int count = g_enum_info_get_n_values(enumeration);
        for (int i = 0; i < count; ++i) {
            InfoPtr value = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_enum_info_get_value(enumeration, i)));
            const char *candidate = g_base_info_get_name(value.get());
            if (!candidate) continue;
            result.candidates.emplace_back(candidate);
            if (name == candidate) {
                result.found = true;
                result.value = Value::scalar();
            }
        }
        result.definite_missing = !result.found;
        sort_unique(&result.candidates);
        return result;
    }

    InfoPtr find_callable(const Value &callable)
    {
        if (callable.type_name.empty()) {
            return info_ptr(g_irepository_find_by_name(
                repository_, callable.namespace_name.c_str(),
                callable.member_name.c_str()));
        }
        InfoPtr type = find_type(callable.namespace_name, callable.type_name);
        if (!type) return info_ptr(nullptr);
        bool ignored = false;
        std::string name = callable.member_name;
        if (ends_with(name, "_async_raw")) name.resize(name.size() - 4);
        return find_method(type.get(), name, false, &ignored);
    }

    bool find_property(GIBaseInfo *type, const std::string &name,
                       std::vector<std::string> *candidates)
    {
        if (!type || g_base_info_get_type(type) != GI_INFO_TYPE_OBJECT)
            return false;
        GIObjectInfo *object = reinterpret_cast<GIObjectInfo *>(type);
        bool found = false;
        int count = g_object_info_get_n_properties(object);
        for (int i = 0; i < count; ++i) {
            InfoPtr property = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_object_info_get_property(object, i)));
            const char *candidate = g_base_info_get_name(property.get());
            if (!candidate) continue;
            if (candidates) candidates->emplace_back(candidate);
            if (name == candidate) found = true;
        }
        InfoPtr parent = info_ptr(reinterpret_cast<GIBaseInfo *>(
            g_object_info_get_parent(object)));
        if (parent && find_property(parent.get(), name, candidates)) found = true;
        return found;
    }

    bool find_signal(GIBaseInfo *type, const std::string &name,
                     std::vector<std::string> *candidates)
    {
        if (!type) return false;
        bool found = false;
        GIInfoType kind = g_base_info_get_type(type);
        if (kind == GI_INFO_TYPE_OBJECT) {
            GIObjectInfo *object = reinterpret_cast<GIObjectInfo *>(type);
            for (int i = 0; i < g_object_info_get_n_signals(object); ++i) {
                InfoPtr signal = info_ptr(reinterpret_cast<GIBaseInfo *>(
                    g_object_info_get_signal(object, i)));
                const char *candidate = g_base_info_get_name(signal.get());
                if (!candidate) continue;
                if (candidates) candidates->emplace_back(candidate);
                if (name == candidate) found = true;
            }
            for (int i = 0; i < g_object_info_get_n_interfaces(object); ++i) {
                InfoPtr interface_info = info_ptr(reinterpret_cast<GIBaseInfo *>(
                    g_object_info_get_interface(object, i)));
                if (find_signal(interface_info.get(), name, candidates)) found = true;
            }
            InfoPtr parent = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_object_info_get_parent(object)));
            if (parent && find_signal(parent.get(), name, candidates)) found = true;
        } else if (kind == GI_INFO_TYPE_INTERFACE) {
            GIInterfaceInfo *interface_info = reinterpret_cast<GIInterfaceInfo *>(type);
            for (int i = 0; i < g_interface_info_get_n_signals(interface_info); ++i) {
                InfoPtr signal = info_ptr(reinterpret_cast<GIBaseInfo *>(
                    g_interface_info_get_signal(interface_info, i)));
                const char *candidate = g_base_info_get_name(signal.get());
                if (!candidate) continue;
                if (candidates) candidates->emplace_back(candidate);
                if (name == candidate) found = true;
            }
        }
        return found;
    }

    bool find_field(GIStructInfo *structure, const std::string &name,
                    std::vector<std::string> *candidates)
    {
        bool found = false;
        for (int i = 0; i < g_struct_info_get_n_fields(structure); ++i) {
            InfoPtr field = info_ptr(reinterpret_cast<GIBaseInfo *>(
                g_struct_info_get_field(structure, i)));
            const char *candidate = g_base_info_get_name(field.get());
            if (!candidate) continue;
            if (candidates) candidates->emplace_back(candidate);
            if (name == candidate) found = true;
        }
        return found;
    }
};

} // namespace

std::unique_ptr<MetadataProvider> make_gi_metadata_provider()
{
    return std::unique_ptr<MetadataProvider>(new GiMetadataProvider());
}

} // namespace sqgicheck
