#include "sq-hello.h"

/**
 * sq_hello_add:
 * @a: first value
 * @b: second value
 *
 * Returns: the sum of @a and @b.
 */
gint
sq_hello_add(gint a, gint b)
{
    return a + b;
}

/**
 * sq_hello_greet:
 * @name: name to greet
 *
 * Returns: (transfer full): a newly allocated greeting.
 */
gchar *
sq_hello_greet(const gchar *name)
{
    return g_strdup_printf("Hello, %s from native GI", name);
}
