#pragma once
#include <glib-object.h>

G_BEGIN_DECLS

#define STUDY_TYPE_COUNTER (study_counter_get_type())
G_DECLARE_FINAL_TYPE(StudyCounter, study_counter, STUDY, COUNTER, GObject)

/**
 * study_counter_new:
 *
 * Returns: (transfer full): a counter starting at 40
 */
StudyCounter *study_counter_new(void);

/**
 * study_counter_add:
 * @self: the counter
 * @amount: increment, limited to the range -1000 to 1000
 *
 * Updates the value and emits StudyCounter::changed exactly once.
 * Returns: the new counter value
 */
gint study_counter_add(StudyCounter *self, gint amount);

/**
 * study_counter_get_revision:
 * @self: the counter
 *
 * Returns: the compiled fixture revision, initially 42
 */
gint study_counter_get_revision(StudyCounter *self);

G_END_DECLS
