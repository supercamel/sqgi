#pragma once

#include <glib-object.h>

G_BEGIN_DECLS

#define SQ_RUST_TYPE_COUNTER (sq_rust_counter_get_type())
G_DECLARE_FINAL_TYPE(SqRustCounter, sq_rust_counter, SQ_RUST, COUNTER, GObject)

/**
 * sq_rust_counter_new:
 *
 * Returns: (transfer full): a new Rust-backed counter.
 */
SqRustCounter *sq_rust_counter_new(void);

/**
 * sq_rust_counter_add:
 * @self: a counter
 * @delta: value to add
 *
 * Adds @delta to the counter, emits `changed`, and returns the new value.
 *
 * Returns: the new counter value.
 */
gint sq_rust_counter_add(SqRustCounter *self, gint delta);

/**
 * sq_rust_counter_get_value:
 * @self: a counter
 *
 * Returns: the current counter value.
 */
gint sq_rust_counter_get_value(SqRustCounter *self);

/**
 * sq_rust_counter_describe:
 * @self: a counter
 *
 * Returns: (transfer full): a short counter description.
 */
gchar *sq_rust_counter_describe(SqRustCounter *self);

G_END_DECLS
